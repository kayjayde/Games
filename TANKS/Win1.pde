class Win1 {
  PImage w1Img;
  PImage w2Img;


  Win1() {
    w1Img = loadImage("P1Win.png");
    w2Img = loadImage("P2Win.png");
  }

  void display() {
    gScreen.p.display();
    gScreen.p2.display();
    push();
    background(0);
    imageMode(CORNER);
    if (gScreen.p2.health<0) {
      image(w1Img, 0, 0, width, height);
    }
    if (gScreen.p.health<0) {
      image(w2Img, 0, 0, width, height);
    }
    pop();
  }
}
