#include <Arduino.h>
#ifndef Guante_h
#define Guante_h

void inicializar();
void ejecutar();
void Timer2init();
ISR(TIMER2_OVF_vect);
void enviar();
void colorPincel();
void Dimension();

#endif
