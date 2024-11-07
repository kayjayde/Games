class Enemy {
  float x;
  float y;
  boolean hit;

  Enemy(float x, float y) {
    this.x = x;
    this.y = y;
    hit = false;
  }

  void display() {
    push();
    translate(x, y);
    rectMode(CENTER);
    fill(#9c5810);
    stroke(0);
    strokeWeight(3);
    rect(0, 0, 150, 150);
    rect(0, 0, 100, 100);
    rect(0, 0, 50, 50);
    rect(0, 0, 25, 25);
    pop();
  }
}
