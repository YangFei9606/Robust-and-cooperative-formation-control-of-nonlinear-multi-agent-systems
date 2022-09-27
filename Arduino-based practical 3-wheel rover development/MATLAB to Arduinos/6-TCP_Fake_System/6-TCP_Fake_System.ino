
#include <SPI.h>
#include <WiFi101.h>
#include <WiFiUdp.h>
#include <AccelStepper.h>

// WiFi information
int status = WL_IDLE_STATUS;
//char ssid[] = "MikeYang";        // your network SSID (name)
//char pass[] = "abcd1234";    // your network password (use for WPA, or use as key for WEP)

char ssid[] = "EEELAB";        // your network SSID (name)
char pass[] = "@adelaide";    // your network password (use for WPA, or use as key for WEP)
int keyIndex = 0;            // your network key Index number (needed only for WEP)

// Flags and counters
int pack_num = 0;
int i = 0;
int j = 0;
int ini_flag = 0;   // The flag for initialisation
int tcp_read_flag;  // TCP read flag

////////////////////////////////////////////////////////////////////////////////////////////////////// Basic parameter for the system design (NEED CHANGE)
#define serial_num 1
#define agent_num 3
#define dimension 3
#define trans_digits 3             // How many digits are kept in each double number
double step_size_control = 0;          // Stands for 50ms here, but it might be changed (unit: ms) This will be updated by the PC's commends
// Keep track of the current time
double ini_time = 0;
double pre_time = 0;
double cur_time = 0;


// IP related information/initialisation
// Data base for IP Address (PC & agents)
//byte IP_base[agent_num+1][4] =
//{
//  {172,20,0,0},                      // The IP for the host computer (will be updated if necessary)
//  {172,20,10,11},                     // The IP for the agent 1
//  {172,20,10,12},                     // The IP for the agent 2
//  {172,20,10,13}                      // The IP for the agent 3
//};


byte IP_base[agent_num+1][4] =
{
  {129,127,29,0},                      // The IP for the host computer (will be updated if necessary)
  {129,127,29,11},                     // The IP for the agent 1
  {129,127,29,12},                     // The IP for the agent 2
  {129,127,29,13}                      // The IP for the agent 3
};

IPAddress ip_temp(0,0,0,0);     // A temporary variable
IPAddress ip_myself = IP_base[serial_num];   // A static IP for the Arduino (agent)

// Agent topology
double topology_receive[agent_num] = {0,0,0};      // The in-degree part of topology (who should send info to me)
double topology_send[agent_num] = {0,0,0};         // The out-degree part of topology (who should I send info to)

/////////////////////////////////////////////////////////////////////////////////////////////////////// Data sent and received through WiFi
// Buffer for data transmission between agent and computer (one double number takes 4 bytes = 2 x 2)
byte pc_data_buffer[40];                    // Keep sufficient space for x_i, x_di and v_di (larger than 3 x 2 x 2 x 3)
// Buffer for data transmission among agents
byte agent_data_buffer[16];                 // Keep sufficient space for delta_xi (larger than 3 x 2 x 2)
double data_to_pc[6];                        // Keep sufficient space for delta_xi (larger than 6 x 2 x 2)

// Temporary buffer for data transfer (between int and byte)
byte temp_data_transfer[2];

// Data for calculation
double agent_pos[dimension] = {0,0,0};
double pos_ref[dimension] = {0,0,0};
double vel_ref[dimension] = {0,0,0};
double convert_data_buffer[9];     // This buffer holds the data converged from byte to double

// Received status from other agents
double sys_error[agent_num][dimension] =
{
    {0,0,0},
    {0,0,0},
    {0,0,0}
};

// Buffer to send the control input to the host PC
double send_to_pc[dimension] = {0,0,0};

// Variables for controller
double v_d[3] = {0,0,0};            // The velocity reference
double delta_pos[3] = {0,0,0};      // Reference tracking error
double e_pos[3] = {0,0,0};          // Local formation tracking error
double w_hat[3] = {0,0,0};          // Estimation of the system uncertainty (Might not be used)
double theta = 0;                   // The angular status of the rover
double u_nom[3] = {0,0,0};
double u_actual[3] = {0,0,0};

// System parameters of the ODR
double rover_R = 0.13;
double wheel_R = 0.05;

// UDP communication 
WiFiUDP Udp;
byte info_host[50];
unsigned int localPort = 2390;      // local port to listen on

char packetBuffer[10]; //buffer to hold incoming packet

// Communication ports and clients
WiFiClient client_pc;
WiFiClient client_agent;

// Alarms and clocks
double alarm_1;
double alarm_2;

// Controller parameters
double k_p = 2;
double const_2_3 = (double) 2/3;
double const_r = (double) rover_R/3;

