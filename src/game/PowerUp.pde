class PowerUp {
  int x, y, diam, speed,xspeed;
  char type;
  PImage heal, shield, turret;

  PowerUp() {
    x = int(random(width));
    y = -100;
    xspeed = int(random(-5, 5));
    diam = 100;
    speed = int(random(3, 10));
    heal = loadImage("heal.png");
    turret = loadImage("turret.png");
    shield = loadImage("shield.png");
    int rand = int(random(3));
    if (rand == 0) {
      type = 'H';
    } else if (rand == 1) {
      type = 'T';
    } else if (rand == 2) {
      type = 'S';
    }
  }

  void display() {
    if(type == 'H') {
      imageMode(CENTER);
      heal.resize(100, 100);
      image(heal, x, y);
    } else if (type == 'T') {
      imageMode(CENTER);
      turret.resize(100, 100);
      image(turret, x, y);
    } else {
    imageMode(CENTER);
    shield.resize(100, 100);
    image(shield, x, y);
    }
  }

  void move() {
    y += speed;
    x += xspeed;
  }

  boolean reachedBottom() {
    if(y>height+400) {
      return true;
    } else {
      return false;
    }
  }
  
  boolean intersect(Ship ship) {
    float d = dist(x, y, ship.x, ship.y);
    //refine collision detection
    if (d<80) {
      return true;
    } else {
      return false;
    }
  }
}
