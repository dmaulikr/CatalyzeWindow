OPC opc;
import processing.video.*;
Capture video;

PImage inputImg;

int offset = 0;
int counter = 0;

void setup() {
  size(2000, 380, P2D);
  frameRate(10);
  noStroke();
  
  inputImg = loadImage("catalyze_FLIP5.png");
  
  opc = new OPC(this, "192.168.1.37", 7890);
  setupMapping();
  
  //setupGameOfLife();
  //setupBounce();
  //setupBouncyBubbles();
  setupVideo();
  background(0);
}

void draw() {
  background(0);
  //drawMouse();
  drawVideo();
  //drawBouncyBubbles();
  //drawImage();
  //drawText();
  //drawTestImage();
  //drawGameOfLife();
  //drawBounce();
  //doAveraging();
  //drawGrid();
}





