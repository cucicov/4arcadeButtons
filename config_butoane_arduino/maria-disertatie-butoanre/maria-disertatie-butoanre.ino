/*
  Button

  Turns on and off a light emitting diode(LED) connected to digital pin 13,
  when pressing a pushbutton attached to pin 2.

  The circuit:
  - LED attached from pin 13 to ground
  - pushbutton attached to pin 2 from +5V
  - 10K resistor attached to pin 2 from ground

  - Note: on most Arduinos there is already an LED on the board
    attached to pin 13.

  created 2005
  by DojoDave <http://www.0j0.org>
  modified 30 Aug 2011
  by Tom Igoe

  This example code is in the public domain.

  http://www.arduino.cc/en/Tutorial/Button
*/

// constants won't change. They're used here to set pin numbers:
const int buttonPin1 = 2;     
const int buttonPin2 = 4;     
const int buttonPin3 = 7;     
const int buttonPin4 = 8;     
const int ledPin1 =  9;
const int ledPin2 =  6;
const int ledPin3 =  5;
const int ledPin4 =  3;

// variables will change:
int buttonState1 = 0;         
int buttonState2 = 0;         
int buttonState3 = 0;         
int buttonState4= 0;         
int passButtonValue = 0;

void setup() {
  // initialize the LED pin as an output:
  pinMode(ledPin1, OUTPUT);
  pinMode(ledPin2, OUTPUT);
  pinMode(ledPin3, OUTPUT);
  pinMode(ledPin4, OUTPUT);
  // initialize the pushbutton pin as an input:
  pinMode(buttonPin1, INPUT);
  pinMode(buttonPin2, INPUT);
  pinMode(buttonPin3, INPUT);
  pinMode(buttonPin4, INPUT);
  Serial.begin(9600);
}

void loop() {
  // read the state of the pushbutton value:
  buttonState1 = digitalRead(buttonPin1);
  buttonState2 = digitalRead(buttonPin2);
  buttonState3 = digitalRead(buttonPin3);
  buttonState4 = digitalRead(buttonPin4);

  // check if the pushbutton is pressed. If it is, the buttonState is HIGH:
  if (buttonState1 == HIGH) {
    // turn LED on:
    digitalWrite(ledPin2, LOW);
    digitalWrite(ledPin3, LOW);
    digitalWrite(ledPin4, LOW);
    digitalWrite(ledPin1, HIGH);
    if (passButtonValue != 1) {
      Serial.println("1");
    }
    passButtonValue = 1;
  } else if (buttonState2 == HIGH) {
    // turn LED on:
    digitalWrite(ledPin1, LOW);
    digitalWrite(ledPin3, LOW);
    digitalWrite(ledPin4, LOW);
    digitalWrite(ledPin2, HIGH);
    if (passButtonValue != 2) {
      Serial.println("2");
    }
    passButtonValue = 2;
  } else if (buttonState3 == HIGH) {
    // turn LED on:
    digitalWrite(ledPin1, LOW);
    digitalWrite(ledPin2, LOW);
    digitalWrite(ledPin4, LOW);
    digitalWrite(ledPin3, HIGH);
    if (passButtonValue != 3) {
      Serial.println("3");
    }
    passButtonValue = 3;
  } else if (buttonState4 == HIGH) {
    // turn LED on:
    digitalWrite(ledPin1, LOW);
    digitalWrite(ledPin2, LOW);
    digitalWrite(ledPin3, LOW);
    digitalWrite(ledPin4, HIGH);
    if (passButtonValue != 4) {
      Serial.println("4");
    }
    passButtonValue = 4;
    
  } else {
    // turn LED off:
    if (passButtonValue != 0) {
      Serial.println("0");
    }
    passButtonValue = 0;
  }
}
