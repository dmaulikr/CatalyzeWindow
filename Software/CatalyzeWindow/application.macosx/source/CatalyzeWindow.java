import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.net.*; 
import java.util.Arrays; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class CatalyzeWindow extends PApplet {

OPC opc;

PImage inputImg;
int offset = 0;

int counter = 0;

public void setup() {

  inputImg = loadImage("catalyze.png");


  //2.66 

  size(PApplet.parseInt(300*2.66f), 300);
  noStroke();

  opc = new OPC(this, "192.168.1.37", 7890);

  float spacing = (width/295.f);
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



public void mousePressed() {
}

public void draw() {
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

      int C = inputImg.pixels[(ih*inputImg.width)+iw];

      fill(C);
      stroke(0);
      rect(xx, yy+2, rwidth, rheight);
    }
  }

  //  background(0);
  //  fill(255);
  //  rect(offset, 0, 5050, height);
}

/*
 * Simple Open Pixel Control client for Processing,
 * designed to sample each LED's color from some point on the canvas.
 *
 * Micah Elizabeth Scott, 2013
 * This file is released into the public domain.
 */




public class OPC
{
  Socket socket;
  OutputStream output;
  String host;
  int port;

  int[] pixelLocations;
  byte[] packetData;
  byte firmwareConfig;
  String colorCorrection;
  boolean enableShowLocations;

  OPC(PApplet parent, String host, int port)
  {
    this.host = host;
    this.port = port;
    this.enableShowLocations = true;
    parent.registerDraw(this);
  }

  // Set the location of a single LED
  public void led(int index, int x, int y)  
  {
    // For convenience, automatically grow the pixelLocations array. We do want this to be an array,
    // instead of a HashMap, to keep draw() as fast as it can be.
    if (pixelLocations == null) {
      pixelLocations = new int[index + 1];
    } else if (index >= pixelLocations.length) {
      pixelLocations = Arrays.copyOf(pixelLocations, index + 1);
    }

    pixelLocations[index] = x + width * y;
  }
  
  // Set the location of several LEDs arranged in a strip.
  // Angle is in radians, measured clockwise from +X.
  // (x,y) is the center of the strip.
  public void ledStrip(int index, int count, float x, float y, float spacing, float angle, boolean reversed)
  {
    float s = sin(angle);
    float c = cos(angle);
    for (int i = 0; i < count; i++) {
      led(reversed ? (index + count - 1 - i) : (index + i),
        (int)(x + (i - (count-1)/2.0f) * spacing * c + 0.5f),
        (int)(y + (i - (count-1)/2.0f) * spacing * s + 0.5f));
    }
  }

  // Set the locations of a ring of LEDs. The center of the ring is at (x, y),
  // with "radius" pixels between the center and each LED. The first LED is at
  // the indicated angle, in radians, measured clockwise from +X.
  public void ledRing(int index, int count, float x, float y, float radius, float angle)
  {
    for (int i = 0; i < count; i++) {
      float a = angle + i * 2 * PI / count;
      led(index + i, (int)(x - radius * cos(a) + 0.5f),
        (int)(y - radius * sin(a) + 0.5f));
    }
  }

  // Set the location of several LEDs arranged in a grid. The first strip is
  // at 'angle', measured in radians clockwise from +X.
  // (x,y) is the center of the grid.
  public void ledGrid(int index, int stripLength, int numStrips, float x, float y,
               float ledSpacing, float stripSpacing, float angle, boolean zigzag)
  {
    float s = sin(angle + HALF_PI);
    float c = cos(angle + HALF_PI);
    for (int i = 0; i < numStrips; i++) {
      ledStrip(index + stripLength * i, stripLength,
        x + (i - (numStrips-1)/2.0f) * stripSpacing * c,
        y + (i - (numStrips-1)/2.0f) * stripSpacing * s, ledSpacing,
        angle, zigzag && (i % 2) == 1);
    }
  }

