class Game {
  PImage cImg;
  ScoreBoard sb;
  int score;
  int level;
  boolean fiveDown;
  boolean minusDown;
  boolean sixDown;
  boolean equalDown;
  float bcooldown;
  float b2cooldown;
  Background bg;
  Player p;
  Player2 p2;
  Enemy enemies[];
  Healing healing[];


  Game() {
    cImg = loadImage("player1.png");
    sb = new ScoreBoard();
    bg = new Background(width * 2, height * 2);
    p = new Player(0, 0, bg.w, bg.h);
    p2 = new Player2( 0, 0, bg.w, bg.h);
    gameStart();
  }

  void gameStart() {
    p.gameStart(-550, 300);
    p2.gameStart(550, -350);
    enemies = new Enemy[5];
    healing = new Healing[2];
    enemies[0] = new Enemy(-400, 200);
    enemies[1] = new Enemy(400, 350);
    enemies[2] = new Enemy(600, -200);
    enemies[3] = new Enemy(-500, -250);
    enemies[4] = new Enemy(0, -75);
    healing[0] = new Healing(300, 200);
    healing[1] = new Healing(-300, -200);
    score = 1000;
    level = 1;
    bcooldown = 0;
    b2cooldown = 0;
    fiveDown = false;
    minusDown = false;
    sixDown = false;
    equalDown = false;
  }

