class tripleBullet {
  float x;
  float y;
  float xVelo;
  float yVelo;

  tripleBullet(float x, float y) {
    this.x = x;
    this.y = y;
    xVelo = 0;
    yVelo = 0;
  }

  void update() {
    x += xVelo;
    y += yVelo;
  }
  void display() {
    push();
    translate(x, y);
    fill(#000000);
    ellipse(0, 0, 10, 10);
    pop();
  }
}
