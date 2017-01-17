
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
String time;
String sS = "30";
boolean run = false;
boolean matchEnded;

textBox matchNotes;
textBox matchNumber;
textBox teamNumber;
textBox teamMember;
textBox alliance;
textBox end;
textBox times;
textBox startMatchButton;

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

checkBox disabled;
checkBox potf;
checkBox flippedOver;
checkBox attemptedRope;
checkBox successfulRope;

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


void setup () {
  // this is where the team number is chosen via search and choose
  size(1920, 1080);

  output = createWriter("Entries.txt");
  font = createFont("Arial", 16, true);
  //println("SetupComplete");
  dump = new dumpData(matchNumberOut, teamNumberOut, matchNotesOut);
  //TextBoxes
  alliance = new textBox(850, 10, 30, 30, 0, 0, 255, 0, 0, 0, "", false);
  matchNumber = new textBox(10, 50, 180, 30, 200, 200, 200, 0, 0, 0, "Match Number: ", false);
  teamNumber = new textBox(10, 80, 180, 30, 200, 200, 200, 0, 0, 0, "Team Number: ", false);
  teamMember = new textBox(10, 110, 240, 30, 200, 200, 200, 0, 0, 0, "Scout  Name: ", false);
  matchNotes = new textBox(1500, 100, 400, 200, 200, 200, 200, 0, 0, 0, "Match Notes: \n", false);
  end = new textBox(1700, 950, 200, 60, 30, 255, 30, 0, 0, 0, "End Match", false);
  times = new textBox(900, 10, 95, 30, 200, 200, 200, 0, 0, 0, "Time: ", false);
  startMatchButton = new textBox(900, 40, 95, 30, 200, 200, 200, 0, 0, 0, "Start Match", false);
  
  gearsAuto = new counter(170, 220, 200, 200, 200, 0, 0, 0, 0, false);
  gearsTeleop = new counter(500, 220, 200, 200, 200, 0, 0, 0, 0, false);
  
  fuelLowAuto = new counter(170, 300, 200, 200, 200, 0, 0, 0, 0, false);
  fuelHighAuto = new counter(170, 380, 200, 200, 200, 0, 0, 0, 0, false);
  fuelLowTeleop = new counter(500, 300, 200, 200, 200, 0, 0, 0, 0, false);
  fuelHighTeleop = new counter(500, 380, 200, 200, 200, 0, 0, 0, 0, false);
  
  Points = new counter(300, 950, 200, 200, 200, 0, 0, 0, 0, false); 
  
  disabled = new checkBox(155, 510, 200, 200, 200, false);
  potf = new checkBox(280, 570, 200, 200, 200, false);
  flippedOver = new checkBox(210, 630, 200, 200, 200, false);
  attemptedRope = new checkBox(350, 690, 200, 200, 200, false);
  successfulRope = new checkBox(360, 750, 200, 200, 200, false);
  
  rankingPoints = new checkBoxGroup(485,505,200,200,200,4,-1);
  
  offenseRating =  new checkBoxGroup(825,395,200,200,200,5,-1);
  defenseRating =  new checkBoxGroup(825,450,200,200,200,5,-1);
  rating = new checkBoxGroup(825,505,200,200,200,5,-1);
  
  
  
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
  if (end.checkMPos() == true) {
    end.updateColor(30, 255, 30);
    matchNotesOut = matchNotes.input;
    dump.outputToFile();
    activeBox = "end";
    run = false;
    startMatchButton.updateColor(200,200,200);
  }
  if (end.checkMPos() == false) {
    end.updateColor(30, 200, 30);
    
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
  defenseRating.mousePressed();
  offenseRating.mousePressed();
  //Points.checkMPos();
  //if (Points.selectedBox == 1) {
  //  if (Points.start>9) {
  //    Points.start=Points.start-10;
  //    //println("subracted 10 points");
  //  } else {
  //    Points.start=0;
  //    //println("set the points to 0");
  //  }
  //  Points.selectedBox=0;
  //}
  //if (Points.selectedBox == 2) {
  //  if (Points.start>1) {
  //    Points.start=Points.start-1;
  //  }
  //  if (Points.start<1) {
  //    Points.start=0;
  //  }
  //  Points.selectedBox=0;
  //}
  //if (Points.selectedBox == 3) {
  //  Points.start = Points.start + 1;
  //  Points.selectedBox=0;
  //}
  //if (Points.selectedBox == 4) {
  //  Points.start = Points.start +10;
  //  Points.selectedBox=0;
  //}
  
  //if (disabled.checkMPos(1) == true) {
  //  disabled.updateColor(220, 220, 220);
  //}
  //if (disabled.checkMPos(0) == false) {
  //  disabled.updateColor(200, 200, 200);
  //}
  if (startMatchButton.checkMPos() == true) {
    startMatchButton.updateColor(0, 0, 255);
    run = true;
    startTime = millis();
  } //else {activeBox = "None";}
  //println(activeBox);
}

void draw() {


  //println("i= "+i);
  //i = i+1;
  background(255, 255, 255);
  fill(200);
  rect(10, 10, 180, 40);

  //Title
  textFont(font, 16);
  fill(0);
  text("Match Scouting 2017!", 20, 35);
  text("Alliance (Blue/Red)", 705, 30);
  
  text("-10        -1                             +1        +10", 180, 215);
  text("-10        -1                             +1        +10", 510, 215);
  
  textFont(font, 32);
  
  text("Autonomous", 240, 180);
  text("Teleop", 600, 180);
  
  text("# of Gears", 10, 260);
  text("Fuel High", 10, 340);
  text("Fuel Low",10, 420);
  
  text("Disabled:", 10, 540);
  text("Parts on the Field:", 10, 600);
  text("Flipped Over:", 10, 660);
  text("Attempted Rope Climb:", 10, 720);
  text("Successful Rope Climb:", 10, 780);
  

  
  //text("Ending Alliance Points:",10,520);
  text("Ranking Points:", 10,850);
  //text("Overall Performance Rating:", 620, 520);
  //text("Defense Rating:", 705, 465);
  //text("Offense Rating:", 710, 410);
  
  textSize(15);
  text("1     2     3     4", 490,500);
  text("1     2     3     4      5", 830, 500);
  text("1     2     3     4      5", 830, 445);
  text("1     2     3     4      5", 830, 390);
  textSize(16);
  //Body
  //text("Match Number: " + matchNum,10, 70);
  //text("Team Number: "+ teamNum,10,90);
  matchNumber.draw();
  teamNumber.draw();
  teamMember.draw();
  textFont(font,32);
  matchNotes.draw();
  end.draw();
  textFont(font,16);
  alliance.draw();
  
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
  
  Points.draw();
  
  disabled.draw();
  potf.draw();
  flippedOver.draw();
  attemptedRope.draw();
  successfulRope.draw();
  
  rankingPoints.draw();
  rating.draw();
  defenseRating.draw();
  offenseRating.draw();
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