class Laser {
  int x, y, w, h, speed;
  PImage laser;

  Laser (int x, int y) {
    this.x = x;
    this.y = y;
    w = 30;
    h = 50;
    speed = 10;
    laser = loadImage("laser.png");
  }

  void display() {
    imageMode(CENTER);
    laser.resize(w, h);
    image(laser, x, y);
  }

  void move() {
    y -= speed;
  }

  boolean reachedTop() {
    if (y<-10) {
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(Rock rock) {
    if(dist(x, y, rock.x, rock.y)<(rock.diam)/2) {
      return true;
    } else {
      return false;
    }
  }
}
