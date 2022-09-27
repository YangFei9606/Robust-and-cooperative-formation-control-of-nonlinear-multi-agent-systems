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

int pack_num = 0;

////////////////////////////////////////////////////////////////////////////////////////////////////// The serial number for the rover (i = ?)
int serial_num = 1;

////////////////////////////////////////////////////////////////////////////////////////////////////// Defining the IP address used for communication
// Data base
IPAddress ip_host(129,127,0,0);     // The IP for the host computer (will be updated if necessary)
IPAddress ip_agent1(172,20,10,11);
IPAddress ip_agent2(172,20,10,12);
IPAddress ip_agent3(172,20,10,13);

// Self IP address
IPAddress ip_myself = ip_agent1;   // A static IP for the Arduino (agent)

// Agent topology
float topology[3] = {0,0,0};
int i = 0;
int read_pos = 0;

// Data reading buff
byte info_host[10];

unsigned int localPort = 2390;      // local port to listen on

char packetBuffer[255]; //buffer to hold incoming packet
char ReplyBuffer[] = "a0";       // a string to send back (Indicating agent i has received)

WiFiUDP Udp;
WiFiClient client;

void setup() {
  //Initialize serial and wait for port to open:
  Serial.begin(9600);
  while (!Serial) {
    ; // wait for serial port to connect. Needed for native USB port only
  }

  // check for the presence of the shield:
  if (WiFi.status() == WL_NO_SHIELD) {
    Serial.println("WiFi shield not present");
    // don't continue:
    while (true);
  }

  WiFi.config(ip_myself);

  // attempt to connect to WiFi network:
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

  Serial.println("\nStarting connection to server...");
  // if you get a connection, report back via serial:
  Udp.begin(localPort);


  // The first step is to get the host IP broadcasted by the computer
  int packetSize = Udp.parsePacket();
  while (packetSize == 0)
  {
    // Keeps on reading until the host IP is obtained
    packetSize = Udp.parsePacket();
    if (packetSize)
    {
      // If something is received
      ip_host = Udp.remoteIP();
      Serial.print("Received packet of size ");
      Serial.println(packetSize);
      Serial.print("From ");
      Serial.print(ip_host);
      Serial.print(", port ");
      Serial.println(Udp.remotePort());

      int len = Udp.read(packetBuffer, 255);
      if (len > 0) packetBuffer[len] = 0;

      Serial.println("Contents: ");
      Serial.println(packetBuffer);

      Serial.println("Size of contents: ");
      Serial.println(len);

      String temp_packet = packetBuffer;
      String temp;
      int info_pos = 0;

      for ( i=0; i<2; i++)
      {
          info_pos = temp_packet.indexOf(",");
          temp = temp_packet.substring(0,info_pos);
          topology[i] = temp.toFloat();
          temp_packet.remove(0,info_pos+1);
        
      }

      topology[2] = temp_packet.toFloat();

      Serial.println("Topology information is:");
      for (i=0;i<3;i++)
      {
          Serial.println(topology[i]);
      }
      pack_num++;


    }
  }


/*
  int server_flag = client.connect(ip_host,1234);
  while (server_flag < 1)
  {
    Serial.println("Can't connect to server, try again.");
    server_flag = client.connect(ip_host,1234);
  }
  Serial.println("Server connected.");

  */

  



  
}

void loop() {

  // if there's data available, read a packet

  /*
  read_pos = 0;
  if (client.available()>0)
  {
    while (client.available()>0 and read_pos<9)
    {
        info_host[read_pos] = client.read();
        read_pos ++;
    }
  }

  Serial.print("New content is received: ");
  Serial.println(info_host); */
  int packetSize = Udp.parsePacket();
  packetSize = Udp.parsePacket();
    if (packetSize)
    {
      // If something is received
      ip_host = Udp.remoteIP();
      Serial.print("Received packet of size ");
      Serial.println(packetSize);
      Serial.print("From ");
      Serial.print(ip_host);
      Serial.print(", port ");
      Serial.println(Udp.remotePort());

      int len = Udp.read(packetBuffer, 255);
      if (len > 0) packetBuffer[len] = 0;

      Serial.println("Contents: ");
      Serial.println(packetBuffer);

      Serial.println("Size of contents: ");
      Serial.println(len);

      String temp_packet = packetBuffer;
      String temp;
      int info_pos = 0;

      for ( i=0; i<2; i++)
      {
          info_pos = temp_packet.indexOf(",");
          temp = temp_packet.substring(0,info_pos);
          topology[i] = temp.toFloat();
          temp_packet.remove(0,info_pos+1);
          
        
      }

      topology[2] = temp_packet.toFloat();

      Serial.println("Topology information is:");
      for (i=0;i<3;i++)
      {
          Serial.println(topology[i]);
      }
      pack_num++;

      Serial.println("The pack number is: ");
      Serial.println(pack_num);

    }


  
}











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
