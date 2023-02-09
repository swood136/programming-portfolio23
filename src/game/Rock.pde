class Rock {
  int x, y, diam, speed, health, xspeed;
  PImage rock;

  Rock() {
    x = int(random(width));
    y = 100;
    xspeed = int(random(-5, 5));
    health = diam;
    diam = int(random(30, 100));
    speed = int(random(3, 10));
    rock = loadImage("rock.png");
  }

  void display() {
    imageMode(CENTER);
    rock.resize(diam, diam);
    image(rock, x, y);
  }

  void move() {
    if (level == 1) {
      y += speed;
      x += xspeed;
    } else if (level == 2) {
      y += speed+1;
      x += xspeed+1;
    } else if (level == 3) {
      y += speed+2;
      x += xspeed+2;
    } else if (level == 4) {
      y += speed+3;
      x += xspeed+2;
    } else if (level == 5) {
      y += speed+4;
      x += xspeed+3;
    } else if (level == 6) {
      y += speed+6;
      x += xspeed+3;
    } else if (level == 7) {
      y += speed+8;
      x += xspeed+4;
    } else if (level == 8) {
      y += speed+10;
      x += xspeed+4;
    } else if (level == 9) {
      y += speed+12;
      x += xspeed+5;
    } else if (level == 10) {
      y += speed+15;
      x += xspeed+5;
    }
  }

  boolean reachedBottom() {
    if (y>height+400) {
      return true;
    } else {
      return false;
    }
  }
}
