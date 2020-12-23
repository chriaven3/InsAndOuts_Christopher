#include <Servo.h> //Include arduino servo library
Servo servo; //Creates Servo object

const int servoPin = 9;
const int POT = A0;
const int piezo = 2; // deefines the piezo pin
int BUTTON = 3;  //Button
int BUTTON2 = 5;  // honking 


bool windshield = false;

int angle; //varible to track servo position in degrees
int val = 0; //for button
int valH = 0; //for horn(button2)

int POTval = 0;
int BUTTONval = 0; //button 1 only

void setup() {
  servo.attach(servoPin);  //attach servo object to control pin

  pinMode(BUTTON, INPUT);    // declare pushbutton as input

  Serial.begin(9600);  //enables serial comminication for debugging and byte transfer ^^
}


void loop() {
  POTval = analogRead(POT);
  POTval = map(POTval, 0, 1023, 2, 255); //
  //  POTval = POTval / 4;   //divide by 4 to get byte size 0-255
  delay(100);
  BUTTONval = digitalRead(BUTTON);


  val = digitalRead(BUTTON);  // read input value
  valH = digitalRead(BUTTON2); //read if horn pressed
  delay(15);
  if (valH == HIGH) {
     tone(piezo, 698, 1000);                   //F note ^5
    delay(1000);
  }
  //angle = analogRead(POT);
  //angle = map(angle, 0, 1023, 0 , 180);  //change pot
  //servo.write(angle);
  //delay(15);

  Serial.write(POTval);   //sends the bytes on over
  Serial.write(BUTTONval);

 // if (POTval > 1000) {
 //   POTval = analogRead(POT);
  //  windshield = true;
 // }

//  if (windshield = true) {
 //   POTval = analogRead(POT);         
    servo.write(30);                //
    delay(225);                   //
    servo.write(160);           //
    delay(225);               //
 //   if (POTval < 100) {
 //     POTval = analogRead(POT);
  //    windshield = false;
 //   }
 // }
}
