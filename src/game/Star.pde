class Star {
  int x, y, diam, speed;

  Star() {
    x = int(random(width));
    y = int(random(height));
    diam = int(random(2, 6));
    speed = int(random(3, 6));
  }

  void display() {
    fill(251, 255, 147);
    circle(x, y, diam);
  }

  void move() {
    if (y>height+5) {
      y = -10;
    } else {
      if (level == 1) {
      y += speed;
      } else if (level == 2) {
        y += speed+1;
      } else if (level == 3) {
        y += speed+2;
      } else if (level == 4) {
        y += speed+3;
      } else if (level == 5) {
        y += speed+4;
      } else if (level == 6) {
        y += speed+5;
      } else if (level == 7) {
        y += speed+6;
      } else if (level == 8) {
        y += speed+7;
      } else if (level == 9) {
        y += speed+8;
      } else if (level == 10) {
        y += speed+9;
      }
    }
  }

  boolean reachedBottom() {
    return true;
  }
}
