/*
  WiFi UDP Send and Receive String

 This sketch wait an UDP packet on localPort using a WiFi shield.
 When a packet is received an Acknowledge packet is sent to the client on port remotePort

 Circuit:
 * WiFi shield attached

 created 30 December 2012
 by dlf (Metodo2 srl)

 */


#include <SPI.h>
#include <WiFi101.h>
#include <WiFiUdp.h>

int status = WL_IDLE_STATUS;
char ssid[] = "MikeYang";        // your network SSID (name)
char pass[] = "abcd1234";    // your network password (use for WPA, or use as key for WEP)
int keyIndex = 0;            // your network key Index number (needed only for WEP)


// Flags and counters
int pack_num = 0;
int read_pos = 0;
int i = 0;
int j = 0;
int k = 0;
int m = 0;
int ini_flag = 0;   // The flag for initialisation

////////////////////////////////////////////////////////////////////////////////////////////////////// Basic parameter for the system design
#define serial_num 1
#define agent_num 3
#define dimension 3
double step_size = 50000;          // Stands for 50ms here, but it might be changed
double ini_time = 0;
double pre_time = 0;
double cur_time = 0;


////////////////////////////////////////////////////////////////////////////////////////////////////// Defining the IP address used for communication
// Data base for IP Address
byte IP_base[agent_num+1][4] = 
{
  {172,20,0,0},                      // The IP for the host computer (will be updated if necessary)
  {172,20,10,11},                     // The IP for the agent 1
  {172,20,10,12},                     // The IP for the agent 2
  {172,20,10,13}                      // The IP for the agent 3
};

IPAddress ip_temp(0,0,0,0);     // A temporary variable
IPAddress ip_myself = IP_base[serial_num];   // A static IP for the Arduino (agent)

// Agent topology
float topology[agent_num] = {0,0,0};

/////////////////////////////////////////////////////////////////////////////////////////////////////// Data sent and received through WiFi
// Receive from PC
// Data for receiving
char info_pc[10];
float info_processed[10];


// Data for calculation
float agent_pos[dimension] = {0,0,0};
float pos_ref[dimension] = {0,0,0};
float vel_ref[dimension] = {0,0,0};

// Received status from other agents
float sys_error[agent_num][dimension] = 
{
    {0,0,0},
    {0,0,0},
    {0,0,0}
};

// Variables for controller
float delta_pos[3] = {0,0,0};
float e_pos[3] = {0,0,0};
char tcp_host_read[100];
int tcp_read_flag;


/////////////////////////////////////////////////////////////////////////////////////////////////////// UDP communication
byte info_host[50];
unsigned int localPort = 2390;      // local port to listen on

char packetBuffer[10]; //buffer to hold incoming packet

/////////////////////////////////////////////////////////////////////////////////////////////////////// communication ports and clients

WiFiUDP Udp;
WiFiClient client_pc;
WiFiClient client_agent;

// Group information for clients (use vector to select the client information)
byte client_base[agent_num+1] = {0,0,0,0};    // 0: PC 1-3: Agents 


// Testing variables
double alarm_1;
double alarm_2;
double t_spend;



