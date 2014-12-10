void setupMapping(){
  float spacing = width/610.0;

  float RowHeight = height/6;
  float columLoc = width/32;

  int rowNudge = 30;

  //Map one 64-LED strip to the center of the //Window
  ////Row 1
  //(TFPBUGMOVXKDEXQP)
  opc.ledStrip(0, 53, ((53*spacing)/2+(columLoc*0)) + 5, RowHeight*1-rowNudge, spacing, 0, true);   
  opc.ledStrip(53, 55, ((55*spacing)/2+(columLoc*3)) + 3, RowHeight*1-rowNudge, spacing, 0, true);  
  opc.ledStrip(108, 55, ((55*spacing)/2+(columLoc*6)) + 3, RowHeight*1-rowNudge, spacing, 0, false);  
  opc.ledStrip(163, 55, ((55*spacing)/2+(columLoc*9)) + 3, RowHeight*1-rowNudge, spacing, 0, false); 
//  //(CSOULXZRFDARWJQX)
  opc.ledStrip(1384, 54, ((54*spacing)/2+(columLoc*12)) + 5, RowHeight*1-rowNudge, spacing, 0, true); 
  opc.ledStrip(1438, 20, (20*spacing)/2+(columLoc*15) - 2, RowHeight*1-rowNudge, spacing, 0, false);
//  //Window 2
//  //(QCMKJBWGBDGRAPKV)
  opc.ledStrip(1882, 20, ((20*spacing)/2+(columLoc*16)) - 2, RowHeight*1-rowNudge, spacing, 0, true);
  opc.ledStrip(1830, 52, (52*spacing)/2+(columLoc*17) + 7, RowHeight*1-rowNudge, spacing, 0, false);
//  //(QOGCTLUGHTMTQBEX)
  opc.ledStrip(2234, 52, ((52*spacing)/2+(columLoc*20)) + 7, RowHeight*1-rowNudge, spacing, 0, true);
  opc.ledStrip(2130, 52, ((52*spacing)/2+(columLoc*23)) + 7, RowHeight*1-rowNudge, spacing, 0, true);
  opc.ledStrip(2078, 52, (52*spacing)/2+(columLoc*26) + 7, RowHeight*1-rowNudge, spacing, 0, false);
//  
  opc.ledStrip(2286, 52, (52*spacing)/2+(columLoc*29) + 3, RowHeight*1-rowNudge, spacing, 0, false);
  
  
  
  //Row 2
  //Window 1
  //(TFPBUGMOVXKDEXQP)
  opc.ledStrip(218, 52, ((52*spacing)/2+(columLoc*0)) + 7, RowHeight*2-rowNudge, spacing, 0, true);
  opc.ledStrip(270, 54, ((54*spacing)/2+(columLoc*3)) + 4, RowHeight*2-rowNudge, spacing, 0, true);
  opc.ledStrip(324, 55, ((55*spacing)/2+(columLoc*6)) + 3, RowHeight*2-rowNudge, spacing, 0, false);
  opc.ledStrip(379, 55, ((55*spacing)/2+(columLoc*9)) + 4, RowHeight*2-rowNudge, spacing, 0, false);
//  //(CSOULXZRFDARWJQX)
  opc.ledStrip(1330, 54, ((54*spacing)/2+(columLoc*12)) + 5, RowHeight*2-rowNudge, spacing, 0, true);
  opc.ledStrip(1310, 18, ((18*spacing)/2+(columLoc*15)) + 1, RowHeight*2-rowNudge, spacing, 0, false);
//  //Window 2
//  //(QCMKJBWGBDGRAPKV)
  opc.ledStrip(1810, 18, ((18*spacing)/2+(columLoc*16)), RowHeight*2-rowNudge, spacing, 0, true);
  opc.ledStrip(1758, 52, ((52*spacing)/2+(columLoc*17)) + 8, RowHeight*2-rowNudge, spacing, 0, false);
//  //(QOGCTLUGHTMTQBEX)
  opc.ledStrip(2182, 52, ((52*spacing)/2+(columLoc*20)) + 8, RowHeight*2-rowNudge, spacing, 0, true);
  opc.ledStrip(2026, 52, ((52*spacing)/2+(columLoc*23)) + 8, RowHeight*2-rowNudge, spacing, 0, true);
  opc.ledStrip(1974, 52, ((52*spacing)/2+(columLoc*26)) + 8, RowHeight*2-rowNudge, spacing, 0, false);
  opc.ledStrip(2338, 52, ((52*spacing)/2+(columLoc*29)) + 3, RowHeight*2-rowNudge, spacing, 0, false);
  
  
  //Row 3
  // (HVCWTNCGPDILYXIL)
  opc.ledStrip(489, 53, ((53*spacing)/2+(columLoc*0)) + 6, RowHeight*3-rowNudge, spacing, 0, true);
  opc.ledStrip(435, 54, ((54*spacing)/2+(columLoc*3)) + 4, RowHeight*3-rowNudge, spacing, 0, false);
//  // (HVDTKATDLBANUFOZ)
  opc.ledStrip(925, 55, ((55*spacing)/2+(columLoc*6)) + 3, RowHeight*3-rowNudge, spacing, 0, true);
  opc.ledStrip(870, 55, ((55*spacing)/2+(columLoc*9)) + 3, RowHeight*3-rowNudge, spacing, 0, false);
//  // (IUUGXPQAPJSFYFUF)
  opc.ledStrip(1478, 55, ((55*spacing)/2+(columLoc*12)) + 2, RowHeight*3-rowNudge, spacing, 0, true);
  opc.ledStrip(1458, 18, ((18*spacing)/2+(columLoc*15)) + 1, RowHeight*3-rowNudge, spacing, 0, false);
  //Window 2
//  //(QCMKJBWGBDGRAPKV)
  opc.ledStrip(1902, 18, ((18*spacing)/2+(columLoc*16)) + 1, RowHeight*3-rowNudge, spacing, 0, true);
  opc.ledStrip(1922, 52, ((52*spacing)/2+(columLoc*17)) + 7, RowHeight*3-rowNudge, spacing, 0, false);
//  // (MAMWVNBNJXQZERWH)
  opc.ledStrip(2702, 52, ((52*spacing)/2+(columLoc*20)) + 8, RowHeight*3-rowNudge, spacing, 0, true);
  opc.ledStrip(2754, 52, ((52*spacing)/2+(columLoc*23)) + 8, RowHeight*3-rowNudge, spacing, 0, false);
//  // (LLNXGUVTXHIHSRAB)
  opc.ledStrip(3014, 52, ((52*spacing)/2+(columLoc*26)) + 8, RowHeight*3-rowNudge, spacing, 0, true);
  opc.ledStrip(3066, 52, ((52*spacing)/2+(columLoc*29)) + 2, RowHeight*3-rowNudge, spacing, 0, false);
  
  //Row 4
  // (HVCWTNCGPDILYXIL)
  opc.ledStrip(596, 54, ((54*spacing)/2+(columLoc*0)) + 6, RowHeight*4-rowNudge, spacing, 0, true);
  opc.ledStrip(542, 54, ((54*spacing)/2+(columLoc*3)) + 4, RowHeight*4-rowNudge, spacing, 0, false);
//  // (HVDTKATDLBANUFOZ)
  opc.ledStrip(1035, 55, ((55*spacing)/2+(columLoc*6)) + 2, RowHeight*4-rowNudge, spacing, 0, true);
  opc.ledStrip(980, 55, ((55*spacing)/2+(columLoc*9)) + 3, RowHeight*4-rowNudge, spacing, 0, false);
//  // (IUUGXPQAPJSFYFUF)
  opc.ledStrip(1553, 55, ((55*spacing)/2+(columLoc*12)) + 2, RowHeight*4-rowNudge, spacing, 0, true);
  opc.ledStrip(1533, 18, (18*spacing)/2+(columLoc*15) + 2, RowHeight*4-rowNudge, spacing, 0, false);
  //Window 2
//  // (MAMWVNBNJXQZERWH)
  opc.ledStrip(2546, 52, ((52*spacing)/2+(columLoc*20)) + 8, RowHeight*4-rowNudge, spacing, 0, true);
  opc.ledStrip(2494, 52, ((52*spacing)/2+(columLoc*23)) + 6, RowHeight*4-rowNudge, spacing, 0, false);
//  // (LLNXGUVTXHIHSRAB)
  opc.ledStrip(2858, 52, ((52*spacing)/2+(columLoc*26)) + 6, RowHeight*4-rowNudge, spacing, 0, true);
  opc.ledStrip(2806, 52, ((52*spacing)/2+(columLoc*29)) + 2, RowHeight*4-rowNudge, spacing, 0, false);
  //(HXFDYEGULDMDKVOV)
  opc.ledStrip(3294, 18, ((18*spacing)/2+(columLoc*16)) + 2, RowHeight*4-rowNudge, spacing, 0, true);
  opc.ledStrip(3314, 52, ((52*spacing)/2+(columLoc*17)) + 2, RowHeight*4-rowNudge, spacing, 0, false);
  
  
   
  //Row 5
  // (HVCWTNCGPDILYXIL)
  opc.ledStrip(705, 55, ((55*spacing)/2+(columLoc*0)) + 2, RowHeight*5-rowNudge, spacing, 0, true);
  opc.ledStrip(650, 55, ((55*spacing)/2+(columLoc*3)) + 2, RowHeight*5-rowNudge, spacing, 0, false);
//  // (HVDTKATDLBANUFOZ)
  opc.ledStrip(1145, 55, ((55*spacing)/2+(columLoc*6)) + 2, RowHeight*5-rowNudge, spacing, 0, true);
  opc.ledStrip(1090, 55, ((55*spacing)/2+(columLoc*9)) + 2, RowHeight*5-rowNudge, spacing, 0, false);
//  // (IUUGXPQAPJSFYFUF)
  opc.ledStrip(1628, 55, ((55*spacing)/2+(columLoc*12)) + 2, RowHeight*5-rowNudge, spacing, 0, true);
  opc.ledStrip(1683, 18, ((18*spacing)/2+(columLoc*15)) + 2, RowHeight*5-rowNudge, spacing, 0, false);
  //Window 2
//  // (MAMWVNBNJXQZERWH)
  opc.ledStrip(2390, 52, ((52*spacing)/2+(columLoc*20)) + 6, RowHeight*5-rowNudge, spacing, 0, true);
  opc.ledStrip(2442, 52, ((52*spacing)/2+(columLoc*23)) + 6, RowHeight*5-rowNudge, spacing, 0, false);
//  // (LLNXGUVTXHIHSRAB)
  opc.ledStrip(2962, 52, ((52*spacing)/2+(columLoc*26)) + 6, RowHeight*5-rowNudge, spacing, 0, true);
  opc.ledStrip(2910, 52, ((52*spacing)/2+(columLoc*29)) + 3, RowHeight*5-rowNudge, spacing, 0, false);
   //(HXFDYEGULDMDKVOV)
   opc.ledStrip(3418, 18, ((18*spacing)/2+(columLoc*16)) + 2, RowHeight*5-rowNudge, spacing, 0, true);
  opc.ledStrip(3366, 52, ((52*spacing)/2+(columLoc*17)) + 2, RowHeight*5-rowNudge, spacing, 0, false);
  
   
   
   
  //Row 6
  // (HVCWTNCGPDILYXIL)
  opc.ledStrip(815, 55, ((55*spacing)/2+(columLoc*0)) + 2, (RowHeight*6)-rowNudge, spacing, 0, true);
  opc.ledStrip(760, 55, ((55*spacing)/2+(columLoc*3)) + 3, (RowHeight*6)-rowNudge, spacing, 0, false);
//  // (HVDTKATDLBANUFOZ)
    opc.ledStrip(1255, 55, ((55*spacing)/2+(columLoc*6)) + 2, (RowHeight*6)-rowNudge, spacing, 0, true);
    opc.ledStrip(1200, 55, ((55*spacing)/2+(columLoc*9)) + 2, (RowHeight*6)-rowNudge, spacing, 0, false);
//  // (IUUGXPQAPJSFYFUF)
  opc.ledStrip(1703, 55, ((55*spacing)/2+(columLoc*12)) + 2, (RowHeight*6)-rowNudge, spacing, 0, true);
  opc.ledStrip(1608, 18, ((18*spacing)/2+(columLoc*15)) + 2, (RowHeight*6)-rowNudge, spacing, 0, false);
  // Window 2
//  // (MAMWVNBNJXQZERWH)
  opc.ledStrip(2598, 52, ((52*spacing)/2+(columLoc*20)) + 6, (RowHeight*6)-rowNudge, spacing, 0, true);
  opc.ledStrip(2650, 52, ((52*spacing)/2+(columLoc*23)) + 6, (RowHeight*6)-rowNudge, spacing, 0, false);
//  // (LLNXGUVTXHIHSRAB)
  opc.ledStrip(3118, 52, ((52*spacing)/2+(columLoc*26)) + 6, (RowHeight*6)-rowNudge, spacing, 0, true);
  opc.ledStrip(3170, 52, ((52*spacing)/2+(columLoc*29)) + 2, (RowHeight*6)-rowNudge, spacing, 0, false);
  //(HXFDYEGULDMDKVOV)
  opc.ledStrip(3222, 18, ((18*spacing)/2+(columLoc*16)) + 2, RowHeight*6-rowNudge, spacing, 0, false);
  opc.ledStrip(3242, 52, ((52*spacing)/2+(columLoc*17)) + 6, RowHeight*6-rowNudge, spacing, 0, false);
  
  
  
}