  // Set the location of 64 LEDs arranged in a uniform 8x8 grid.
  // (x,y) is the center of the grid.
  public void ledGrid8x8(int index, float x, float y, float spacing, float angle, boolean zigzag)
  {
    ledGrid(index, 8, 8, x, y, spacing, spacing, angle, zigzag);
  }

  // Should the pixel sampling locations be visible? This helps with debugging.
  // Showing locations is enabled by default. You might need to disable it if our drawing
  // is interfering with your processing sketch, or if you'd simply like the screen to be
  // less cluttered.
  public void showLocations(boolean enabled)
  {
    enableShowLocations = enabled;
  }
  
  // Enable or disable dithering. Dithering avoids the "stair-stepping" artifact and increases color
  // resolution by quickly jittering between adjacent 8-bit brightness levels about 400 times a second.
  // Dithering is on by default.
  public void setDithering(boolean enabled)
  {
    if (enabled)
      firmwareConfig &= ~0x01;
    else
      firmwareConfig |= 0x01;
    sendFirmwareConfigPacket();
  }

  // Enable or disable frame interpolation. Interpolation automatically blends between consecutive frames
  // in hardware, and it does so with 16-bit per channel resolution. Combined with dithering, this helps make
  // fades very smooth. Interpolation is on by default.
  public void setInterpolation(boolean enabled)
  {
    if (enabled)
      firmwareConfig &= ~0x02;
    else
      firmwareConfig |= 0x02;
    sendFirmwareConfigPacket();
  }

  // Put the Fadecandy onboard LED under automatic control. It blinks any time the firmware processes a packet.
  // This is the default configuration for the LED.
  public void statusLedAuto()
  {
    firmwareConfig &= 0x0C;
    sendFirmwareConfigPacket();
  }    

  // Manually turn the Fadecandy onboard LED on or off. This disables automatic LED control.
  public void setStatusLed(boolean on)
  {
    firmwareConfig |= 0x04;   // Manual LED control
    if (on)
      firmwareConfig |= 0x08;
    else
      firmwareConfig &= ~0x08;
    sendFirmwareConfigPacket();
  } 

  // Set the color correction parameters
  public void setColorCorrection(float gamma, float red, float green, float blue)
  {
    colorCorrection = "{ \"gamma\": " + gamma + ", \"whitepoint\": [" + red + "," + green + "," + blue + "]}";
    sendColorCorrectionPacket();
  }
  
  // Set custom color correction parameters from a string
  public void setColorCorrection(String s)
  {
    colorCorrection = s;
    sendColorCorrectionPacket();
  }

  // Send a packet with the current firmware configuration settings
  public void sendFirmwareConfigPacket()
  {
    if (output == null) {
      // We'll do this when we reconnect
      return;
    }
 
    byte[] packet = new byte[9];
    packet[0] = 0;          // Channel (reserved)
    packet[1] = (byte)0xFF; // Command (System Exclusive)
    packet[2] = 0;          // Length high byte
    packet[3] = 5;          // Length low byte
    packet[4] = 0x00;       // System ID high byte
    packet[5] = 0x01;       // System ID low byte
    packet[6] = 0x00;       // Command ID high byte
    packet[7] = 0x02;       // Command ID low byte
    packet[8] = firmwareConfig;

    try {
      output.write(packet);
    } catch (Exception e) {
      dispose();
    }
  }

  // Send a packet with the current color correction settings
  public void sendColorCorrectionPacket()
  {
    if (colorCorrection == null) {
      // No color correction defined
      return;
    }
    if (output == null) {
      // We'll do this when we reconnect
      return;
    }

    byte[] content = colorCorrection.getBytes();
    int packetLen = content.length + 4;
    byte[] header = new byte[8];
    header[0] = 0;          // Channel (reserved)
    header[1] = (byte)0xFF; // Command (System Exclusive)
    header[2] = (byte)(packetLen >> 8);
    header[3] = (byte)(packetLen & 0xFF);
    header[4] = 0x00;       // System ID high byte
    header[5] = 0x01;       // System ID low byte
    header[6] = 0x00;       // Command ID high byte
    header[7] = 0x01;       // Command ID low byte

    try {
      output.write(header);
      output.write(content);
    } catch (Exception e) {
      dispose();
    }
  }

