class PlayAgain {
  PImage bg;

  PlayAgain() {
    bg = loadImage("tbg2.png");
  }

  void display() {
    image(bg, 0, 0, width, height);
    displayScores("scoreBoard.json", width * 0.12, height * .4);
  }
}
