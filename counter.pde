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
    this.box1Cs[2] = int(x+80);
    this.box1Cs[3] = int(y+90);
    
    this.box2Cs[0] = int(x+100);
    this.box2Cs[1] = int(y+10);
    this.box2Cs[2] = int(x+180);
    this.box2Cs[3] = int(y+90);
    
    this.box3Cs[0] = int(x+320);
    this.box3Cs[1] = int(y+10);
    this.box3Cs[2] = int(x+400);
    this.box3Cs[3] = int(y+90);
    
    this.box4Cs[0] = int(x+420);
    this.box4Cs[1] = int(y+10);
    this.box4Cs[2] = int(x+500);
    this.box4Cs[3] = int(y+90);
  }
  public void draw() {
    fill(bgR, bgG, bgB);
    
    rect(box1Cs[0],box1Cs[1],80,80);//-10
    rect(box2Cs[0],box2Cs[1],80,80);//-1
    rect(box2Cs[0]+100,y,100,100);//number
    rect(box3Cs[0],box3Cs[1],80,80);//+1
    rect(box4Cs[0],box4Cs[1],80,80);//+10
    
    
    fill(Tr,Tg,Tb);
    textFont(font,32);
    text("+",x+350,y+60);
    text("+",x+450,y+60);
    text(start, x+220, y+60);
    text("-", x+40, y+60);
    text("-",x+130,y+60);
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