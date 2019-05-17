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
  
  cam = new Capture(this, 640, 480);
  cam.start();
  img = createImage(640, 480, ARGB);

  trackColor = color(61, 8, 12);//not RGBA

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

  if ( cam.available() ) {
    cam.read();
    cam.loadPixels();
  }

  float avgX = 0;
  float avgY = 0;

  int count = 0;

  // Begin loop to walk through every pixel
  for (int x = 0; x < cam.width; x++ ) {
    for (int y = 0; y < cam.height; y++ ) {
      int loc = x + y * cam.width;
      // What is current color
      color currentColor = cam.pixels[loc];
      float r1 = red(currentColor);
      float g1 = green(currentColor);
      float b1 = blue(currentColor);
      float r2 = red(trackColor);
      float g2 = green(trackColor);
      float b2 = blue(trackColor);

      float d = distSq(r1, g1, b1, r2, g2, b2); 

      if (d < threshold*threshold) {
        //stroke(255);
        //strokeWeight(1);
        //point(x, y);
        avgX += x;
        avgY += y;
        count++;
      }
    }
  }

  // We only consider the color found if its color distance is less than 10. 
  // This threshold of 10 is arbitrary and you can adjust this number depending on how accurate you require the tracking to be.
  if (count > 0) { 
    avgX = avgX / count;
    avgY = avgY / count;
    trackX = width - avgX;
    trackY = avgY;
  }
  // Draw a circle at the tracked pixel
  fill(255);
  strokeWeight(4.0);
  stroke(0);
  ellipse(trackX, trackY, 24, 24);

  if ( trackX > cX && trackX < (cX + img2.width) &&
    trackY > cY && trackY < (cY + img2.height)) {
    mouseOver = true;
    image(mouseOver? img7 : img7, cX, cY);
    noLoop();
  
  }
  
    if ( trackX > bX && trackX < (bX + img1.width) &&
    trackY > bY && trackY < (bY + img1.height)) {
    mouseOver = true;
    image(mouseOver? img6 : img6, bX, bY);
  }
  
  if ( trackX > dX && trackX < (dX + img3.width) &&
    trackY > dY && trackY < (dY + img3.height)) {
    mouseOver = true;
    image(mouseOver? img6 : img6, dX, dY);
  }
  
  if ( trackX > eX && trackX < (eX + img4.width) &&
    trackY > eY && trackY < (eY + img4.height)) {
    mouseOver = true;
    image(mouseOver? img6 : img6, eX, eY);
    
    }
    
    if ( trackX > fX && trackX < (fX + img5.width) &&
    trackY > fY && trackY < (fY + img5.height)) {
    mouseOver = true;
    image(mouseOver? img6 : img6, fX, fY);
  }
}


float distSq(float x1, float y1, float z1, float x2, float y2, float z2) {
  float d = (x2-x1)*(x2-x1) + (y2-y1)*(y2-y1) +(z2-z1)*(z2-z1);
  return d;
}



//void mousePressed() {
//  trackColor = cam.get(trackX, trackY);
//}
