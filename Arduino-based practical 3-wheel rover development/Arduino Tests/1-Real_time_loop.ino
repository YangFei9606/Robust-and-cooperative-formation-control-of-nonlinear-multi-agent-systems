double t_cur;
double t_ini;
int loop_num = 1;

void setup() {
  // put your setup code here, to run once:

  Serial1.begin(115200);

  t_ini = micros();

}

void loop() {
  // put your main code here, to run repeatedly:
  
  t_cur = (micros() - t_ini)/1000.000;
  if ( t_cur > (double) loop_num * 50) {
      Serial.print("The current time (second) is: ");
      printDouble(t_cur/1000.0,100000);
      Serial.print("The current loop number is: ");
      Serial.println(loop_num);

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
    if(val >= 0)
        frac = (val - int(val)) * precision;
    else
        frac = (int(val)- val ) * precision;
    Serial.println(frac,DEC) ;
} 
