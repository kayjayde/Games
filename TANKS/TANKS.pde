PlayAgain paScreen;
Win1 w1Screen;
Game gScreen;
Instructions iScreen;
Initials initialScreen;
int score;
long noInputCnt;
boolean gameOver;
int state;
/* States:
 0: GameOver/Press start to play again Screen
 1: Instructions screen
 2: game playing
 3: win
 4: blank screen
 */
 //yes

void setup() {
  paScreen = new PlayAgain();
  w1Screen = new Win1();
  gScreen = new Game();
  iScreen = new Instructions();
  initialScreen = new Initials();
  fullScreen(P2D);
  gameOver = false;
  state = 0;
  noInputCnt = 0;
}

void draw() {
  noInputCnt++;
  if (noInputCnt < 60 * 60 * 30) {
    noInputCnt++;
  }
  else {
    state = 4;
  }
  
  if (state == 2 && gScreen.gameOver()) {
    state = 3;
  }
  
  switch(state) {
  case 0:
    paScreen.display();
    break;
  case 1:
    iScreen.display();
    break;
  case 2:
    gScreen.display();
    break;
  case 3:
    w1Screen.display();
    break;
  case 4:
    initialScreen.display();
    break;
  }
}

void keyPressed() {
  noInputCnt = 0;
  if (state == 4) {
    state = 0;
  }
  
  if (key == 'z') {
    if (state == 0) {
      state = 1;
    }
    else if (state == 1) {
      state = 2;
      gScreen = new Game();
    }
    else if (state == 3) {
      saveNewScore(initialScreen.name.initials, gScreen.score, "scoreBoard.json");
      state = 0;
    }
  }

  if (state == 2) {
    gScreen.keyPressed();
  }

  if (state == 3) {
    initialScreen.keyPressed();
  }
}

void keyReleased() {
  if (state == 2) {
    gScreen.keyReleased();
  }
}
