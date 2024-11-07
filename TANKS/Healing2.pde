class Healing2 {
  float x;
  float y;
  PImage bgImg;
  int frames;
  boolean ate;

  Healing2(float x, float y) {
    this.x = x;
    bgImg = loadImage("Healing.png");
    bgImg.resize(50, 50);
    this.y = y;
    frames = 600;// 10 seconds
    ate = false;
  }

  void display() {
    push();
    imageMode(CENTER);
    frames--;
    if (frames <= 0) {
      image(bgImg, x, y);// healing appears
    }
    pop();
  }
}
