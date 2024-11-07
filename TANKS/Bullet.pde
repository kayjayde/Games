class Bullet {
  float x;
  float y;
  float xVelo;
  float yVelo;

  Bullet(float x, float y) {
    this.x = x;
    this.y = y;
    xVelo = 0;
    yVelo = 0;
  }

  void update() {
    x += xVelo;
    y += yVelo;
    if (x <= -930) {
      xVelo = -xVelo;
    }
    if ( x >=925) {
      xVelo = -xVelo;
    }
    if (y <= -390) {
      yVelo = -yVelo;
    }
    if  (y >= 515) {
      yVelo = -yVelo;
    }
  }
  void display() {
    push();
    translate(x, y);
    fill(#000000);
    ellipse(0, 0, 10, 10);
    pop();
  }
}
