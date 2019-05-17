// Codes by JH Moon and Dan Shiffman used as reference


import processing.video.*;


Capture cam;
PImage img;
PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img6; 
PImage img7;

color trackColor;
int threshold = 20;


int bX = 450, bY = 50;
int cX = 350, cY = 350;
int dX = 50, dY = 50;
int eX = 300, eY = 150;
int fX = 50, fY = 275;

 


float avgX, avgY;
float trackX, trackY;

boolean mouseOver;

void setup() {
  size(640, 480);
  
  //cam = new Capture(this, 640, 480);
  //cam.start();
  //img = createImage(640, 480, ARGB);

  //trackColor = color(141, 51, 81);//not RGBA

  img1 = loadImage("boredchild.png");
  img1.resize(100, 0);
  img2 = loadImage("angrygirl.png");
  img2.resize(150, 0);
  img3 = loadImage("happychild.png");
  img3.resize(115, 0);
  img4 = loadImage("happychild2.png");
  img4.resize(115, 0);
  img5 = loadImage("sadchild.png");
  img5.resize(115, 0);
  img6 = loadImage("x.jpg");
  img6.resize(115, 0);
  img7 = loadImage("check1.png");
  img7.resize(150, 0);
  

}


void draw() {
  background(255, 255, 255);
  
  image(img1, bX, bY);
  image(img2, cX, cY);
  image(img3, dX, dY);
  image(img4, eX, eY);
  image(img5, fX, fY);
  
  ellipse(mouseX, mouseY, 24, 24);

  if ( mouseX > cX && mouseX < (cX + img2.width) &&
    mouseY > cY && mouseY < (cY + img2.height)) {
    mouseOver = true;
    image(mouseOver? img7 : img7, cX, cY);
    noLoop();
  
  }
  
    if ( mouseX > bX && mouseX < (bX + img1.width) &&
    mouseY > bY && mouseY < (bY + img1.height)) {
    mouseOver = true;
    image(mouseOver? img6 : img6, bX, bY);
  }
  
  if ( mouseX > dX && mouseX < (dX + img3.width) &&
    mouseY > dY && mouseY < (dY + img3.height)) {
    mouseOver = true;
    image(mouseOver? img6 : img6, dX, dY);
  }
  
  if ( mouseX > eX && mouseX < (eX + img4.width) &&
    mouseY > eY && mouseY < (eY + img4.height)) {
    mouseOver = true;
    image(mouseOver? img6 : img6, eX, eY);
    
    }
    
    if ( mouseX > fX && mouseX < (fX + img5.width) &&
    mouseY > fY && mouseY < (fY + img5.height)) {
    mouseOver = true;
    image(mouseOver? img6 : img6, fX, fY);
  }
}
