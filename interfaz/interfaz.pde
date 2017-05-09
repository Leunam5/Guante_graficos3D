import processing.serial.*;

// Objeto port tipo Serial
Serial port;
int x,y,z, colorP,nD=1, dib_borr;
int px=400,py=330,pz=330;
float gX, gY, gZ;
float pitch, roll;
int R=0,G=0,B=0;


  void setup(){
    background(255);
    size(800,600,P3D); 
    
    // Crea la nueva conexión 
    port = new Serial(this, Serial.list()[0], 9600);
    port.clear();
    // Realizar lecturas hasta un salto de línea
    port.bufferUntil('\n');
  
  }
  
  
  void draw(){
    noStroke();
    fill(200);
    rect(0,0,800,60);
    //rect(740,0,60,600);
  
    //title
    PFont font;
    fill(0, 102, 153);
    font = loadFont("LucidaBright-Italic-32.vlw");
    textFont(font, 32);
    textAlign(CENTER);
    text("GRAFICADOR 2D & 3D", 400, 40);
    strokeWeight(5);
     
      switch(nD){
     //2D
      case(1):
      //lapiz rojo
        if (colorP==2) {
           R=255; G=0; B=0;
        }
        
        //lapiz verde
        if (colorP==3) {
           R=0; G=255; B=0;
        }
        
       //lapiz azul
       if (colorP==4) {
           R=0; G=0; B=255;
        }
    
       //lapiz amarillo
         if (colorP==5) {
           R=255; G=255; B=0;
        }
       
        //lapiz negro
         if (colorP==1) {
           R=0; G=0; B=0;
        }
     //lapiz
      if (dib_borr==1){
          stroke(R,G,B);
          line(x,y,px,py);
          px=x; py=y;
        }
     
        //borrador
        if (dib_borr==2) {
         fill(255);
          ellipse(x,y,80,80);
        }
      break;
       
      //3D
      case(2):
      
        fill(255);
        stroke(255,0,0);
        translate(x, height/2);
        rotateX(pitch);
        rotateY(roll);
        box(100,100,100);
        delay(50);
       //pushMatrix();
       // translate(width/2,height/2);
       // fill(255);  
       // rect(0, 0, 200, 200);  // Black rectangle
       // popMatrix();
                
       
      break;
    
    }
    
  }
    
  // Función que se llama cuando el buffer de lectura 
  // contiene los datos disponibles
  void serialEvent(Serial port) {
    // Lee la cadena enviada. Con trim elimina el \n
     String inString = port.readString().trim();
     String[] list = split(inString,',');
     x= int(list[0]);
     y=int(list[1]);
     z=int(list[2]);
     colorP= int(list[3]); 
     nD=int(list[4]);
     dib_borr=int(list[5]);
    
    gX = x*0.5+(gX*(1-0.5));
    gY = y*0.5+(gY*(1-0.5));
    gZ = z*0.5+(gZ*(1-0.5));
  
  roll  = (atan2(-gY, gZ)*180.0)/PI;
  pitch = (atan2(gX, sqrt(gY*gY + gZ*gZ))*180.0)/PI; 
  }