  void display() {
    p.update();
    p2.update();
    bcooldown--;
    b2cooldown--;
    push();
    cameraFollowPlayer(CENTER, CENTER);
    bg.display();
    for (Enemy e : enemies) {
      e.display();
      if (dist(e.x, e.y, p.x, p.y)<75) {
        p.health -= 0.003;
        sb.updateHealthBar(p.health);
      }
      if (dist(e.x, e.y, p2.x, p2.y)<75) {
        p2.health -= 0.003;
        sb.updateHealthBar2(p2.health);
        println(p2.health);
      }
      if (dist(e.x, e.y, p.b.x, p.b.y)<90) {
        p.b.x = p.x+2000;
        p.b.y = p.y;
        p.b.xVelo = 0;
        p.b.yVelo = 0;
      }
      if (dist(e.x, e.y, p2.b.x, p2.b.y)<90) {
        p2.b.x = p2.x+2000;
        p2.b.y = p2.y;
        p2.b.xVelo = 0;
        p2.b.yVelo = 0;
      }
      if (dist(e.x, e.y, p.tb1.x, p.tb1.y)<90) {
        p.tb1.x = p.x+2000;
        p.tb1.y = p.y;
        p.tb1.xVelo = 0;
        p.tb1.yVelo = 0;
      }
      if (dist(e.x, e.y, p2.tb1.x, p2.tb1.y)<90) {
        p2.tb1.x = p2.x+2000;
        p2.tb1.y = p2.y;
        p2.tb1.xVelo = 0;
        p2.tb1.yVelo = 0;
      }
      if (dist(e.x, e.y, p.tb2.x, p.tb2.y)<90) {
        p.tb2.x = p.x+2000;
        p.tb2.y = p.y;
        p.tb2.xVelo = 0;
        p.tb2.yVelo = 0;
      }
      if (dist(e.x, e.y, p2.tb2.x, p2.tb2.y)<90) {
        p2.tb2.x = p2.x+2000;
        p2.tb2.y = p2.y;
        p2.tb2.xVelo = 0;
        p2.tb2.yVelo = 0;
      }
      if (dist(e.x, e.y, p.tb3.x, p.tb3.y)<90) {
        p.tb3.x = p.x+2000;
        p.tb3.y = p.y;
        p.tb3.xVelo = 0;
        p.tb3.yVelo = 0;
      }
      if (dist(e.x, e.y, p2.tb3.x, p2.tb3.y)<90) {
        p2.tb3.x = p2.x+2000;
        p2.tb3.y = p2.y;
        p2.tb3.xVelo = 0;
        p2.tb3.yVelo = 0;
      }
    }
    for (Healing h : healing) {
      h.display();
      if (dist(h.x, h.y, p.x, p.y)< 50 && h.ate == false) {
        p.health += 0.10;
        sb.updateHealthBar(p.health);
        h.ate = true;
        h.x = random(0, width/2);
        h.y = random(0, height/2);
        h.frames = 600;
        println(p.health);
      }
      if (dist(h.x, h.y, p2.x, p2.y)< 50  && h.ate == false) {
        p2.health += 0.10;
        sb.updateHealthBar2(p2.health);
        h.ate = true;
        h.x = random(0, width/2);
        h.y = random(0, height/2);
        h.frames = 600;
        println(p.health);
      }
      if (h.frames >= 600) {
        h.ate = false;
        h.frames--;
      }
      if (p.health >= 1) {
        p.health = 1;
        sb.updateHealthBar(p.health);
      }
      if (p2.health >= 1) {
        p2.health = 1;
        sb.updateHealthBar(p.health);
      }
    }
    p.display();
    p2.display();
    pop();
    sb.display();
    if (dist(p.b.x, p.b.y, p2.x, p2.y)<65) {
      p2.health -= 0.05;
      sb.updateHealthBar2(p2.health);
    }
    if (dist(p2.b.x, p2.b.y, p.x, p.y)<65) {
      p.health -= 0.05;
      sb.updateHealthBar(p.health);
    }
    if (dist(p.tb1.x, p.tb1.y, p2.x, p2.y)<65) {
      p2.health -= 0.1;
      sb.updateHealthBar2(p2.health);
    }
    if (dist(p2.tb1.x, p2.tb1.y, p.x, p.y)<65) {
      p.health -= 0.1;
      sb.updateHealthBar(p.health);
    }
    if (dist(p.tb2.x, p.tb2.y, p2.x, p2.y)<65) {
      p2.health -= 0.1;
      sb.updateHealthBar2(p2.health);
    }
    if (dist(p2.tb2.x, p2.tb2.y, p.x, p.y)<65) {
      p.health -= 0.1;
      sb.updateHealthBar(p.health);
    }
    if (dist(p.tb3.x, p.tb3.y, p2.x, p2.y)<65) {
      p2.health -= 0.1;
      sb.updateHealthBar2(p2.health);
    }
    if (dist(p2.tb3.x, p2.tb3.y, p.x, p.y)<65) {
      p.health -= 0.1;
      sb.updateHealthBar(p.health);
    }
    if (sixDown == true) {
      if (dist(p2.b.x, p2.b.y, p.x, p.y)<100) {
        p2.b.xVelo = -p2.b.xVelo;
        p2.b.yVelo = -p2.b.yVelo;
      }
      if (dist(p2.tb1.x, p2.tb1.y, p.x, p.y)<100) {
        p2.tb1.xVelo = -p2.tb1.xVelo;
        p2.tb1.yVelo = -p2.tb1.yVelo;
      }
      if (dist(p2.tb2.x, p2.tb2.y, p.x, p.y)<100) {
        p2.tb2.xVelo = -p2.tb2.xVelo;
        p2.tb2.yVelo = -p2.tb2.yVelo;
      }
      if (dist(p2.tb3.x, p2.tb3.y, p.x, p.y)<100) {
        p2.tb3.xVelo = -p2.tb3.xVelo;
        p2.tb3.yVelo = -p2.tb3.yVelo;
      }
    }
    if (equalDown == true) {
      if (dist(p.b.x, p.b.y, p2.x, p2.y)<100) {
        p.b.xVelo = -p.b.xVelo;
        p.b.yVelo = -p.b.yVelo;
      }
      if (dist(p.tb1.x, p.tb1.y, p2.x, p2.y)<100) {
        p.tb1.xVelo = -p.tb1.xVelo;
        p.tb1.yVelo = -p.tb1.yVelo;
      }
      if (dist(p.tb2.x, p.tb2.y, p2.x, p2.y)<100) {
        p.tb2.xVelo = -p.tb2.xVelo;
        p.tb2.yVelo = -p.tb2.yVelo;
      }
      if (dist(p.tb3.x, p.tb3.y, p2.x, p2.y)<100) {
        p.tb3.xVelo = -p.tb3.xVelo;
        p.tb3.yVelo = -p.tb3.yVelo;
      }
    }
    if (p.x <= -930) {
      p.health -= 0.003;
      sb.updateHealthBar(p.health);
    }
    if (p.x >=925) {
      p.health -= 0.003;
      sb.updateHealthBar(p.health);
    }
    if (p.y <= -390) {
      p.health -= 0.003;
      sb.updateHealthBar(p.health);
    }
    if (p.y >= 515) {
      p.health -= 0.003;
      sb.updateHealthBar(p.health);
    }
    if (p2.x <= -930) {
      p2.health -= 0.003;
      sb.updateHealthBar2(p2.health);
    }
    if (p2.x >=925) {
      p2.health -= 0.003;
      sb.updateHealthBar2(p2.health);
    }
    if (p2.y <= -390) {
      p2.health -= 0.003;
      sb.updateHealthBar2(p2.health);
    }
    if (p2.y >= 515) {
      p2.health -= 0.003;
      sb.updateHealthBar2(p2.health);
    }
  }