void setup() {
  ///////////////////////////////////////////////////////////////////////////////////////////////////// Initialize serial and wait for port to open:
  Serial.begin(9600);
  while (!Serial) {
    ; // wait for serial port to connect. Needed for native USB port only
  }

  ///////////////////////////////////////////////////////////////////////////////////////////////////// Check for the presence of the shield:
  if (WiFi.status() == WL_NO_SHIELD) {
    Serial.println("WiFi shield not present");
    // don't continue:
    while (true);
  }

  ///////////////////////////////////////////////////////////////////////////////////////////////////// Fix the IP Address of this board
  WiFi.config(ip_myself);

  ///////////////////////////////////////////////////////////////////////////////////////////////////// Attempt to connect to WiFi network:
  while ( status != WL_CONNECTED) {
    Serial.print("Attempting to connect to SSID: ");
    Serial.println(ssid);
    // Connect to WPA/WPA2 network. Change this line if using open or WEP network:
    status = WiFi.begin(ssid, pass);

    // wait 10 seconds for connection:
    delay(10000);
  }
  Serial.println("Connected to wifi");
  printWiFiStatus();

  ///////////////////////////////////////////////////////////////////////////////////////////////////// Start UDP connection first
  Serial.println("\nStarting UDP communication");
  Udp.begin(localPort);

  // The first step is to get the host IP, system topology and step size sent by the computer
  int packetSize = Udp.parsePacket();
  while (packetSize <8)      // Ensure that the correct package is received
  {
    // Keeps on reading until the host IP is obtained
    packetSize = Udp.parsePacket();
    if (packetSize)
    {
      // If something is received
      ip_temp = Udp.remoteIP();

      // Get the host IP
      for (i=0;i<4;i++)
      {
          IP_base[0][i] = ip_temp[i];
      }
      Serial.print("Received packet of size ");
      Serial.println(packetSize);
      Serial.print("From ");
      Serial.print(ip_temp);
      Serial.print(", port ");
      Serial.println(Udp.remotePort());

      int len = Udp.read(packetBuffer, 255);
      if (len > 0) packetBuffer[len] = 0;

      Serial.println("Contents: ");
      Serial.println(packetBuffer);

      String temp_packet = packetBuffer;
      String temp;

      /////////////// Read out the topology and the real-time step size 
      for ( i=0; i<4; i++)
      {
          if (i<3)    // Read the topology info
          {
            read_pos = temp_packet.indexOf(",");
            temp = temp_packet.substring(0,read_pos);
            topology[i] = temp.toFloat();
            temp_packet.remove(0,read_pos+1);  
          }
          else
          {
            step_size = (double) 1000.0 * temp_packet.toInt();      // Transfer to milliseconds
          }
      }
      Serial.println("Topology information is:");
      for (i=0;i<3;i++)
      {
          Serial.println(topology[i]);
      }
      Serial.println("The step size is:");
      Serial.println(step_size); 
    }
  }

  ///////////////////////////////////////////////////////////////////////////////////////////////////// Start the TCP connection with PC
  Serial.println("\nStarting TCP communication with PC");
  j = client_pc.connect(IP_base[0],1234);
  while (j != 1)  
  {
    Serial.println("Can't connect to server, try again.");
    j = client_pc.connect(IP_base[0], 1234);
  }
  //Serial.println(client_pc);
  Serial.println("TCP connection to the host PC has been established.");

  /////////////////// Telling the PC your identity (serial_num)
  tcp_read_flag = 0;
  while (tcp_read_flag < 1)
  {
    tcp_read_flag = client_pc.read();
    if (tcp_read_flag == 1)
    {
        client_pc.write((byte) serial_num);
        Serial.println("Rover id is sent.");
        break;
    }  
  }
  
  ///////////////////////////////////////////////////////////////////////////////////////////////////// Clear out the UDP buffer
  Serial.println("Now we clear out the UDP buffer.");
  packetSize = Udp.parsePacket();
  if (packetSize)
  {
    // If there are still something in the buffer, clear it out
    int len = Udp.read(packetBuffer, 255);
    if (len > 0) packetBuffer[len] = 0;
  }

  ///////////////////////////////////////////////////////////////////////////////////////////////////// Start the TCP connection with other agents

  


  ///////////////////////////////////////////////////////////////////////////////////////////////////// Talk to PC if every connection is built




  
  
}

void loop() {

  ///////////////////////////////////////////////////////////////////////////////////////////////////// The first step is to receive feedback and commends from PC
  alarm_1 = millis();
  tcp_read_flag = 0;
  tcp_read_flag = client_pc.read();

  // Flags and buffer for reading
  char info_temp;
  int pre_pos = 0;

  if (tcp_read_flag == 2)  // Receive the flag of host info feeding
  {
    i = 0;
    j = 0;
    k = 0;
    Serial.println("Something new is coming");
    
    ///////////////////////////////////////////////////////////////////////// Get the info in strings and decompose them
    while (i < 10 and j<9)
    {
      if (client_pc.available()>0)
      {
        info_pc[i] = client_pc.read();
        
        // If a comma is read, this means one complete number is read
        if (info_pc[i] == ',')
        {
          info_pc[i] = '0';
          String temp_string = String(info_pc);
          info_processed[j]=temp_string.toFloat();
          Serial.print(info_processed[j]);
          Serial.print("\t");

          j++;
          // Flush the previous results 
          char info_pc[10];
          i = 0;
        }
        i++;   
      }  
    }
    pack_num ++;
    Serial.print("\n");

    // Time consuming testing
    alarm_2 = millis();
    t_spend = alarm_2 - alarm_1;
    Serial.println("The time spent is (ms):");
    Serial.println(t_spend);

    

    
    //Serial.println("The size of data is:");
    //Serial.println(j);

    Serial.println("The current packet number is:");
    Serial.println(pack_num);

    if (ini_flag == 0)   // This should be the first time
    {
      ini_flag = 1;
      ini_time = millis();
    }
  }
  
  


  
}










///////////////////////////////////////////////////////////////////////////////////////////////////// Print WiFi status

void printWiFiStatus() {
  // print the SSID of the network you're attached to:
  Serial.print("SSID: ");
  Serial.println(WiFi.SSID());

  // print your WiFi shield's IP address:
  IPAddress ip = WiFi.localIP();
  Serial.print("IP Address: ");
  Serial.println(ip);

  // print the received signal strength:
  long rssi = WiFi.RSSI();
  Serial.print("signal strength (RSSI):");
  Serial.print(rssi);
  Serial.println(" dBm");
}
