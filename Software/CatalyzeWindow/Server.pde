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
                        
StringDict clientDictionary = new StringDict();
                        
boolean automarch = false;
int automarchTimer = 1000;
int lastMarch = 0;

void setupServer(){
  server = new UDP(this, 6699);
  server.log(false);
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
  }else if(message.equals("m!")){
    /*
      March - Shift all pixels to the left by one and wrap disposed pixels to the far right side
    */
    if (debug) println("march matrix");
    marchMatrix();
  }else if(message.equals("a!")){
    /*
      Add new client
      Adds client to client dictionary for transmitting data to 
    */
    clientDictionary.set(ip, (""+millis()));
  }else if(message.equals("x!")){
   /*
      Remove Client
      Removes client from clientDictionary so they're not sent matrix info any longer
   */
    clientDictionary.remove(ip); 
  }else if(message.equals("am?")){
   /*
    Automarch Query
    Client is asking if we're currently marching, and what speed we're marching at.
   */ 
   String response = new String();
   response += "am,";
   if(automarch){
     response += "y,";
   }else{
     response += "n,";
   }
   response += automarchTimer;
   server.send(response, ip, 6667);
  }else if(message.equals("f!")){
    if (debug) println("Flip matrix");
    color[][] tempArray = new color[32][6];
    for(int x=0; x < 32; x++){
      tempArray[31-x] = blockMatrix[x];
    }
    blockMatrix = tempArray;
    parseMatrix();
  }
  
  
  sendMatrix();  
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
  sendMatrix();
}

void sendMatrix(){
  String matrixString = new String();
  for(int x=0; x<32; x++){
    for(int y=0; y<6; y++){
      color pixelColor = blockMatrix[x][y];
      int red = (pixelColor >> 16) & 0xFF;
      int green = (pixelColor >> 8) & 0xFF;
      int blue = pixelColor & 0xFF;
      matrixString += x + "," + y + "," + red + "," + green + "," + blue + "\n";
    }
  } 
  for(String ip : clientDictionary.keys()){
    server.send(matrixString, ip, 6667);
  }
}