  void keyPressed() {
    p.keyPressed();
    p2.keyPressed();
    switch(key) {
    case 'a':
      p.setSpeedX(-1);
      if (fiveDown == true && bcooldown <= 0) {
        p.x -= 400;
        bcooldown = 180;
      }
      break;
    case 's':
      p.setSpeedY(1);
      if (fiveDown == true && bcooldown<= 0) {
        p.y += 400;
        bcooldown = 180;
      }
      break;
    case 'w':
      p.setSpeedY(-1);
      if (fiveDown == true && bcooldown <= 0) {
        p.y -= 400;
        bcooldown = 180;
      }
      break;
    case 'd':
      p.setSpeedX(1);
      if (fiveDown == true && bcooldown <= 0) {
        p.x += 400;
        bcooldown = 180;
      }
      break;
    case 'j':
      p2.setSpeedX(-1);
      if (minusDown == true && b2cooldown <= 0) {
        p2.x -= 400;
        b2cooldown = 180;
      }
      break;
    case 'k':
      p2.setSpeedY(1);
      if (minusDown == true && b2cooldown <= 0) {
        p2.y += 400;
        b2cooldown = 180;
      }
      break;
    case 'i':
      p2.setSpeedY(-1);
      if (minusDown == true && b2cooldown <= 0) {
        p2.y -= 400;
        b2cooldown = 180;
      }
      break;
    case 'l':
      p2.setSpeedX(1);
      if (minusDown == true && b2cooldown <= 0) {
        p2.x += 400;
        b2cooldown = 180;
      }
      break;
    case '5':
      fiveDown = true;
      break;
    case '-':
      minusDown = true;
      break;
    case '6':
      sixDown = true;
      break;
    case '=':
      equalDown = true;
      break;
    }
  }

  void keyReleased() {
    p.keyReleased();
    p2.keyReleased();
    switch(key) {
    case 'a':
      p.setSpeedX(0);
      break;
    case 's':
      p.setSpeedY(0);
      break;
    case 'w':
      p.setSpeedY(0);
      break;
    case 'd':
      p.setSpeedX(0);
      break;
    case 'j':
      p2.setSpeedX(0);
      break;
    case 'k':
      p2.setSpeedY(0);
      break;
    case 'i':
      p2.setSpeedY(0);
      break;
    case 'l':
      p2.setSpeedX(0);
      break;
    case '5':
      fiveDown = false;
      break;
    case '-':
      minusDown = false;
      break;
    case '6':
      sixDown = false;
      break;
    case '=':
      equalDown = false;
      break;
    }
  }

  boolean gameOver() {
    return p.health <= 0 ||  p2.health <= 0;
  }

  void cameraFollowPlayer(float x, float y) {
    float xOffset = constrain(-x + width/2, -bg.w + 2 * width - p.w/2, bg.w - width + p.w/2);
    float yOffset = constrain(-y + height/2, -bg.h + 2 * height - p.h/2, bg.h - height +  110);
    translate(xOffset, yOffset);
  }
}
