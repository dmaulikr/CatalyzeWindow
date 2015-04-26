void spectrum(){
   for (int i = 0 ; i < 256 * 256 * 256 ; i++) {
    int r = i >> 16 & 0xff;
    int g = i >> 8 & 0xff;
    int b = i & 0xff;
    p.stroke(r, g, b);
    p.point(i / displayWidth, i % displayHeight);
  }
}