  // Automatically called at the end of each draw().
  // This handles the automatic Pixel to LED mapping.
  // If you aren't using that mapping, this function has no effect.
  // In that case, you can call setPixelCount(), setPixel(), and writePixels()
  // separately.
  public void draw()
  {
    if (pixelLocations == null) {
      // No pixels defined yet
      return;
    }
 
    if (output == null) {
      // Try to (re)connect
      connect();
    }
    if (output == null) {
      return;
    }

    int numPixels = pixelLocations.length;
    int ledAddress = 4;

    setPixelCount(numPixels);
    loadPixels();

    for (int i = 0; i < numPixels; i++) {
      int pixelLocation = pixelLocations[i];
      int pixel = pixels[pixelLocation];

      packetData[ledAddress] = (byte)(pixel >> 16);
      packetData[ledAddress + 1] = (byte)(pixel >> 8);
      packetData[ledAddress + 2] = (byte)pixel;
      ledAddress += 3;

      if (enableShowLocations) {
        pixels[pixelLocation] = 0xFFFFFF ^ pixel;
      }
    }

    writePixels();

    if (enableShowLocations) {
      updatePixels();
    }
  }
  
  // Change the number of pixels in our output packet.
  // This is normally not needed; the output packet is automatically sized
  // by draw() and by setPixel().
  public void setPixelCount(int numPixels)
  {
    int numBytes = 3 * numPixels;
    int packetLen = 4 + numBytes;
    if (packetData == null || packetData.length != packetLen) {
      // Set up our packet buffer
      packetData = new byte[packetLen];
      packetData[0] = 0;  // Channel
      packetData[1] = 0;  // Command (Set pixel colors)
      packetData[2] = (byte)(numBytes >> 8);
      packetData[3] = (byte)(numBytes & 0xFF);
    }
  }
  
  // Directly manipulate a pixel in the output buffer. This isn't needed
  // for pixels that are mapped to the screen.
  public void setPixel(int number, int c)
  {
    int offset = 4 + number * 3;
    if (packetData == null || packetData.length < offset + 3) {
      setPixelCount(number + 1);
    }

    packetData[offset] = (byte) (c >> 16);
    packetData[offset + 1] = (byte) (c >> 8);
    packetData[offset + 2] = (byte) c;
  }
  
  // Read a pixel from the output buffer. If the pixel was mapped to the display,
  // this returns the value we captured on the previous frame.
  public int getPixel(int number)
  {
    int offset = 4 + number * 3;
    if (packetData == null || packetData.length < offset + 3) {
      return 0;
    }
    return (packetData[offset] << 16) | (packetData[offset + 1] << 8) | packetData[offset + 2];
  }

  // Transmit our current buffer of pixel values to the OPC server. This is handled
  // automatically in draw() if any pixels are mapped to the screen, but if you haven't
  // mapped any pixels to the screen you'll want to call this directly.
  public void writePixels()
  {
    if (packetData == null || packetData.length == 0) {
      // No pixel buffer
      return;
    }
    if (output == null) {
      // Try to (re)connect
      connect();
    }
    if (output == null) {
      return;
    }

    try {
      output.write(packetData);
    } catch (Exception e) {
      dispose();
    }
  }

  public void dispose()
  {
    // Destroy the socket. Called internally when we've disconnected.
    if (output != null) {
      println("Disconnected from OPC server");
    }
    socket = null;
    output = null;
  }

  public void connect()
  {
    // Try to connect to the OPC server. This normally happens automatically in draw()
    try {
      socket = new Socket(host, port);
      socket.setTcpNoDelay(true);
      output = socket.getOutputStream();
      println("Connected to OPC server");
    } catch (ConnectException e) {
      dispose();
    } catch (IOException e) {
      dispose();
    }
    
    sendColorCorrectionPacket();
    sendFirmwareConfigPacket();
  }
}

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "CatalyzeWindow" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
