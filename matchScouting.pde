
PrintWriter output;
PFont font;
String Input="";
int v=110;
int i=0;
int y = 0;
int x = 0;
int t, m = 2, s;
int interval = 150;
int startTime;
int currMatch;
String time;
String sS = "30";
boolean run = false;
boolean matchEnded;

int page = 1;

textBox matchNotes;
textBox matchNumber;
textBox teamNumber;
textBox teamMember;
textBox alliance;
textButton end;
textBox times;
textButton startMatchButton;

counter Points;
counter gearsAuto;
counter gearsTeleop;
counter fuelLowAuto;
counter fuelHighAuto;
counter fuelLowTeleop;
counter fuelHighTeleop;


checkBoxGroup rankingPoints;
checkBoxGroup rating;
checkBoxGroup defenseRating;
checkBoxGroup offenseRating;
checkBoxGroup pageSelect;

checkBox disabled;
checkBox potf;
checkBox flippedOver;
checkBox attemptedRope;
checkBox successfulRope;

textButtonGroup nameSelect;

boolean mousePos;
int mX = mouseX;
int mY = mouseY;
String alli = "Blue";
String activeBox = "";
dumpData dump;
int matchNumberOut = 1;
int teamNumberOut = 1111;
String matchNotesOut = "Notes";
int[] numbers = {1, 2, 3, 4, 5, 6, 7, 8, 9, 0};

ChildApplet child;

void settings() {
  fullScreen();
  smooth();
}

void setup () {
  surface.setTitle("Match Scouting 2017");
  // this is where the team number is chosen via search and choose
  //size(1920, 1080);
  
  child = new ChildApplet();
  //child.setup();
  
  output = createWriter("Entries.txt");
  font = createFont("Arial", 16, true);
  //println("SetupComplete");
  dump = new dumpData(matchNumberOut, teamNumberOut, matchNotesOut);
  //TextBoxes
  alliance = new textBox(1500, 10, 80, 80, 0, 0, 255, 0, 0, 0, "", false);
  //page 1
  matchNumber = new textBox(10, 200, 500, 60, 200, 200, 200, 0, 0, 0, "Match Number: ", false);
  teamNumber = new textBox(10, 300, 500, 60, 200, 200, 200, 0, 0, 0, "Team Number: ", false);
  teamMember = new textBox(10, 400, 500, 60, 200, 200, 200, 0, 0, 0, "Scout  Name: ", false);
  //page 2
  matchNotes = new textBox(1150, 50, 700, 800, 200, 200, 200, 0, 0, 0, "Match Notes: \n", false);
  end = new textButton(1700, 950, 200, 80, 30, 255, 30, 0, 0, 0, "End Match", false);
  times = new textBox(1600, 10, 200, 60, 200, 200, 200, 0, 0, 0, "Time: ", false);
  startMatchButton = new textButton(1600, 80, 200, 60, 200, 200, 200, 0, 0, 0, "Start Match", false);
  
  gearsAuto = new counter(170, 220, 200, 200, 200, 0, 0, 0, 0, false);
  gearsTeleop = new counter(800, 220, 200, 200, 200, 0, 0, 0, 0, false);
  
  fuelLowAuto = new counter(170, 340, 200, 200, 200, 0, 0, 0, 0, false);
  fuelHighAuto = new counter(170, 460, 200, 200, 200, 0, 0, 0, 0, false);
  fuelLowTeleop = new counter(800, 340, 200, 200, 200, 0, 0, 0, 0, false);
  fuelHighTeleop = new counter(800, 460, 200, 200, 200, 0, 0, 0, 0, false);
  
  
  
  disabled = new checkBox(160, 600, 200, 200, 200, false);
  potf = new checkBox(280, 690, 200, 200, 200, false);
  flippedOver = new checkBox(210, 780, 200, 200, 200, false);
  attemptedRope = new checkBox(350, 870, 200, 200, 200, false);
  successfulRope = new checkBox(360, 960, 200, 200, 200, false);
  
  //page 3
  Points = new counter(440, 240, 200, 200, 200, 0, 0, 0, 0, false); 
  rankingPoints = new checkBoxGroup(400,375,200,200,200,4,-1);
  rating = new checkBoxGroup(620,500,200,200,200,5,-1);
  defenseRating =  new checkBoxGroup(410,625,200,200,200,5,-1);
  offenseRating =  new checkBoxGroup(410,750,200,200,200,5,-1);
  
  
  pageSelect = new checkBoxGroup(825,10,200,200,200,3,0);
  nameSelect = new textButtonGroup(600, 200, 200, 200, 200, 5, 5, 0);
  
  
}

