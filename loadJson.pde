public class loadJson {
  JSONArray values;
  int scoutNum;
  

  void load(int scoutNum) {
    this.scoutNum = scoutNum;
    values = loadJSONArray("data.json");
  
    for (int i = 0; i < values.size(); i++) {
      
      JSONObject match = values.getJSONObject(i); 
  
      int factId = match.getInt("factId");
      String Alliance = match.getString("Alliance");
      int Match = match.getInt("Match #");
      int Team = match.getInt("Team #");
      
  
      println(factId + ", " + Alliance + ", " + Match + ", " + Team);
    }
  }
}