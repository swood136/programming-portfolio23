class Ship {
  int x, y, w, ammo, turretCount, health, sHealth;
  PImage ship;

  //Constructor
  Ship() {
    sHealth = 0;
    x = 0;
    y = 0;
    w = 90;
    ammo = 100;
    turretCount = 1;
    health = 1000;
    ship = loadImage("xWing.png");
  }

  void display() {
    ship.resize(90, 90);
    imageMode(CENTER);
    image(ship, x, y);
  }

  void move(int tempX, int tempY) {
    x = tempX;
    y = tempY;
  }

  boolean fire() {
    //if(ammo>0) {
    //  ammo--;
    //  return true;
    //} else {
    //  return false;
    //}
    return true;
  }

  boolean intersect(Rock rock) {
    float d = dist(x, y, rock.x, rock.y);
    //refine collision detection
    if (d<80) {
      return true;
    } else {
      return false;
    }
  }
}
