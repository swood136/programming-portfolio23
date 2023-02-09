class Button {
  //Member variables
  float cx, cy, r;
  color c1, c2;
  char val;
  boolean on, click;

  //Constructor
  Button(float cx, float cy, float r, char val, color c1, color c2) {
    this.cx = cx;
    this.cy = cy;
    this.r = r;
    this.val = val;
    this.c1 = c1;
    this.c2 = c2;
    click = false;
  }

  //Member Methods
  void display() {
    if (click) {
      fill(c2);
    } else {
      fill(c1);
    }
    circle(cx, cy, r);
    textSize(25);
    fill(255);
    textAlign(CENTER);
    if (val == 's') {
      text("x²", cx, cy+8);
    } else if (val == 'c') {
      text("CA", cx, cy+8);
    } else {
      text(val, cx, cy+8);
    }
  }

  void hover(float mx, float my) {
    on = (mx>cx-r/2 && mx<cx+r/2 && my>cy-r/2 && my<cy+r/2);
  }
}
