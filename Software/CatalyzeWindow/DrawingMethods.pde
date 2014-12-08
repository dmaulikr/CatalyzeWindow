/*

drawMouse()
drawText()
drawImage()
drawTestImage()
doAveraging()
*/

int rad = 40;        // Width of the shape
float xpos, ypos;    // Starting position of shape    

float xspeed = 2.8;  // Speed of the shape
float yspeed = 2.2;  // Speed of the shape

int xdirection = 1;  // Left or Right
int ydirection = 1;  // Top to Bottom

void setupBounce(){

  xpos = width/2;
  ypos = height/2;
}

void drawBounce(){
    // Update the position of the shape
  xpos = xpos + ( xspeed * xdirection );
  ypos = ypos + ( yspeed * ydirection );
  
  // Test to see if the shape exceeds the boundaries of the screen
  // If it does, reverse its direction by multiplying by -1
  if (xpos > width-rad || xpos < rad) {
    xdirection *= -1;
  }
  if (ypos > height-rad || ypos < rad) {
    ydirection *= -1;
  }

  // Draw the shape
  ellipse(xpos, ypos, rad, rad);
}


void setupVideo(){
  video = new Capture(this, width, height);
  video.start();
}

void drawVideo(){
  video.read();
  image(video, 0, 0, width, height);
}






int numBalls = 12;
float spring = 0.05;
float gravity = 0.03;
float friction = -0.9;
Ball[] balls = new Ball[numBalls];

void setupBouncyBubbles(){
  for (int i = 0; i < numBalls; i++) {
    balls[i] = new Ball(random(width), random(height), random(30, 70), i, balls);
  }
}

void drawBouncyBubbles(){
  for (int i = 0; i < numBalls; i++) {
    balls[i].collide();
    balls[i].move();
    balls[i].display();  
  }
}

class Ball {
  
  float x, y;
  float diameter;
  float vx = 0;
  float vy = 0;
  int id;
  Ball[] others;
 
  Ball(float xin, float yin, float din, int idin, Ball[] oin) {
    x = xin;
    y = yin;
    diameter = din;
    id = idin;
    others = oin;
  } 
  
  void collide() {
    for (int i = id + 1; i < numBalls; i++) {
      float dx = others[i].x - x;
      float dy = others[i].y - y;
      float distance = sqrt(dx*dx + dy*dy);
      float minDist = others[i].diameter/2 + diameter/2;
      if (distance < minDist) { 
        float angle = atan2(dy, dx);
        float targetX = x + cos(angle) * minDist;
        float targetY = y + sin(angle) * minDist;
        float ax = (targetX - others[i].x) * spring;
        float ay = (targetY - others[i].y) * spring;
        vx -= ax;
        vy -= ay;
        others[i].vx += ax;
        others[i].vy += ay;
      }
    }   
  }
  
  void move() {
    vy += gravity;
    x += vx;
    y += vy;
    if (x + diameter/2 > width) {
      x = width - diameter/2;
      vx *= friction; 
    }
    else if (x - diameter/2 < 0) {
      x = diameter/2;
      vx *= friction;
    }
    if (y + diameter/2 > height) {
      y = height - diameter/2;
      vy *= friction; 
    } 
    else if (y - diameter/2 < 0) {
      y = diameter/2;
      vy *= friction;
    }
  }
  
  void display() {
    ellipse(x, y, diameter, diameter);
  }
}








void doAveraging(){
  int widthSpacing = width/32;
  int heightSpacing = height/6;
  
  color[] avg = new color[widthSpacing*heightSpacing];
  
  //Average Pixels
  loadPixels();
  for(int bigX=0; bigX<32; bigX++){
    for(int bigY=0; bigY<6; bigY++){
      int subXStart = bigX*widthSpacing;
      int subYStart = bigY*heightSpacing;
      //Initalize Stores for Each Glass Block
      long subR = 0;
      long subG = 0;
      long subB = 0;
      //Grab the colors in each glass block
      for(int subX=subXStart; subX<subXStart+widthSpacing; subX++){
        for(int subY=subYStart; subY<subYStart+heightSpacing; subY++){
          color subColor = pixels[subX + (subY * width)];
          subR += (subColor >> 16) & 0xFF;
          subG += (subColor >> 8) & 0xFF;
          subB += subColor & 0xFF;
        }
      }
      //Average the colors
      subR = subR/(widthSpacing*heightSpacing);
      subG = subG/(widthSpacing*heightSpacing);
      subB = subB/(widthSpacing*heightSpacing);
      //Run back through and color the pixels
      for(int subX=subXStart; subX<subXStart+widthSpacing; subX++){
        for(int subY=subYStart; subY<subYStart+heightSpacing; subY++){
          int location = subX+(subY*width);
          pixels[location] = color(subR, subG, subB);
          updatePixels();
        }
      }     
    }
  }
}

void drawTestImage(){
 PImage testImage = loadImage("cat.jpeg");
 image(testImage, 0, 0, width, height); 
}


void drawGrid(){
 stroke(128,128,255);
 float verticalSpacing = width/32;
 for(int x = 0; x < 32; x++){
  line(verticalSpacing*x, 0, verticalSpacing*x, height);
 } 
 float horizontalSpacing = height/6;
 for(int y=0; y < 6; y++){
   line(0, horizontalSpacing*y, width, horizontalSpacing*y);
 }
}


void drawMouse() {
  background(0);
  stroke(255);
  rect(mouseX, mouseY, 10, 40);
}

void drawImage() {
  background(0);
  // Scale the image so that it matches the width of the window
  int imHeight = inputImg.height * width / inputImg.height;
  //
  //  // Scroll down slowly, and wrap around
  float speed = 0.05;
  float y = (millis() * -speed) % imHeight;

  // Use two copies of the image, so it seems to repeat infinitely  
  image(inputImg, y, 0, width, imHeight);
  image(inputImg, y + imHeight, 0, width, imHeight);
}

void drawText() {
  counter++;
  if (counter >= 30) {
    counter = 0;
    offset+=1; 
    if (16+offset>=inputImg.width) {
      //if (offset>=width) {  
      offset= 0;
    }
  }



  background(0);
  int rwidth = width/16;
  int rheight = height/6;

  inputImg.loadPixels();



  for (int iw = 0; iw < inputImg.width; iw++) {
    for (int ih = 0; ih < inputImg.height; ih++) {

      int xx =   (int)   map(iw, 16+offset, offset, 0, width);
      int yy =   (int)   map(ih, 0, inputImg.height, 0, height);

      color C = inputImg.pixels[(ih*inputImg.width)+iw];

      fill(C);
      stroke(0);
      rect(xx, yy+2, rwidth, rheight);
    }
  }
}

