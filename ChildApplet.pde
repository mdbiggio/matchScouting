class ChildApplet extends PApplet {
  
  public ChildApplet() {
    super();
    PApplet.runSketch(new String[]{this.getClass().getName()}, this);
  }
  
  
  public void setup(int Width, int Height) {
    surface.setTitle("Child Sketch");
    size(Width, Height);
  }
  
  public void draw() {
    
  }
  
  public void mousePressed() {
  
  }
  
  
  
}