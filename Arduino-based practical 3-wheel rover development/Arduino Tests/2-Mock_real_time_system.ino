// Real-time loops
double t_cur = 0;
double t_pre = 0;
double t_ini = 0;
double t_rel = 0;
double t_elapsed = 0;
int loop_num = 0;
double t_interval = 50;     // Time triggering interval = 50 ms

// Model parameter
float rover_radius = 0.13;

// Initial states
float x_ini = -0.8;
float y_ini = 0.2;
float theta_ini = PI/5;

// Current status
float x_cur = 0;
float y_cur = 0;
float theta_cur = 0;

// Previous status
float x_pre = 0;
float y_pre = 0;
float theta_pre = 0;

// Reference states
float x_d = 0;
float y_d = 0;
float theta_d = 0;

float x_dot_d = 0;
float y_dot_d = 0;
float theta_dot_d = 0;

// Motor speed (control input)
float v0 = 0;
float v1 = 0;
float v2 = 0;

// Previous motor speed (previous set of control input)
float v0_pre = 0;
float v1_pre = 0;
float v2_pre = 0;

// Tracking error 
// Proportional part
// Current position tracking error
float delta_x = 0;
float delta_y = 0;
float delta_theta = 0;

//////////////////////////////// This part is used for one rover test
// Previous position tracking error
float pre_delta_x = 0;
float pre_delta_y = 0;
float pre_delta_theta = 0;

// Derivative part
float dot_delta_x = 0;
float dot_delta_y = 0;
float dot_delta_theta = 0;

// Integration part
float cum_delta_x = 0;
float cum_delta_y = 0;
float cum_delta_theta = 0;

//////////////////////////////////// Set up some reference parameters
float R = 2;
float w = 0.1;

////////////////////////////////

// Controller parameters    ////////////////////////////////////////////
float Kp = 1;
float Ki = 0;
float Kd = 0.5;

// Nominal control input values
float u_nom_x = 0;
float u_nom_y = 0;
float u_nom_theta = 0;

// Saturation limitation of actuators
float v_max = 4;


void setup() {
  // put your setup code here, to run once:

  Serial1.begin(115200);

  delay(6000);

  t_ini = micros();
  t_pre = t_ini;

  x_pre = x_ini;
  y_pre = y_ini;
  theta_pre = theta_ini;

}

void loop() {
  // put your main code here, to run repeatedly:

  t_cur = micros();
  t_rel = (micros() - t_ini)/1000.000;
  if ( t_rel > (double) loop_num * 50) {
      Serial.print("The current time (second) is: ");
      printDouble(t_rel/1000.0,100000);
      t_elapsed = (t_cur - t_pre)/1000000.0;

      ////////////////////////////////////////////////////////////////////////////////// Sensing part
      // Method 0: Use previous control input to predict
      x_cur = x_pre + (- sin(theta_pre) * v0_pre - sin(PI/3 - theta_pre) * v1_pre + sin(PI/3 + theta_pre) * v2_pre ) * t_elapsed;
      y_cur = y_pre + (  cos(theta_pre) * v0_pre - cos(PI/3 - theta_pre) * v1_pre - cos(PI/3 + theta_pre) * v2_pre ) * t_elapsed;
      theta_cur = theta_pre + ( v0_pre + v1_pre + v2_pre ) * t_elapsed / rover_radius;


      ////////////////////////////////////////////////////////////////////////////////// Reference receiving part
      // Method 0: Self-generation
      x_d = R * cos(w * t_rel/1000.0);
      y_d = R * sin(w * t_rel/1000.0);
      theta_d = 0;

      x_dot_d = - w * R * sin(w * t_rel/1000.0);
      y_dot_d = w * R * cos(w * t_rel/1000.0);
      theta_dot_d = 0;


      ////////////////////////////////////////////////////////////////////////////////// Error calculation
      // Position tracking error
      delta_x = x_cur - x_d;
      delta_y = y_cur - y_d;
      delta_theta = theta_cur - theta_d;

      // Nominal control input
      u_nom_x     = - Kp * delta_x + x_dot_d;        
      u_nom_y     = - Kp * delta_y + y_dot_d;
      u_nom_theta = - Kp * delta_theta + theta_dot_d;  

      // Convert to wheel speed
      v0 = -sin(theta_cur)        *2/3 * u_nom_x + cos(theta_cur)        *2/3 * u_nom_y + rover_radius * u_nom_theta /3;
      v1 = -sin(PI/3 - theta_cur) *2/3 * u_nom_x - cos(PI/3 - theta_cur) *2/3 * u_nom_y + rover_radius * u_nom_theta /3;
      v2 =  sin(PI/3 + theta_cur) *2/3 * u_nom_x - cos(PI/3 + theta_cur) *2/3 * u_nom_y + rover_radius * u_nom_theta /3;

      // Store information
      t_pre = t_cur;
      v0_pre = v0;
      v1_pre = v1;
      v2_pre = v2;

      x_pre = x_cur;
      y_pre = y_cur;
      theta_pre = theta_cur;

      Serial.println("The current error is: ");
      Serial.print(delta_x);
      Serial.print(", ");
      Serial.print(delta_y);
      Serial.print(", ");
      Serial.print(delta_theta);
      Serial.print("\n");

      Serial.println("The control input (m/s) is: ");
      Serial.print(v0);
      Serial.print(", ");
      Serial.print(v1);
      Serial.print(", ");
      Serial.print(v2);
      Serial.print("\n");

      loop_num ++;
  }

}

void printDouble( double val, unsigned int precision){
// prints val with number of decimal places determine by precision
// NOTE: precision is 1 followed by the number of zeros for the desired number of decimial places
// example: printDouble( 3.1415, 100); // prints 3.14 (two decimal places)

    Serial.print (int(val));  //prints the int part
    Serial.print("."); // print the decimal point
    unsigned int frac;
    unsigned int tem;
    if(val >= 0)
        frac = (val - int(val)) * precision;
    else
        frac = (int(val)- val ) * precision;

    tem = frac * 10.0;
    while (((tem<precision)) and (tem>0)) {
      Serial.print("0");
      tem = tem * 10.0;
      }
    Serial.println(frac,DEC) ;
} 