void mousePressed() {
  
  if (alliance.checkMPos() == true) {
    if (alli=="Blue") {
      alliance.updateColor(255, 0, 0);
      alli="Red";
    } else {
      alliance.updateColor(0, 0, 255);
      alli="Blue";
    }
  }
  if (matchNumber.checkMPos() == true) {
    matchNumber.updateColor(220, 220, 220);
    activeBox = "matchNumber";
    //println(activeBox);
  } 
  if (matchNumber.checkMPos() == false) {
    matchNumber.updateColor(200, 200, 200);
  }
  if (matchNotes.checkMPos() == true) {
    matchNotes.updateColor(220,220,220);
    activeBox = "matchNotes";
  }
  if (matchNotes.checkMPos() == false) {
    matchNotes.updateColor(200, 200, 200);
    activeBox = "";
  }
  if (teamNumber.checkMPos() == true) {
    teamNumber.updateColor(220, 220, 220);
    activeBox = "teamNumber";
  }
  if (teamNumber.checkMPos() == false) {
    teamNumber.updateColor(200, 200, 200);
  }
  if (teamMember.checkMPos() == true) {
    teamMember.updateColor(220, 220, 220);
    activeBox = "teamMember";
  }
  if (teamMember.checkMPos() == false) {
    teamMember.updateColor(200, 200, 200);
  }
  //if (end.checkMPos() == true) {
  //  end.updateColor(30, 255, 30);
  //  matchNotesOut = matchNotes.input;
  //  dump.outputToFile();
  //  activeBox = "end";
  //  run = false;
  //  startMatchButton.updateColor(200,200,200);
  //}
  //if (end.checkMPos() == false) {
  //  end.updateColor(30, 200, 30);
    
  //}
  end.mousePressed();
  if(end.activated == true) {
    end.updateColor(30, 255, 30);
    matchNotesOut = matchNotes.input;
    dump.outputToFile();
    activeBox = "end";
    run = false;
    startMatchButton.updateColor(200,200,200);
    
  }
  gearsAuto.mousePressed();
  gearsTeleop.mousePressed();
  fuelLowAuto.mousePressed();
  fuelHighAuto.mousePressed();
  fuelLowTeleop.mousePressed();
  fuelHighTeleop.mousePressed();
  
  Points.mousePressed();
  disabled.mousePressed();
  rankingPoints.mousePressed();
  rating.mousePressed();
  potf.mousePressed();
  flippedOver.mousePressed();
  attemptedRope.mousePressed();
  successfulRope.mousePressed();
  if (successfulRope.isChecked == true) {attemptedRope.isChecked = true;}
  
  defenseRating.mousePressed();
  
  offenseRating.mousePressed();
  
  pageSelect.mousePressed();
  page = pageSelect.checkedBox+1;
  println(page);
  
  nameSelect.mousePressed();
  
  startMatchButton.mousePressed();

  if (startMatchButton.activated == true) {
    startMatchButton.updateColor(0, 0, 255);
    run = true;
    startTime = millis();
  } //else {activeBox = "None";}
  //println(activeBox);
}

void draw() {
  
  background(255, 255, 255);
  fill(200);
  rect(10, 10, 420, 80);
  //title
  textFont(font, 40);
  fill(0);
  text("Match Scouting 2017!", 20, 60);
  alliance.draw();
  text("Alliance (Blue/Red)", 1150, 60);
  
  pageSelect.draw();
  
  if (page == 1) {
    textFont(font, 32);

    matchNumber.draw();
    teamNumber.draw();
    teamMember.draw();
    nameSelect.draw();
    
  } else if (page == 2) {

    fill(0);

    text("Alliance (Blue/Red)", 1150, 60);
    
    text("-10     -1               +1     +10", 180, 215);
    text("-10     -1               +1     +10", 810, 215);
    
    textFont(font, 32);
    
    text("Autonomous", 240, 180);
    text("Teleop", 600, 180);
    
    text("# of Gears", 10, 260);
    text("Fuel High", 10, 400);
    text("Fuel Low",10, 520);
    
    text("Disabled:", 10, 650);
    text("Parts on the Field:", 10, 740);
    text("Flipped Over:", 10, 830);
    text("Attempted Rope Climb:", 10, 920);
    text("Successful Rope Climb:", 10, 1010);
   
    timer();
    times.draw();
    times.start = "Time: "+m+":"+sS;
    startMatchButton.draw();
    
    fuelLowAuto.draw();
    fuelHighAuto.draw();
    fuelLowTeleop.draw();
    fuelHighTeleop.draw();
    
    gearsAuto.draw();
    gearsTeleop.draw();
    
    disabled.draw();
    potf.draw();
    flippedOver.draw();
    attemptedRope.draw();
    successfulRope.draw();
    
    
    
  } else {
    fill(0);
    text("Ending Alliance Points:",10,300);
    text("Ranking Points:", 10, 425);
    text("Overall Performance Rating:", 10, 550);
    text("Defense Rating:", 10, 675);
    text("Offense Rating:", 10, 800);
    
    Points.draw();
    rankingPoints.draw();
    rating.draw();
    defenseRating.draw();
    offenseRating.draw();
    end.draw();
    font = createFont("Lucida Console", 32, true);
    textFont(font, 32);
    matchNotes.draw();
    font = createFont("Arial", 32, true);
    textFont(font, 32);
    
    fill(0);
    text("1           2           3           4", 350,370);
    text("1            2           3            4           5", 560, 495);
    text("1            2           3            4           5", 350, 620);
    text("1            2           3            4           5", 350, 745);
    
  }
}

void keyPressed() {
  println(key+" "+activeBox);
  if (activeBox=="matchNumber") {
    matchNumber.update(key, keyCode);
  }
  if (activeBox=="teamNumber") {
    teamNumber.update(key, keyCode);
  }
  if (activeBox=="teamMember") {
    teamMember.update(key, keyCode);
  }
  if (activeBox=="matchNotes") {
    matchNotes.update(key, keyCode);
  }
  //if(activeBox=="") {}
  //if(activeBox=="") {}
}
void timer() {
  if (run) {
    t = interval+(startTime/1000)-int(millis()/1000);
    m = t/60;
    s = t%60;
    sS = nf(s, 2);
    time = nf(t, 3);
    if (t == 0) {
      println("GAME OVER");
      run = false;
      interval+=150;
    }
  }
}