
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
int TEAMNUM;
String time;
String sS = "30";
boolean run = false;
boolean matchEnded;

int page = 1;

JSONArray values;
int scoutNum;

textBox matchNotes;
textBox teamNumber;
textBox teamMember;
textBox alliance;
textButton end;
textBox times;

textButton startMatchButton;
textButton loadMatchButton;

counter matchNumber;
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
checkBox noShow;

textButtonGroup nameSelect;

boolean mousePos;
int mX = mouseX;
int mY = mouseY;
String alli = "blue";
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
  
  //output = createWriter("Entries.txt");
  font = createFont("Arial", 16, true);
  //println("SetupComplete");
  dump = new dumpData(matchNumberOut, teamNumberOut, matchNotesOut);
  //TextBoxes
  alliance = new textBox(1500, 10, 80, 80, 0, 0, 255, 0, 0, 0, "", false, false, true);
  //page 1
  pageSelect = new checkBoxGroup(825,10,200,200,200,3,0);
  nameSelect = new textButtonGroup(600, 200, 200, 200, 200, 5, 5, 0);
  matchNumber = new counter(10, 900, 120, 80, 200, 200, 200, 0, 0, 0, 1, false);
  teamNumber = new textBox(10, 200, 500, 60, 200, 200, 200, 0, 0, 0, "Team Number: ", false, false, false);
  teamMember = new textBox(10, 300, 500, 60, 200, 200, 200, 0, 0, 0, "Scout  Name: ", false, true, false);
  //page 2
  times = new textBox(1600, 10, 200, 60, 200, 200, 200, 0, 0, 0, "Time: ", false, false, false);
  startMatchButton = new textButton(1600, 80, 200, 60, 200, 200, 200, 0, 0, 0, "Start Match", false);
  
  loadMatchButton = new textButton(390,1100,200,60,200,200,200,0,0,0,"Load Match", false);
  
  gearsAuto = new counter(170, 220, 120, 40, 200, 200, 200, 0, 0, 0, 0, false);
  gearsTeleop = new counter(1070, 220, 120, 40, 200, 200, 200, 0, 0, 0, 0, false);
  
  fuelLowAuto = new counter(170, 420, 120, 40, 200, 200, 200, 0, 0, 0, 0, false);
  fuelHighAuto = new counter(170, 620, 120, 40, 200, 200, 200, 0, 0, 0, 0, false);
  fuelLowTeleop = new counter(1070, 420, 120, 40, 200, 200, 200, 0, 0, 0, 0, false);
  fuelHighTeleop = new counter(1070, 620, 120, 40, 200, 200, 200, 0, 0, 0, 0, false);
  
  
  
  disabled = new checkBox(600, 870, 200, 200, 200, false);
  potf = new checkBox(600, 960, 200, 200, 200, false);
  flippedOver = new checkBox(600, 1050, 200, 200, 200, false);
  attemptedRope = new checkBox(1200, 870, 200, 200, 200, false);
  successfulRope = new checkBox(1200, 960, 200, 200, 200, false);
  noShow = new  checkBox(1200, 1050, 200, 200, 200, false);
  
  //page 3
  Points = new counter(440, 240, 80, 20, 200, 200, 200, 0, 0, 0, 0, false); 
  rankingPoints = new checkBoxGroup(400,430,200,200,200,4,-1);
  rating = new checkBoxGroup(620,620,200,200,200,5,-1);
  defenseRating =  new checkBoxGroup(410,810,200,200,200,5,-1);
  offenseRating =  new checkBoxGroup(410,1000,200,200,200,5,-1);
  matchNotes = new textBox(1150, 100, 700, 800, 200, 200, 200, 0, 0, 0, "Match Notes: \n", false, true, false);
  end = new textButton(1700, 950, 200, 80, 30, 255, 30, 0, 0, 0, "End Match", false);
}