////// Motor set up and parameters
// Define some steppers and the pins the will use
AccelStepper stepper1(AccelStepper::DRIVER, 5,4); // Defaults to AccelStepper::FULL4WIRE (4 pins) on 2, 3, 4, 5
AccelStepper stepper2(AccelStepper::DRIVER, 10,9);
AccelStepper stepper3(AccelStepper::DRIVER, 7,6);

double motor_max_speed = 2500;          // Note: this is in steps/second
//double motor_max_speed = 4000;          // Note: this is in steps/second
double step_size_motor = (double) 1/4;                 // 1 common step is 1.8 degrees (1/4 step is steady and not too slow)
double gear_constant = 5.18;            // The amplifier needed for the
double satu_limit = ((double) motor_max_speed * step_size_motor * PI * wheel_R)/((double) gear_constant * 100.000); // Saturation limit in m/s
//double satu_limit = ((double) motor_max_speed * step_size_motor * PI * wheel_R);
//double satu_limit = 0.1979;
double motor_speed[3] = {0,0,0};        // The speed of the motors


void setup() {
  // Initialize serial and wait for port to open:
  Serial.begin(9600);

  // Wait for the serial connection (Comment out for practical usage)
//  while (!Serial) {
//    ; // wait for serial port to connect.
//  }

  Serial.println("The speed limit is: ");
  Serial.print(satu_limit);

  // Motor preparation
  preparing_motor(motor_max_speed);

  // Wifi connection
  if (WiFi.status() == WL_NO_SHIELD) {
    Serial.println("WiFi shield not present");
    // don't continue:
    while (true);
  }

  WiFi.config(ip_myself);  // Fix the board's IP
  connect_to_wifi();       // Try to connect to the WIFI
  Serial.println("Connected to wifi");
  print_WiFi_Status();

  // UDP communication to PC
  UDP_communication();       // The agent should know the in/out degrees and the control time step

  // Build up the TCP communication
  TCP_communication_construction();

  //Report your identity (serial number) to the PC
  report_identity();            // (Note: read_flag = 1 is used here for identity report)

  // Clear out UDP buffer
  clear_UDP_buffer();

  // Build up the connection with other agents (skipped for now)

  // Tell PC that everything is ready for you

  // Some initialisation
  tcp_read_flag = 0;

  

}

void loop() {

  ////// The main function starts here

  // Keep records of the time
  alarm_1 = micros();

  // Keeps reading from the PC
  tcp_read_flag = client_pc.read();



  // Flag == 2 indicates that the Arduino needs to read reference from the host PC
  if (tcp_read_flag == 2)  // Receive the flag of host info feeding (Note: read_flag = 2 is used here)
  {
    // A new control iteration starts now

    // Initialise the system if necessary  (STEP 1: Receive data from PC)
    if (ini_flag == 0)
    {
      ini_flag = 1;
      ini_time = micros();
    }

    // Read the reference/feedback from PC (in bytes)
    Serial.println("Something new is coming");
    read_from_TCP(client_pc, 3);

    // Allocate the data received to vectors: agent_pos, pos_ref and vel_ref
    for (i = 0; i < 3; i++)
    {
      u_actual[i] = convert_data_buffer[i];
    }

    // Reset the reading flag to be ready for the next reading
    tcp_read_flag = 0;

    // Find out the overall time consumption of PC-Arduino communication (Testing purpose, can be commented)
    alarm_2 = micros();
    print_Time_of_Task(alarm_1,alarm_2);

    // Print out the number of received packets (Testing purpose, can be commented)
    pack_num ++;
    Serial.println("The current packet number is:");
    Serial.println(pack_num);

    Serial.println("The nominal control input is: ");
    print_a_vector(u_nom, 3);
    

    // Saturation phenomenon
    u_actual[0] = min(satu_limit, max(-satu_limit, u_actual[0]) );
    u_actual[1] = min(satu_limit, max(-satu_limit, u_actual[1]) );
    u_actual[2] = min(satu_limit, max(-satu_limit, u_actual[2]) );

    Serial.println("The saturated control input is: ");
    print_a_vector(u_actual, 3);
    

    // STEP 2.4: Convert the control inputs into motor speed (steps/second)
    motor_speed[0] = (double) u_actual[0]/(PI * wheel_R) * 100 /step_size_motor * gear_constant;
    motor_speed[1] = (double) u_actual[1]/(PI * wheel_R) * 100 /step_size_motor * gear_constant;
    motor_speed[2] = (double) u_actual[2]/(PI * wheel_R) * 100 /step_size_motor * gear_constant;
    

    // STEP 2.5: Drive the motor
    drive_motor(motor_speed);


    // The last step is to RESET the reading flag
    tcp_read_flag = 0;
  }

  // End the formation tracking process
  if (tcp_read_flag == 4)
  {
    motor_speed[0] = 0;
    motor_speed[1] = 0;
    motor_speed[2] = 0;
    Serial.println("The task has ended.");
  }

  drive_motor(motor_speed);

}



