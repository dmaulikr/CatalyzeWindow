color b = color(0);
color blockMatrix[][] = {{b, b, b, b, b, b},
                        {b, b, b, b, b, b},
                        {b, b, b, b, b, b},
                        {b, b, b, b, b, b},
                        {b, b, b, b, b, b},
                        {b, b, b, b, b, b},
                        {b, b, b, b, b, b},
                        {b, b, b, b, b, b},
                        {b, b, b, b, b, b},
                        {b, b, b, b, b, b},
                        {b, b, b, b, b, b},
                        {b, b, b, b, b, b},
                        {b, b, b, b, b, b},
                        {b, b, b, b, b, b},
                        {b, b, b, b, b, b},
                        {b, b, b, b, b, b},
                        {b, b, b, b, b, b},
                        {b, b, b, b, b, b},
                        {b, b, b, b, b, b},
                        {b, b, b, b, b, b},
                        {b, b, b, b, b, b},
                        {b, b, b, b, b, b},
                        {b, b, b, b, b, b},
                        {b, b, b, b, b, b},
                        {b, b, b, b, b, b},
                        {b, b, b, b, b, b},
                        {b, b, b, b, b, b},
                        {b, b, b, b, b, b},
                        {b, b, b, b, b, b},
                        {b, b, b, b, b, b},
                        {b, b, b, b, b, b},
                        {b, b, b, b, b, b}};
                        
boolean automarch = false;
int automarchTimer = 1000;
int lastMarch = 0;

void setupServer(){
  server = new UDP(this, 6666);
  server.log(true);
  server.listen(true);
}

void receive( byte[] data, String ip, int port ) {
  boolean debug = true;
  
  String message = new String( data );
  if (debug) println( "Raw: \"" + message + "\" from " + ip + " on port " + port );
  //Test and see if this is a coordinate update
  if(message.indexOf(",") != -1){
    /*
      Coordinate Update. Change a glass block to a color. Defaults to white, or a color can be supplied
      White: x,y
      Color: x,y,r,g,b
    */
    int components[] = int(split(message, ","));
    if(components.length == 2){
      //Coordinate update with no color specified, default to white
      if(components[0] < 32 && components[1] < 6){
        blockMatrix[components[0]][components[1]] = color(255);
        println(blockMatrix[components[0]][components[1]]);
      }else{
        if (debug) println("Bad Coordinate");
      }
    }else if (components.length == 5){
      //Coordinate update with r g b specified
      if(components[0] < 32 && components[1] < 6){
        if(components[2] <= 255 && components[3] <= 255 && components[4] <= 255){
          blockMatrix[components[0]][components[1]] = color(components[2], components[3], components[4]);
        }else{
          if (debug) println("Bad Color");
        }
      }else{
        if (debug) println("Bad Coordinate");
      }
    }else{
      //Unknown coordinate update
      if (debug) println("Bad Coordinate Update with " + components.length + " components");
    }
  }else if(message.indexOf("r!") != -1){
    /*
      Turn off all LEDs by filling the color matrix with black
    */
    if (debug) println("reset drawing");
    fillEntireMatrix(color(0));
  }else if(message.indexOf("am!") != -1){
    /*
      Automarch - Automatically run march, supply a timer in milliseconds
      Ex: am!1500
    */
    String components[] = split(message,"!");
    if(components.length == 2){
      automarchTimer = int(components[1]);
    }
    if(automarch){
      if (debug) println("automarch off");
      automarch = false;
    }else{
      if (debug) println("automarch on");
      automarch = true;
    }
  }else if(message.indexOf("m!") != -1){
    /*
      March - Shift all pixels to the left by one and wrap disposed pixels to the far right side
    */
    if (debug) println("march matrix");
    marchMatrix();
  }
}

void parseMatrix(){
  float widthSpacing = width/32;
  float heightSpacing = height/6;
  for(int x=0; x<32; x++){
    for(int y=0; y<6; y++){
      fill(blockMatrix[x][y]);
      rect(x*widthSpacing, y*heightSpacing, widthSpacing, heightSpacing);
    }
  }
  //Check for automarch
  if(automarch){
    if(millis() > lastMarch + automarchTimer){
      lastMarch = millis();
      marchMatrix();
    }
  }
}

void fillEntireMatrix(color fillColor){
 for(int x=0; x<32; x++){
    for(int y=0; y<6; y++){
      blockMatrix[x][y] = fillColor;
    }
  } 
}

void marchMatrix(){
  for(int x=0; x<31; x++){
    for(int y=0; y<6; y++){
      if(x == 0){
        blockMatrix[31][y] = blockMatrix[x][y];
        blockMatrix[x][y] = blockMatrix[x+1][y];
      }else{
        blockMatrix[x][y] = blockMatrix[x+1][y];
      }
    }
  } 
}
