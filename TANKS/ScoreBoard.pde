import processing.sound.*;

class ScoreBoard {
  int score;
  int level;
  float health;
  float health2;
  SoundFile scoreSound, levelSound, hitSound;
  PFont sFont;
  float h;
  float h2;
  ScoreBoard() {
    score = 0;
    sFont = createFont("ka1.ttf", 80);
    level = 1;
    health = 1;
    health2 = 1;
    h = 100;
    h2 = 100;
    scoreSound = new SoundFile(TANKS.this, "bleep.mp3");
    levelSound = new SoundFile(TANKS.this, "levelup.mp3");
    hitSound = new SoundFile(TANKS.this, "agh.wav");
  }

  void display() {
    //bar
    fill(200);
    rect(0, 0, width, h);
    //words
    fill(#224488);
    textFont(sFont);
    textSize(80);
    textAlign(CORNER);
    //text(score, 10, 75);
    textAlign(CORNER);
    text("T.A.N.K.S", 50, 75);
    //bottom border
    fill(#224488);
    rect(0, 100, width, 8);
  }

  void updateScore(int s) {
    //scoreSound.play();
    score = s;
  }

  void updateLevel(int lvl) {
    //levelSound.play();
    level = lvl;
  }

  void updateHealthBar(float h) {
    //hitSound.play();
    health = h;
  }
  void updateHealthBar2(float h2) {
    //hitSound.play();
    health2 = h2;
  }
}
