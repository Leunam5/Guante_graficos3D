const int  xPin=A4;      // eje x en el pin analógico 4
const int  yPin = A3 ;   
const int  zPin = A2 ; 

int minVal = 334;   //valores obtenidos de una prueba anterior
int maxVal = 400;
int x;      
int y;  
int z;

 void setup ( ) { 
  pinMode(xPin,INPUT);
  pinMode(yPin,INPUT);
  pinMode(zPin,INPUT);
  Serial.begin(9600);  
 }

void loop(){
 int xRead = analogRead(xPin);     
 int yRead = analogRead(yPin);  
 int zRead = analogRead(zPin);

 int xAng = map(xRead, 332, 400, 0, 100); 
 int yAng = map(yRead, 330, 405, 0, 100);  
 int zAng = map(zRead, minVal, maxVal, 0, 100); 

  x=xAng;
  y=yAng;
  z=zAng;

 Serial.print(x);  
 Serial.print(",");  
 Serial.print(y);  
 Serial.print(",");  
 Serial.println(z);
 delay(500);
}

