//Spencer Wood | 29 November 2022 | SpaceGame
Ship hannah;
import processing.sound.*;
SoundFile lBlast, explosion, pU;
Star[] stars = new Star[150];
Timer rockTimer, puTimer, timer;
boolean play;
int score, level;
ArrayList<Laser> lasers = new ArrayList <Laser>();
ArrayList<Rock> rocks = new ArrayList <Rock>();
ArrayList<PowerUp> powerups = new ArrayList <PowerUp>();
PImage explode;

void setup() {
  size(800, 800);
  lBlast = new SoundFile(this, "lBlast.wav");
  explosion = new SoundFile(this, "explode.wav");
  pU = new SoundFile(this, "pu.wav");
  explode = loadImage("explosion.png");

  hannah = new Ship();
  for (int i = 0; i<stars.length; i++) {
    stars[i] = new Star();
  }
  timer = new Timer(30000);
  timer.start();
  rockTimer = new Timer(200);
  rockTimer.start();
  puTimer = new Timer(7000);
  puTimer.start();
  score = 0;
  level = 1;
  play = false;
}

void draw() {
  if (!play) {
    startScreen();
  } else {
    if (timer.isFinished()) {
      if(level < 10) {
      level += 1;
      timer.start();
      }
    }
    background(0);

    //Stars
    for (int i = 0; i<stars.length; i++) {
      stars[i].display();
      stars[i].move();
    }
    noCursor();

    //Ship
    hannah.display();
    hannah.move(mouseX, mouseY);

    //Render Lasers
    for (int i = 0; i<lasers.size(); i++) {
      Laser l = lasers.get(i);
      if (l.reachedTop()) {
        lasers.remove(l);
      } else {
        l.display();
        l.move();
      }

      for (int j = 0; j<rocks.size(); j++) {
        Rock r = rocks.get(j);
        if (l.intersect(r)) {
          r.health -= 50;
          lasers.remove(l);
          if (r.health<=0) {
            explosion.play();
            score += r.diam;
            imageMode(CENTER);
            explode.resize(100, 100);
            image(explode, r.x, r.y);
            rocks.remove(r);
          }
        }
      }
    }

    //Add Rocks
    if (rockTimer.isFinished()) {
      rocks.add(new Rock());
      rockTimer.start();
    }

    //Add PowerUps
    if (puTimer.isFinished()) {
      powerups.add(new PowerUp());
      puTimer.start();
    }

    //Render PowerUps
    for (int i = 0; i<powerups.size(); i++) {
      PowerUp pu = powerups.get(i);
      if (pu.intersect(hannah)) {
        pU.play();
        if (pu.type == 'H') {
          if (hannah.health < 1000) {
          hannah.health += 200;
          } else {
            score += 200;
          }
        } else if (pu.type == 'T') {
          if (hannah.turretCount<5) {
            hannah.turretCount += 1;
          } else {
            score += 200;
          }
        } else if (pu.type == 'S') {
          hannah.sHealth += 200;
        }
        powerups.remove(pu);
      }
      if (pu.reachedBottom()) {
        powerups.remove(pu);
      } else {
        pu.display();
        pu.move();
        //println(powerups.size());
      }
    }

    //Render Rocks
    for (int j = 0; j<rocks.size(); j++) {
      Rock r = rocks.get(j);
      if (hannah.intersect(r)) {
        if (hannah.sHealth>0) {
          hannah.sHealth -= r.diam*4;
          explode.resize(100, 100);
          image(explode, hannah.x, hannah.y);
          explosion.play();
          rocks.remove(r);
        } else {
          hannah.health -= r.diam*4;
          if(score>0) {
          score -= r.diam;
          } else {}
          imageMode(CENTER);
          explode.resize(100, 100);
          image(explode, hannah.x, hannah.y);
          explosion.play();
          rocks.remove(r);
          //Make explosion sound and animation
        }
      }
      if (r.reachedBottom()) {
        rocks.remove(r);
      } else {
        r.display();
        r.move();
        println(rocks.size());
      }
    }
    infoPanel();

    if (hannah.health<1) {
      gameOver();
    }
  }
}

void infoPanel() {
  fill(128, 128);
  rectMode(CENTER);
  rect(width/2, 25, width, 50);
  fill(255);
  textAlign(CENTER);
  textSize(35);
  text("Score: " + score +
    "| Level: " + level +
    "| Health: " + hannah.health
    + "| Shield Health: " + hannah.sHealth, width/2, 40);
}

void startScreen() {
  background(0);
  fill(255);
  textAlign(CENTER);
  textSize(20);
  text("Press any key to begin", width/2, height/2);
  textSize(40);
  text("Space Adventure", width/2, 250);
  if (keyPressed || mousePressed) {
    play = true;
  }
}

void gameOver() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("Highest level: " + level, width/2, 450);
  text("Game Over!", width/2, height/2);
  text("Score: " + score, width/2, 500);
  play = false;
  noLoop();
}

void ticker() {
}

void mousePressed() {
  if (hannah.fire()) {
    lBlast.play();
  }
  if (hannah.fire() && hannah.turretCount == 1) {
    lasers.add(new Laser(hannah.x, hannah.y));
    //println(lasers.size());
  } else if (hannah.fire() && hannah.turretCount == 2) {
    lasers.add(new Laser(hannah.x+38, hannah.y-20));
    lasers.add(new Laser(hannah.x-37, hannah.y-20));
    //println(lasers.size());
  } else if (hannah.fire() && hannah.turretCount == 3) {
    lasers.add(new Laser(hannah.x+38, hannah.y-20));
    lasers.add(new Laser(hannah.x-37, hannah.y-20));
    lasers.add(new Laser(hannah.x, hannah.y));
    //println(lasers.size());
  } else if (hannah.fire() && hannah.turretCount == 4) {
    lasers.add(new Laser(hannah.x+38, hannah.y-20));
    lasers.add(new Laser(hannah.x-37, hannah.y-20));
    lasers.add(new Laser(hannah.x-20, hannah.y));
    lasers.add(new Laser(hannah.x+20, hannah.y));
    //println(lasers.size());
  } else if (hannah.fire() && hannah.turretCount == 5) {
    lasers.add(new Laser(hannah.x+38, hannah.y-20));
    lasers.add(new Laser(hannah.x-37, hannah.y-20));
    lasers.add(new Laser(hannah.x-20, hannah.y));
    lasers.add(new Laser(hannah.x+20, hannah.y));
    lasers.add(new Laser(hannah.x, hannah.y-25));
    //println(lasers.size());
  }
}

void keyPressed() {
}