////////////////////////////////////////////////////////////////////////// Built in functions (presented in the order of implementation)

void preparing_motor(double max_speed)
{
  stepper1.setMaxSpeed(max_speed);
  stepper2.setMaxSpeed(max_speed);
  stepper3.setMaxSpeed(max_speed);

  stepper1.setSpeed(100);
  stepper2.setSpeed(100);
  stepper3.setSpeed(100);
}

///////////////////////////////////////////////////////////////// Print WiFi status

void connect_to_wifi()
{
  while ( status != WL_CONNECTED) {
    Serial.print("Attempting to connect to SSID: ");
    Serial.println(ssid);
    // Connect to WPA/WPA2 network. Change this line if using open or WEP network:
    status = WiFi.begin(ssid, pass);

    // wait 10 seconds for connection:
    delay(10000);
  }
}

void print_WiFi_Status()
{
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

void UDP_communication()
{
  Serial.println("\nStarting UDP communication");
  Udp.begin(localPort);
  // The first step is to get the host IP, system topology and step size sent by the computer
  int packetSize = Udp.parsePacket();
  int read_pos = 0;
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
      Serial.print("Received initial packet from address: ");
      Serial.print(ip_temp);
      int len = Udp.read(packetBuffer, 255);
      if (len > 0) packetBuffer[len] = 0;
      Serial.println("Contents: ");
      Serial.println(packetBuffer);
      String temp_packet = packetBuffer;
      String temp;
      /////////////// Read out the topology and the real-time step size
      // Read the receiving topology info  (For example: L_i = [2,-1,-1]. This is in-degree)
      for (i = 0; i < 3; i++)
      {
        read_pos = temp_packet.indexOf(",");
        temp = temp_packet.substring(0,read_pos);
        topology_receive[i] = temp.toDouble();
        temp_packet.remove(0,read_pos+1);
      }
      // Read the sending topology info     (For example: L_i = [1,-1,0]. This is out-degree)
      for (i = 0; i < 3; i++)
      {
        read_pos = temp_packet.indexOf(",");
        temp = temp_packet.substring(0,read_pos);
        topology_send[i] = temp.toDouble();
        temp_packet.remove(0,read_pos+1);
      }
      // Receive the step size of the system
      step_size_control = (double) 1000.0 * temp_packet.toInt();      // Transfer to milliseconds
      Serial.println("Topology information for data receiving is:");
      for (i=0;i<3;i++)
      {
          Serial.println(topology_receive[i]);
      }
      Serial.println("Topology information for data sending is:");
      for (i=0;i<3;i++)
      {
          Serial.println(topology_send[i]);
      }
      Serial.println("The step size is:");
      Serial.println(step_size_control);
    }
  }
}

void TCP_communication_construction()
{
  int temp_value = 0;
  Serial.println("\nStarting TCP communication with PC");
  temp_value = client_pc.connect(IP_base[0],1234);
  while (temp_value != 1)
  {
    Serial.println("Can't connect to server, try again.");
    temp_value = client_pc.connect(IP_base[0], 1234);
  }
  //Serial.println(client_pc);
  Serial.println("TCP connection to the host PC has been established.");
}

void report_identity()
{
  int read_flag = 0;
  while (read_flag < 1)
  {
    read_flag = client_pc.read();
    if (read_flag == 1)
    {
        client_pc.write((byte) serial_num);
        Serial.println("Rover id is sent.");
        break;
    }
  }
}

void clear_UDP_buffer()
{
  Serial.println("Now we clear out the UDP buffer.");
  int packetSize = Udp.parsePacket();
  if (packetSize)
  {
    // If there are still something in the buffer, clear it out
    int len = Udp.read(packetBuffer, 255);
    if (len > 0) packetBuffer[len] = 0;
  }
}

void print_Time_of_Task(double t_begin, double t_end)
{

  double t_diff = t_end - t_begin;

  Serial.println("The time spent is (ms):");
  Serial.println(t_diff/1000.0);

}

