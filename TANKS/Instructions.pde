class Instructions {
  PImage inImg;
  
  Instructions() {
    inImg = loadImage("TankInstructions.png");
  }
  
  void display() {
    image(inImg, 200, 200, width-400, height-400);
  }
}
