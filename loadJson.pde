public class loadJson {
  JSONArray values;
  int scoutNum;
  

  void load(int scoutNum) {
    this.scoutNum = scoutNum;
    values = loadJSONArray("data.json");
  
    for (int i = 0; i < values.size(); i++) {
      
      JSONObject match = values.getJSONObject(i); 
  
      int factId = match.getInt("factId");
      String tournament = match.getString("Tournamnet");
      String alliance = match.getString("Alliance");
      int matchNum = match.getInt("Match #");
      int teamNum = match.getInt("Team #");
      
  
      println(factId + ", " + alliance + ", " + matchNum + ", " + teamNum + ", " + tournament);
    }
  }
}