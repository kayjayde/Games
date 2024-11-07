class Player {
  SoundFile shootSound, rotateSound;
  float x;
  float cooldown;
  float y;
  float xVelo;
  float yVelo;
  float widthRestriction;
  float heightRestriction;
  float health;
  float h;
  float w;
  float r;
  float speed;
  float rVelo;
  PFont sFont;
  ScoreBoard sb;
  Bullet b;
  tripleBullet tb1, tb2, tb3;

  Player(float x, float y, float widthRestriction, float heightRestriction) {
    b = new Bullet(x, y);
    tb1 = new tripleBullet(x, y);
    tb2 = new tripleBullet(x, y);
    tb3 = new tripleBullet(x, y);
    this.x = x;
    this.y = y;
    h = 46;
    w = 24;
    r = 100;
    speed = 5;
    this.widthRestriction = widthRestriction - w;
    this.heightRestriction = heightRestriction - h;
    xVelo = 0;
    yVelo = 0;
    rVelo = 0;
    health = 1;
    cooldown = 0;
    sFont = createFont("ka1.ttf", 80);
    shootSound = new SoundFile(TANKS.this, "tankshot.wav");
    rotateSound = new SoundFile(TANKS.this, "turretrotate.mp3");
  }

  void update() {
    cooldown--;
    x += xVelo;
    y += yVelo;
    r += rVelo;
    x = constrain(x, -widthRestriction/2, widthRestriction/2);
    y = constrain(y, -heightRestriction/2, heightRestriction/2);
    b.update();
    tb1.update();
    tb2.update();
    tb3.update();
  }

  void display() {
    push();
    translate(x, y);
    rectMode(CENTER);
    if (x <= -930) {
      xVelo = 0;
      x++;
      health -= 0.01;
    }
    if ( x >=925) {
      xVelo = 0;
      x--;
    }
    if (y <= -390) {
      yVelo = 0;
      y++;
    }
    if (y >= 515) {
      yVelo = 0;
      y--;
    }
    strokeWeight(5);
    stroke(255);
    fill(#E81F21);
    rect(0, 0, 75, 75);
    strokeWeight(2);
    fill(#B00708);
    ellipse(0, 0, 35, 35);
    rectMode(CORNER);
    turret();
    textFont(sFont);
    textSize(15);
    textAlign(CENTER);
    text("P1", 0, -90);
    rotate(91.1);
    triangle(10, 70, -10, 70, 0, 50);
    fill(#FFFFFF);
    rectMode(CENTER);
    rect(0, 80, 75, 10);
    fill(#E81F21);
    strokeWeight(0);
    rect(0, 80, 75 * health, 10);
    pop();
    b.display();
    tb1.display();
    tb2.display();
    tb3.display();
  }



  void setSpeedX(float x) {
    xVelo = x * speed;
  }

  void setSpeedY(float y) {
    yVelo = y * speed;
  }

  void gameStart(float x, float y) {
    this.x = x;
    this.y = y;
    b.x = x;
    b.y = y;
    tb1.x = x;
    tb1.y = y;
    tb2.x = x;
    tb2.y = y;
    tb3.x = x;
    tb3.y = y;
    xVelo = 0;
    yVelo = 0;
  }
  void turret () {
    push();
    rotate(r);
    rectMode(CORNER);
    strokeWeight(2);
    fill(#B00708);
    rect(0, -4, 40, 10, 5);
    pop();
  }
  void name() {
    push();
    translate(x, y);
    rotate(91.1);
    triangle(10, 40, -10, 40, 0, 20);
    pop();
  }
  void shoot() {
    if (!shootSound.isPlaying()) {
      shootSound.play();
    }
    b = new Bullet(x, y);
    b.xVelo = cos(r)*40;
    b.yVelo = sin(r)*40;
  }
  void tripleShot() {
    if (!shootSound.isPlaying()) {
      shootSound.play();
    }
    tb1 = new tripleBullet(x, y);
    tb2 = new tripleBullet(x, y);
    tb3 = new tripleBullet(x, y);
    tb1.xVelo = cos(r+0.15)*40;
    tb1.yVelo = sin(r+0.15)*40;
    tb2.xVelo = cos(r)*40;
    tb2.yVelo = sin(r)*40;
    tb3.xVelo = cos(r-0.15)*40;
    tb3.yVelo = sin(r-0.15)*40;
  }

  void keyPressed() {
    switch(key) {
    case '1':
      if (!rotateSound.isPlaying()) {
        rotateSound.play();
      }
      rVelo = 0.035;
      break;
    case '2':
      if (!rotateSound.isPlaying()) {
        rotateSound.play();
      }
      rVelo = -0.035;
      break;
    case '3':
      shoot();
      break;
    case '4':
      if (cooldown <= 0) {
        tripleShot();
        cooldown = 900;
      }
      break;
      
    }

    /*if(key == '6'&& key=='5'){
     health += 0.25;
     sb.updateHealthBar(health);
     }*/
  }
  void keyReleased() {
    switch (key) {
    case '1':
      rVelo = 0;
      break;
    case '2':
      rVelo = 0;
      break;
    }
  }
}
