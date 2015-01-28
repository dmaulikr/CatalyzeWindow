//FadeCandy
OPC opc;
//Video
import processing.video.*;
Capture video;
//Networking
import hypermedia.net.*;
UDP server;


void setup() {
  //Drawing Setup
  size(2000, 380, P2D);
  frameRate(10);
  noStroke();
  
  //FadeCandy Setup
  opc = new OPC(this, "192.168.3.5", 7890);
  setupMapping();
  
  //Setup UDP Server
  setupServer();
  
  //setupGameOfLife();
  //setupBounce();
  //setupBouncyBubbles();
  //setupVideo();
  
  //Set the background to black
  background(0);
}

void draw() {
  background(0);
  parseMatrix();
  //drawMouse();
  //drawVideo();
  //drawBouncyBubbles();
  //drawImage(loadImage("greenflame.jpeg"));
  //drawText();
  //drawTestImage();
  //drawGameOfLife();
  //drawBounce();
  //doAveraging();
  //drawGrid();
}





