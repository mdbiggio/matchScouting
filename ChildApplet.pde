class ChildApplet extends PApplet {
  int scout = 0;
  
  int box1fill = 200;
  int box2fill = 200;
  int box3fill = 200;
  int box4fill = 200;
  int box5fill = 200;
  int box6fill = 200;
  
  
  
  public void setup() {
    surface.setTitle("Child Sketch");    
    noLoop();
  }
  
  public void settings(){
    size(600,100);

  }
  
  public ChildApplet() {
    super();
    PApplet.runSketch(new String[]{this.getClass().getName()}, this);
  }
  
  
  
  
  public void draw() {
    background(255, 255, 255);
    
    fill(box1fill);
    rect(10,10,80,80);
    fill(box2fill);
    rect(110,10,80,80);
    fill(box3fill);
    rect(210,10,80,80);
    fill(box4fill);
    rect(310,10,80,80);
    fill(box5fill);
    rect(410,10,80,80);
    fill(box6fill);
    rect(510,10,80,80);
    
  }
  
  public void mousePressed() {
    int x = mouseX;
    int y = mouseY;
    if (y > 10 && y < 90) {
      if (x > 10 && x < 110) {scout = 1; box1fill = 220; box2fill = 200; box3fill = 200; box4fill = 200; box5fill = 200; box5fill = 200;}
      if (x > 110 && x < 190) {scout = 2; box1fill = 200; box2fill = 220; box3fill = 200; box4fill = 200; box5fill = 200; box6fill = 200;}
      if (x > 210 && x < 290) {scout = 3; box1fill = 200; box2fill = 200; box3fill = 220; box4fill = 200; box5fill = 200; box6fill = 200;}
      if (x > 310 && x < 390) {scout = 4; box1fill = 200; box2fill = 200; box3fill = 200; box4fill = 220; box5fill = 200; box6fill = 200;}
      if (x > 410 && x < 490) {scout = 5; box1fill = 200; box2fill = 200; box3fill = 200; box4fill = 200; box5fill = 220; box6fill = 200;}
      if (x > 510 && x < 590) {scout = 6; box1fill = 200; box2fill = 200; box3fill = 200; box4fill = 200; box5fill = 200; box6fill = 220;}
      redraw();
    }
    println("Box: " + scout + " x: " + x + " y: " + y);
    int matchNum = 1;
    int factId = scout+((matchNum-1)*6);
    println(factId);
  
  } 
}