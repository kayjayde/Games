class Background {
  PImage bgImg;
  float w;
  float h;

  Background(float w, float h) {
    bgImg = loadImage("TB.jpg");
    this.w = w;
    this.h = h;
  }

  void display() {
    push();
    background(0);
    imageMode(CENTER);
    image(bgImg, 0, 0, w/2, h/2);
    pop();
  }
}
