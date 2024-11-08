class Name {
  char selection = 65;
  int[] result = {65, 65, 65};
  String initials = "";
  boolean wait = false;
  int time = 0;
  int index = 0;
  int x, y;
  PFont font;
  int size;

  Name(int x, int y, int size) {
    this.x = x;
    this.y = y;
    font = createFont("zig.ttf", 133); // Monospaced font to make my life easier with the cursor
    this.size = size;
  }

  void draw() {
    selecting(); // Basically my own keyPressed
    setSelection(); // Sets the index to the selection
    waiting(); // To stop the program from cycling all the way down to z or up to a when pressing button once
    setInitials(); // Sets the initials string to the result array
    push();
    drawText(); // Draws the text
    drawCursor(); // Draws the cursor
    pop();
    //println(result[0], result[1], result[2]); // Debug code
  }

  void setSelection() {
    result[index] = selection; // Sets the character at the index
  }

  void setInitials() {
    initials = "" + char(result[0])+char(result[1])+char(result[2]); // Final String
  }

  void drawText() {
    textAlign(CORNER);
    fill(255);
    textFont(font);
    textSize(size);
    text(initials, x - (textWidth(initials)/2), y); // Draws the text
  }

  void drawCursor() {
    noStroke();
    rect((x-textWidth(initials)/2) + (textWidth(char(result[index]))*index), y + 10, textWidth(char(result[index])), 10); // Draws a cursor
    //Sets cursor to start of text, then this moves cursor based on index, basic spacing, sets width of cursor to width of char at index, basic height
  }

  void waiting() {
    if (wait) {
      time++;
    }
    if (time == 10) {
      wait = false;
      time = 0;
    }
  }

  void selecting() {
    if (keyPressed) {
      switch(key) {
      case 'w':
        if (selection == 'A' && !wait) {
          selection = 'Z';
          wait = true;
        } else if (selection > 'A' && !wait) {
          selection--;
          wait = true;
        }
        break;
      case 's':
        if (selection == 'Z' && !wait) {
          selection = 'A';
          wait = true;
        } else if (selection < 'Z' && !wait) {
          selection++;
          wait = true;
          println(selection);
        }
        break;
      case 'd':
        if (index < 2 && !wait) {
          index++;
          selection = char(result[index]);
          wait = true;
        }
        break;
      case 'a':
        if (index > 0 && !wait) {
          index--;
          selection = char(result[index]);
          wait = true;
        }
        break;
      }
    }
  }
}
