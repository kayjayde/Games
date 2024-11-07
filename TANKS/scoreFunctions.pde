void saveNewScore(String initials, int score, String fileName)
{
  JSONObject json = loadJSONObject(fileName);
  JSONArray scores = json.getJSONArray("scores");
  JSONObject finalEntry = new JSONObject();
  JSONArray finalArray = scores;
  finalEntry.setString("name", initials);
  finalEntry.setInt("value", score);
  for (int i = 0; i < finalArray.size(); i++) // Goes through each item in the array
  {
    JSONObject tValue = finalArray.getJSONObject(i);
    if (tValue.getInt("value") < finalEntry.getInt("value")) // Checking if current score is greater than score at index
    {
      for (int j = finalArray.size()-1; j >= i; j--) // If it is then it shifts all the scores from the current index to the size of the array down by one
      {
        JSONObject store = finalArray.getJSONObject(j);
        finalArray.setJSONObject(j+1, store);
        println(j);
      }
      finalArray.setJSONObject(i, finalEntry);  // Sets the current score to the index
      break;                                    // Breaks because already found score lower than current score, no need to search further
    }
  }

  json.setJSONArray("scores", finalArray);
  saveJSONObject(json, fileName);
}

void displayScores(String fileName, float x, float y)
{
  JSONObject json = loadJSONObject(fileName);
  JSONArray scores = json.getJSONArray("scores");
  push();
  noStroke();
  textSize(35);
  textAlign(CORNER);
  fill(0);
  rect(x-200, y, 400, height * .6);
  fill(255);
  for (int i = 0; i < 10; i++)
  {
    JSONObject entry = scores.getJSONObject(i);
    text(entry.getString("name") + " " + entry.getInt("value"), x - (textWidth(entry.getString("name") + " " + entry.getInt("value"))/2), y + 35 + 40*i);
  }
  pop();
}
