
#include <SPI.h>
#include <AccelStepper.h>

AccelStepper stepper1(AccelStepper::DRIVER, 5,4); // Defaults to AccelStepper::FULL4WIRE (4 pins) on 2, 3, 4, 5
AccelStepper stepper2(AccelStepper::DRIVER, 10,9);
AccelStepper stepper3(AccelStepper::DRIVER, 7,6);

double ref_speed[3] = {0.0667, -0.0333, -0.0333};

double max_speed = 2500;
double wheel_R = 0.05;
double rover_R = 0.13;
double step_size_motor = 1/4;
double gear_constant = 5.18;

double motor_speed[3];

double alarm_1 = 0;
double alarm_2 = 0;
double iteration = 0;
double it_step = 200*1000;

void setup() {
  // put your setup code here, to run once:
  motor_speed[0] = (double) ref_speed[0]/(PI * wheel_R) * 100 /step_size_motor * gear_constant;
  motor_speed[1] = (double) ref_speed[1]/(PI * wheel_R) * 100 /step_size_motor * gear_constant;
  motor_speed[2] = (double) ref_speed[2]/(PI * wheel_R) * 100 /step_size_motor * gear_constant;

  stepper1.setMaxSpeed(max_speed);
  stepper2.setMaxSpeed(max_speed);
  stepper3.setMaxSpeed(max_speed);

  stepper1.setSpeed(100);
  stepper2.setSpeed(100);
  stepper3.setSpeed(100);

  alarm_1 = micros();
}

void loop() {
  // put your main code here, to run repeatedly:
  alarm_2 = micros();
  if (alarm_2 - alarm_1 > it_step * iteration)
  {

    delay(8);
    
    iteration = iteration + 1;
    
  }

  stepper1.setSpeed(-motor_speed[0]);
  stepper2.setSpeed(-motor_speed[1]);
  stepper3.setSpeed(-motor_speed[2]);
  
  stepper1.runSpeed();
  stepper2.runSpeed();
  stepper3.runSpeed();


}
