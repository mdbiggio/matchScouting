public class counter {
  int bgR, bgG, bgB;
  float x,y;
  int Tr, Tg, Tb;
  int start = 0;
  boolean activated;
  int[] box1Cs = {0,0,0,0};
  int[] box2Cs = {0,0,0,0};
  int[] box3Cs = {0,0,0,0};
  int[] box4Cs = {0,0,0,0};
  int selectedBox = 0;
  
    
  
  public counter (float x, float y, int bgR, int bgG, int bgB, int Tr, int Tg, int Tb, int start, boolean activated) {
    this.x = x;
    this.y = y;
    this.bgR = bgR;
    this.bgG = bgG;
    this.bgB = bgB;
    this.Tr = Tr;
    this.Tg = Tg;
    this.Tb = Tb;
    this.start = start;
    this.activated = activated;
    this.box1Cs[0] = int(x);//println("box1Cs[0]"+this.box1Cs[0]);
    this.box1Cs[1] = int(y+10);
    this.box1Cs[2] = int(x+40);
    this.box1Cs[3] = int(y+50);
    
    this.box2Cs[0] = int(x+60);
    this.box2Cs[1] = int(y+10);
    this.box2Cs[2] = int(x+100);
    this.box2Cs[3] = int(y+50);
    
    this.box3Cs[0] = int(x+200);
    this.box3Cs[1] = int(y+10);
    this.box3Cs[2] = int(x+240);
    this.box3Cs[3] = int(y+50);
    
    this.box4Cs[0] = int(x+260);
    this.box4Cs[1] = int(y+10);
    this.box4Cs[2] = int(x+300);
    this.box4Cs[3] = int(y+50);
    //println("0: "+box1Cs[0]+" 1: "+box1Cs[1]+" 2: "+box1Cs[2]+" 3: "+box1Cs[3]);
    //println("0: "+box2Cs[0]+" 1: "+box2Cs[1]+" 2: "+box2Cs[2]+" 3: "+box2Cs[3]);
    //println("0: "+box3Cs[0]+" 1: "+box3Cs[1]+" 2: "+box3Cs[2]+" 3: "+box3Cs[3]);
    //println("0: "+box4Cs[0]+" 1: "+box4Cs[1]+" 2: "+box4Cs[2]+" 3: "+box4Cs[3]);
  }
  public void draw() {
    fill(bgR, bgG, bgB);
    
    rect(box1Cs[0],box1Cs[1],40,40);//-10
    rect(box2Cs[0],box2Cs[1],40,40);//-1
    rect(box2Cs[0]+60,y,60,60);//number
    rect(box3Cs[0],box3Cs[1],40,40);//+1
    rect(box4Cs[0],box4Cs[1],40,40);//+10
    
    
    fill(Tr,Tg,Tb);
    textFont(font,32);
    text("+",x+210,y+40);
    text("+",x+270,y+40);
    text(start, x+130, y+40);
    text("-", x+10, y+40);
    text("-",x+70,y+40);
  }
  
  void mousePressed() {
    //println("checking if a counter was clicked");
    int mX=mouseX;
    int mY=mouseY;
    if(mX>box1Cs[0] && mY>box1Cs[1] && mX<box1Cs[2] && mY<box1Cs[3]) {
      if (start > 9) {
        start = start - 10;
      } else {start = 0;}
      //println("-10 points");
      //println(start);
      selectedBox = 1;
    } else if(mX>box2Cs[0] && mY>box2Cs[1] && mX<box2Cs[2] && mY<box2Cs[3]) {
      if(start>0) {start = start - 1;}
      //println("-1 point");
      //println(start);
      selectedBox = 2;
    } else if(mX>box3Cs[0] && mY>box3Cs[1] && mX<box3Cs[2] && mY<box3Cs[3]) {
      start = start + 1;
      //println("+1 point");
      //println(start);
      selectedBox = 3;
    } else if(mX>box4Cs[0] && mY>box4Cs[1] && mX<box4Cs[2] && mY<box4Cs[3]) {
      start = start + 10;
      //println("+10 points");
      //println(start);
      selectedBox = 4;
    } else {
      selectedBox = 0;
    }
    //println("selected Box: "+selectedBox);
  }
}