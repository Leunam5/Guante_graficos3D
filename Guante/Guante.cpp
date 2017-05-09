#include "Guante.h"

const int xPin = A4, yPin = A3, zPin = A2, dibPin = 6, borrPin = 5, coPin = 3, DPin = 2;
volatile int x = 0,  y = 0,  z = 0, color = 0, nD = 0 , dib_borr = 0;
int minVal = 344, maxVal = 400;
volatile bool sendFlag = false;

void inicializar() {
  pinMode(xPin, INPUT);
  pinMode(yPin, INPUT);
  pinMode(zPin, INPUT);
  pinMode(dibPin, INPUT_PULLUP);  //pin para dibujar
  pinMode(borrPin, INPUT_PULLUP);  //pin para borrar
  pinMode(coPin, INPUT_PULLUP);    // pin para cambiar color
  pinMode(DPin, INPUT_PULLUP);
  Serial.begin(9600);
  attachInterrupt(digitalPinToInterrupt(coPin), colorPincel, RISING);
  attachInterrupt(digitalPinToInterrupt(DPin), Dimension, RISING);
  Timer2init(); //inicializa el Timer2
}

void ejecutar() {

  if (digitalRead(dibPin) == LOW) {
    if (sendFlag) {
      dib_borr = 1;
      enviar();
      sendFlag = false;
    }
  }

  if (digitalRead(borrPin) == LOW) {
    if (sendFlag) {
      dib_borr = 2;
      enviar();
      sendFlag = false;
    }
  }
}

void Timer2init() {

  TCNT2 = 98;  //REGISTRO DE CONTADOR (reinicia el contador (255-98)=10ms
  TIMSK2 = 1;  //HABILITA LAS INTERRUPCIONES
  TCCR2A = 0;  // CONTROL DE REGISTRO A  (Modo Normal)
  TCCR2B = 7;  //CONTROL DE REGISTRO B  (prescalado)
}

ISR(TIMER2_OVF_vect) {

  TCNT2 = 98;

  int xRead = analogRead(xPin);
  int yRead = analogRead(yPin);
  int zRead = analogRead(zPin);

  int xAng = map(xRead, 332, 400, 400, 800);
  int yAng = map(yRead, 330, 405, 350, 700);
  int zAng = map(zRead, minVal, maxVal, 0, 100);

  x = xAng;
  y = yAng;
  z = zAng;

  sendFlag = true;
}

void enviar() {
  Serial.print(x);
  Serial.print(",");
  Serial.print(y);
  Serial.print(",");
  Serial.print(z);
  Serial.print(",");
  Serial.print(color);
  Serial.print(",");
  Serial.print(nD);
  Serial.print(",");
  Serial.println(dib_borr);
  delay(90);
}

void colorPincel() {
  if (color == 5 ) {
    color = 0;
  }
  color++;
  delayMicroseconds(15000);
}

void Dimension () {
  if (nD == 2 ) {
    nD = 0;
  }
  nD++;
  delayMicroseconds(15000);
}


