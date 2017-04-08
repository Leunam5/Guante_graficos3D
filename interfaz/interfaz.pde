int x=5;
int b=0;
void setup(){
background(255);
size(800,600,P3D);
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
         x=1;
      }
       if (mousePressed && (mouseButton == LEFT)&& (x==1)){
         stroke(255,0,0);
        line(mouseX,mouseY,pmouseX,pmouseY);
      }
      //lapiz verde
      if (mousePressed && mouseX<=784 && mouseX>=755 && mouseY>=215 && mouseY<=244) {
         x=2;
      }
      if (mousePressed && (mouseButton == LEFT)&& (x==2)){
         stroke(0,255,0);
        line(mouseX,mouseY,pmouseX,pmouseY);
      }
      
     //lapiz azul
     if (mousePressed && mouseX<=784 && mouseX>=755 && mouseY>=250 && mouseY<=278) {
         x=3;
      }
      if (mousePressed && (mouseButton == LEFT)&& (x==3)){
         stroke(0,0,255);
        line(mouseX,mouseY,pmouseX,pmouseY);
      }
      //lapiz amarillo
       if (mousePressed && mouseX<=784 && mouseX>=755 && mouseY>=285 && mouseY<=314) {
         x=4;
      }
      if (mousePressed && (mouseButton == LEFT)&& (x==4)){
         stroke(255,255,0);
        line(mouseX,mouseY,pmouseX,pmouseY);
      }
      
      //lapiz negro
       if (mousePressed && mouseX<=784 && mouseX>=755 && mouseY>=321 && mouseY<=347) {
         x=5;
      }
      if (mousePressed && (mouseButton == LEFT)&& (x==5)){
         stroke(0);
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
    stroke(255,0,0);
    fill(255);
       translate(width/2, height/2);
      rotateX(PI/6);
      rotateY(PI/6);
      box(50);
    break;
 
  }
}