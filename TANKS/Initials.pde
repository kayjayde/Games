class Initials {
  Name name;

  Initials() {
    name = new Name(width/2-100, height/2 - 100, 150);
  }

  void display() {
    background(90);
    name.draw();
  }
  
  void keyPressed() {
  }
}
