import processing.serial.*;

// Objeto port tipo Serial
Serial port;
int x,y,z;

float gX, gY, gZ;
float pitch, roll;
int R=0,G=0,B=0;
int b=1;

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
    rect(740,0,60,600);
  
    //title
    PFont font;
    fill(0, 102, 153);
    font = loadFont("LucidaBright-Italic-32.vlw");
    textFont(font, 32);
    textAlign(CENTER);
    text("GRAFICADOR 2D & 3D", 400, 40);
  
    //boton 2D
    fill(255);
    rect(750,80,40,40);
    fill(0, 102, 153);
    textSize(20);
    textAlign(CENTER);
    text("2D", 770, 105);
    
    //boton 3D
    fill(255);
    rect(750,130,40,40);
    fill(0, 102, 153);
    textSize(20);
    textAlign(CENTER);
    text("3D", 770, 155);
    
    strokeWeight(5);
    //color rojo
    fill(255,0,0);
    rect(755,180,30,30);
    
    //color azul
    fill(0,255,0);
    rect(755,215,30,30);
    
    //color verde
    fill(0,0,255);
    rect(755,250,30,30);
    
    //color amarillo
    fill(255,255,0);
    rect(755,285,30,30);
    
     //color negro
    fill(0);
    rect(755,320,30,30);
    
    if (mousePressed && mouseX<=790 && mouseX>=750 && mouseY>=81 && mouseY<=118) {
      b=0;
    }
    if (mousePressed && mouseX<=790 && mouseX>=750 && mouseY>=129 && mouseY<=169) {
      b=1;
      fill(255);
      rect(0,60,740,600);
      
    }
      switch(b){
     //2D
      case(0):
      //lapiz rojo
        if (mousePressed && mouseX<=784 && mouseX>=755 && mouseY>=181 && mouseY<=207) {
           R=255; G=0; B=0;
        }
        
        //lapiz verde
        if (mousePressed && mouseX<=784 && mouseX>=755 && mouseY>=215 && mouseY<=244) {
           R=0; G=255; B=0;
        }
        
       //lapiz azul
       if (mousePressed && mouseX<=784 && mouseX>=755 && mouseY>=250 && mouseY<=278) {
           R=0; G=0; B=255;
        }
    
        
        //lapiz amarillo
         if (mousePressed && mouseX<=784 && mouseX>=755 && mouseY>=285 && mouseY<=314) {
           R=255; G=255; B=0;
        }
     
        
        //lapiz negro
         if (mousePressed && mouseX<=784 && mouseX>=755 && mouseY>=321 && mouseY<=347) {
           R=0; G=0; B=0;
        }
     //lapiz
      if (mousePressed && (mouseButton == LEFT)){
           stroke(R,G,B);
          line(mouseX,mouseY,pmouseX,pmouseY);
        }
     
        //borrador
        if (mousePressed && (mouseButton == RIGHT)) {
         fill(255);
          ellipse(mouseX,mouseY,60,60);
        }
      break;
       
      //3D
      case(1):
      
      
         fill(255);
          stroke(255,0,0);
         translate(width/2, height/2);
         rotateX(pitch);
         rotateY(roll);
        box(100,100,100);
        delay(50);
        
       
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
      
    gX = x*(3/512.0);
    gY = y*(3/512.0);
    gZ = z*(3/512.0);
  
  roll  = (atan2(-gY, gZ)*180.0)/PI;
  pitch = (atan2(gX, sqrt(gY*gY + gZ*gZ))*180.0)/PI; 
      print(x);  print('\t');
      print(y);  print('\t');
      println(z);
  }
 