///////////////////////////////////////////////////////////////// Receive information from TCP communication
void read_from_TCP(WiFiClient client_read, int reading_number)
{
  // client_read: The Ip address that the arduino reads from
  // reading_number: The number of double numbers read from client_read
  // The data read will be stored in convert_data_buffer[9], you can pick out the useful ones afterwards
  i = 0;
  // Read the byte information from the client
  while (i < 4 * reading_number)   // Every double number accounts for 4 bytes
  {
    if (client_read.available()>0)
    {
      pc_data_buffer[i] = client_read.read();
      //Serial.println(pc_data_buffer[i]);
      i++;
    }
  }
  // Convert from byte to double
  for (i = 0; i < reading_number; i++)
  {
    int num_int = bytes2int(pc_data_buffer[4*i], pc_data_buffer[4*i+1]);
    int num_dec = bytes2int(pc_data_buffer[4*i+2], pc_data_buffer[4*i+3]);
    //Serial.println(num_int);
    //Serial.println((double) num_dec/pow(10,trans_digits));
    //Serial.println((double) num_dec/1000.00);
    convert_data_buffer[i] = num_int + num_dec/((double) pow(10,trans_digits));
  }
  byte pc_data_buffer[40];    // Flash the memory
}

void combine_data_to_pc()
{
  // Combine the e_pos and u_actual to send to the PC
  data_to_pc[0] = e_pos[0];
  data_to_pc[1] = e_pos[1];
  data_to_pc[2] = e_pos[2];

  data_to_pc[3] = u_actual[0];
  data_to_pc[4] = u_actual[1];
  data_to_pc[5] = u_actual[2];
  
}

int bytes2int(byte num_high, byte num_low)
{
  int result;
  int num_sign;

  num_sign = num_high >> 7;
  num_high = num_high << 1;
  num_high = num_high >> 1;

  result = num_low | (num_high << 8);
  result = result * (pow(-1,num_sign));
  return result;
}

void allocate_PC_data(int reading_number)
{
  for (i = 0; i < reading_number; i++)
    {
      if (i < 3)  // This is for system state (feedback), stored in "agent_pos"
      {
        agent_pos[i] = convert_data_buffer[i];
      }
      else if (i >= 3 and i < 6)  // This is for x_d, stored in "pos_ref"
      {
        pos_ref[i-3] = convert_data_buffer[i];
      }
      else   // This is for v_d/\dot{x}_d, stored in "vel_ref"
      {
        vel_ref[i-6] = convert_data_buffer[i];
      }
    }
}

///////////////////////////////////////////////////////////////// Send information through TCP communication
void send_Through_TCP(WiFiClient client_send, int sending_number, double data_to_send[], int tcp_flag)
{
  // client_send: The Ip address that the arduino sends to
  // sending_number: The number of double numbers sent to client_send
  // data_to_send: The vector that contains the double numbers we want to send out through TCP
  // tcp_flag: The tcp_flag that we use during the communication to ensure stability
  // First, we converge the double numbers into the byte form
  for (i = 0; i < sending_number; i++)
  {
    int temp_int = data_to_send[i];
    int2bytes(temp_int);
    for (j = 0; j < 2; j++)
    {
      agent_data_buffer[4*i+j] = temp_data_transfer[j];
    }
    int temp_float = 1000.0 * (data_to_send[i] - temp_int);
    int2bytes(temp_float);
    for (j = 0; j < 2; j++)
    {
      agent_data_buffer[4*i+j+2] = temp_data_transfer[j];
    }
  }
  Serial.println("The data is prepared.");
  // Then we send the information through TCP
  // Read till we get the correct flag
  tcp_read_flag = client_send.read();
  while (tcp_read_flag != tcp_flag)
  {
    tcp_read_flag = client_send.read();
  }
  // Now we send back
  i = 0;
  while (i < 4 * sending_number)
  {
    client_send.write(agent_data_buffer[i]);
    i++;
  }
  byte agent_data_buffer[16];

}

///////////////////////////////////////////////////////////////// Transfer an int number to bytes for communication
void int2bytes(int int_number) // Transfer an int number to 2 bytes
{
  // client_write: the client number that we will send information to
  // int_number: the number that needs to be transfered into
  // The byte form will be stored into the temp_data_transfer buffer in the order of [num_high, num_low]
  int magnitute;
  if (int_number >= 0)
  {
    temp_data_transfer[0] = (int_number >> 8) & 0xFF;
    temp_data_transfer[1] = (int_number & 0xFF);
  }
  else
  {
    magnitute = int_number * -1;
    temp_data_transfer[0] = (magnitute >> 8) & 0xFF;
    temp_data_transfer[0] = temp_data_transfer[0] ^ 0x80;
    temp_data_transfer[1] = magnitute & 0xFF;
  }
}


void print_a_vector(double vec_to_print[], int vec_size)
{
  int temp;
  for (temp = 0; temp < vec_size; temp++)
  {
    Serial.print(vec_to_print[temp]);
    Serial.print(", ");
  }
  Serial.print("\n");
}

void drive_motor(double motor_run_speed[])
{
  stepper1.setSpeed(-motor_run_speed[0]);
  stepper2.setSpeed(-motor_run_speed[1]);
  stepper3.setSpeed(-motor_run_speed[2]);

  stepper1.runSpeed();
  stepper2.runSpeed();
  stepper3.runSpeed();

}
