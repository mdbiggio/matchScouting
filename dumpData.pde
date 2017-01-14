public class dumpData {
  // Fields
  PrintWriter output = createWriter("Entries.txt");
  
  int matchNum;
  int teamNum;
  
  String matchNotes;
  // Constructors
  public dumpData(int m, int t, String mN) {
    this.matchNum = m;
    this.teamNum = t;
    
    this.matchNotes = mN;
    
  }
  
  // Methods
  void outputToFile() {
    output.println("Match,  Team,  Member,   alliance,  'Notes'");
    output.print(matchNumber.input + ",\t");
    output.print(teamNumber.input + ",\t");
    output.print(teamMember.input + ",\t");
    output.print(alli+",\t");
    output.print("'"+matchNotesOut+"'");
    println("printed to txt");
    closeFile();
   
}
void closeFile() {
  output.flush();
  output.close();
  println("Output File Closed");
  
}
  
  
  
  
  
  
}