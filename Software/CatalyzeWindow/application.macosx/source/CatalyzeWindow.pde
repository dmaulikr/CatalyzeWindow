OPC opc;

PImage inputImg;
int offset = 0;

int counter = 0;

void setup() {

  inputImg = loadImage("catalyze.png");


  //2.66 

  size(int(300*2.66), 300);
  noStroke();

  opc = new OPC(this, "192.168.1.37", 7890);

  float spacing = (width/295.);
  println(spacing);

  float rowHeight = height/6;
  float columLoc = width/16;

  //55 * 3 = 165
  //11 pixels per led



  // Map one 64-LED strip to the center of the window
  //Row 1
  //(TFPBUGMOVXKDEXQP)
  opc.ledStrip(0, 53, (53*spacing)/2+(columLoc*0), rowHeight*1, spacing, 0, true);  // top Left 0,0
  opc.ledStrip(53, 55, (55*spacing)/2+(columLoc*3), rowHeight*1, spacing, 0, true); // top Left 1,0
  opc.ledStrip(108, 55, (55*spacing)/2+(columLoc*6), rowHeight*1, spacing, 0, false); // top Left 2,0
  opc.ledStrip(163, 55, (55*spacing)/2+(columLoc*9), rowHeight*1, spacing, 0, false); // top Left 3,0
  //(CSOULXZRFDARWJQX)
  opc.ledStrip(1384, 54, (54*spacing)/2+(columLoc*12), rowHeight*1, spacing, 0, true); // top Left 4, 0
  opc.ledStrip(1438, 20, (20*spacing)/2+(columLoc*15), rowHeight*1, spacing, 0, false);

  //Row 2
  //(TFPBUGMOVXKDEXQP)
  opc.ledStrip(218, 52, (52*spacing)/2+(columLoc*0), rowHeight*2, spacing, 0, true);
  opc.ledStrip(270, 54, (54*spacing)/2+(columLoc*3), rowHeight*2, spacing, 0, true);
  opc.ledStrip(324, 55, (55*spacing)/2+(columLoc*6), rowHeight*2, spacing, 0, false);
  opc.ledStrip(379, 55, (55*spacing)/2+(columLoc*9), rowHeight*2, spacing, 0, false);
  //(CSOULXZRFDARWJQX)
  opc.ledStrip(1330, 54, (54*spacing)/2+(columLoc*12), rowHeight*2, spacing, 0, true);
  opc.ledStrip(1310, 20, (20*spacing)/2+(columLoc*15), rowHeight*2, spacing, 0, false);
  
  //Row 3
  //(HVCWTNCGPDILYXIL)
  opc.ledStrip(489, 53, (53*spacing)/2+(columLoc*0), rowHeight*3, spacing, 0, true);
  opc.ledStrip(435, 54, (54*spacing)/2+(columLoc*3), rowHeight*3, spacing, 0, false);
  //(HVDTKATDLBANUFOZ)
  opc.ledStrip(870, 55, (55*spacing)/2+(columLoc*9), rowHeight*3, spacing, 0, false);
  opc.ledStrip(925, 55, (55*spacing)/2+(columLoc*6), rowHeight*3, spacing, 0, true);
  //(IUUGXPQAPJSFYFUF)
  opc.ledStrip(1478, 55, (55*spacing)/2+(columLoc*12), rowHeight*3, spacing, 0, true);
  opc.ledStrip(1458, 20, (20*spacing)/2+(columLoc*15), rowHeight*3, spacing, 0, false);
  
  //Row 4
  //(HVCWTNCGPDILYXIL)
  opc.ledStrip(596, 54, (54*spacing)/2+(columLoc*0), rowHeight*4, spacing, 0, true);
  opc.ledStrip(542, 54, (54*spacing)/2+(columLoc*3), rowHeight*4, spacing, 0, false);
  //(HVDTKATDLBANUFOZ)
  opc.ledStrip(1035, 55, (55*spacing)/2+(columLoc*6), rowHeight*4, spacing, 0, true);
  opc.ledStrip(980, 55, (55*spacing)/2+(columLoc*9), rowHeight*4, spacing, 0, false);
  //(IUUGXPQAPJSFYFUF)
  opc.ledStrip(1533, 20, (20*spacing)/2+(columLoc*15), rowHeight*4, spacing, 0, false);
  opc.ledStrip(1553, 55, (55*spacing)/2+(columLoc*12), rowHeight*4, spacing, 0, true);
   
  //Row 5
  //(HVCWTNCGPDILYXIL)
  opc.ledStrip(705, 55, (55*spacing)/2+(columLoc*0), rowHeight*5, spacing, 0, true);
  opc.ledStrip(650, 55, (55*spacing)/2+(columLoc*3), rowHeight*5, spacing, 0, false);
  //(HVDTKATDLBANUFOZ)
  opc.ledStrip(1090, 55, (55*spacing)/2+(columLoc*9), rowHeight*5, spacing, 0, false);
  opc.ledStrip(1145, 55, (55*spacing)/2+(columLoc*6), rowHeight*5, spacing, 0, true);
  //(IUUGXPQAPJSFYFUF)
  opc.ledStrip(1628, 55, (55*spacing)/2+(columLoc*12), rowHeight*5, spacing, 0, true);
  opc.ledStrip(1683, 20, (20*spacing)/2+(columLoc*15), rowHeight*5, spacing, 0, false);
   
  //Row 6
  //(HVCWTNCGPDILYXIL)
  opc.ledStrip(815, 55, (55*spacing)/2+(columLoc*0), (rowHeight*6)-1, spacing, 0, true);
  opc.ledStrip(760, 55, (55*spacing)/2+(columLoc*3), (rowHeight*6)-1, spacing, 0, false);
  //(HVDTKATDLBANUFOZ)
  opc.ledStrip(1200, 55, (55*spacing)/2+(columLoc*9), (rowHeight*6)-1, spacing, 0, false);
  opc.ledStrip(1255, 55, (55*spacing)/2+(columLoc*6), (rowHeight*6)-1, spacing, 0, true);
  //(IUUGXPQAPJSFYFUF)
  opc.ledStrip(1608, 20, (20*spacing)/2+(columLoc*15), (rowHeight*6)-1, spacing, 0, false);
  opc.ledStrip(1703, 55, (55*spacing)/2+(columLoc*12), (rowHeight*6)-1, spacing, 0, true);
}



void mousePressed() {
}

void draw() {
  counter++;
  if (counter >= 30) {
    counter = 0;
    offset+=1; 
    if (16+offset>=inputImg.width) {
      //if (offset>=width) {  
      offset= 0;
    }
  }

  


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

  //  background(0);
  //  fill(255);
  //  rect(offset, 0, 5050, height);
}