void mousePressed() {
  activeBox = "";
  if (page == 1) {
    matchNumber.mousePressed();
    teamNumber.mousePressed();
    teamMember.mousePressed();
    if (teamMember.activated == true) {
      activeBox = "teamMember";
    }
    nameSelect.mousePressed();
    loadMatchButton.mousePressed();
    if (loadMatchButton.activated) {
      loadJSON(matchNumber.start);
    }
  } 
  if (page == 2) {
    gearsAuto.mousePressed();
    gearsTeleop.mousePressed();
    fuelLowAuto.mousePressed();
    fuelHighAuto.mousePressed();
    fuelLowTeleop.mousePressed();
    fuelHighTeleop.mousePressed();
    
    
    disabled.mousePressed();
    potf.mousePressed();
    flippedOver.mousePressed();
    attemptedRope.mousePressed();
    successfulRope.mousePressed();
    if (successfulRope.isChecked == true) {attemptedRope.isChecked = true;}
    noShow.mousePressed();
    startMatchButton.mousePressed();
    if (startMatchButton.activated == true) {
      startMatchButton.updateColor(0, 0, 255);
      run = true;
      startTime = millis();
    }
      
  }
  if (page == 3) {
    matchNotes.mousePressed();
    if (matchNotes.activated == true) {
      activeBox = "matchNotes";
    }
    end.mousePressed();
    if(end.activated == true) {
      i++;
      end.updateColor(30, 255, 30);
      //matchNotesOut = matchNotes.input;
      //dump.outputToFile();
      activeBox = "end";
      run = false;
      startMatchButton.updateColor(200,200,200);
      pageSelect.boxes.get(2).isChecked = false;
      pageSelect.boxes.get(0).isChecked = true;
      pageSelect.checkedBox = 0;
      saveJSON();
      matchNumber.start = matchNumber.start + 1;
      loadJSON(matchNumber.start);
      
      
    }
    defenseRating.mousePressed();
    offenseRating.mousePressed();
    rankingPoints.mousePressed();
    rating.mousePressed();
    Points.mousePressed();
  }
   
  pageSelect.mousePressed();
  page = pageSelect.checkedBox+1;
  println(page);
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
    loadMatchButton.draw();
    
  } else if (page == 2) {

    fill(0);

    text("Alliance (Blue/Red)", 1150, 60);
    
    text("-10           -1                           +1         +10", 200, 215);
    text("-10           -1                           +1         +10", 1100, 215);
    
    textFont(font, 32);
    
    text("Autonomous", 490, 180);
    text("Teleop", 1420, 180);
    
    text("# of Gears", 10, 310);
    text("Fuel High", 10, 510);
    text("Fuel Low",10, 710);
    
    text("Disabled:", 450, 920);
    text("Parts on the Field:", 325, 1010);
    text("Flipped Over:", 395, 1100);
    text("Attempted Rope Climb:", 860, 920);
    text("Successful Rope Climb:", 850, 1010);
    text("No Show", 900, 1100);
     
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
    noShow.draw();
    
    
  } else {
    fill(0);
    text("Ending Alliance Points:",10,300);
    text("Ranking Points:", 10, 480);
    text("Overall Performance Rating:", 10, 670);
    text("Defense Rating:", 10, 860);
    text("Offense Rating:", 10, 1050);
    
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
    text("1           2           3           4", 350,425);
    text("1            2           3            4           5", 560, 615);
    text("1            2           3            4           5", 350, 805);
    text("1            2           3            4           5", 350, 995);
    
  }
}

void updateAlli() {
  if (child.scout < 4) {alliance.updateColor(0,0,255);}
  if (child.scout > 3) {alliance.updateColor(255,0,0);}
}

void loadJSON(int MATCH) {
    values = loadJSONArray("data.json");
    println("match: " + MATCH);
    println("scout: " + child.scout);
    
    int i = (MATCH-1)*6;
    i = i+child.scout;
    i--;

    JSONObject match = values.getJSONObject(i); 
    
    String tournament = match.getString("Tournament");
    String alli = match.getString("Alliance");
    
    int MATCHNUM = match.getInt("Match #");
    int TEAMNUM = match.getInt("Team #");
    
    String TEAMNUMs = str(TEAMNUM);
    
    println(i + ", " + alli + ", " + MATCHNUM + ", " + TEAMNUM + ", " + tournament);
    println(alli);
    updateAlli(); 
    teamNumber.input = TEAMNUMs;
    
}

void saveJSON() {
  JSONArray values1;
  values1 = loadJSONArray("dataOut.json");
  println(values1);
  int MATCH = matchNumber.start;
  i = (MATCH-1)*6;
  JSONObject match = new JSONObject();
  
  match.setInt("FactId", i);
  match.setInt("Team #", int(teamNumber.input));
  
  match.setString("Scout Name", teamMember.input);
  match.setInt("Gears Auto", gearsAuto.start);
  match.setInt("Gears Tele", gearsTeleop.start);
  match.setInt("Low Fuel Auto", fuelLowAuto.start);
  match.setInt("High Fuel Auto", fuelHighAuto.start);
  match.setInt("Low Fuel Tele", fuelLowTeleop.start);
  match.setInt("High Fuel Tele", fuelHighTeleop.start);
  
  match.setBoolean("Disabled", disabled.isChecked);
  match.setBoolean("Parts on the Field", potf.isChecked);
  match.setBoolean("Flip", flippedOver.isChecked);
  match.setBoolean("Rope Attempt", attemptedRope.isChecked);
  match.setBoolean("Rope Climb", successfulRope.isChecked);
  match.setBoolean("No Show", noShow.isChecked);
  
  match.setString("Notes", matchNotes.input);
  
  
  
  values1.append(match);
  saveJSONArray(values1, "data/dataOut.json");
}

void keyPressed() {
  println(key+" "+activeBox);
  //if (activeBox=="matchNumber") {
    //matchNumber.update(key, keyCode);
  //}
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