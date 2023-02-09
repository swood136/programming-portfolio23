//Spencer Wood | Nov 2022 | Calculator
Button[] numButtons = new Button[11];
Button[] opButtons = new Button[11];
String dval = "0.0";
float l, r, result;
char op = ' ';
boolean left = true;

void setup() {
  size(300, 500);
  numButtons[0] = new Button(120, 440, 40, '0', color(255, 155, 0), color(200, 130, 0));
  numButtons[1] = new Button(60, 260, 40, '1', color(255, 155, 0), color(200, 130, 0));
  numButtons[2] = new Button(120, 260, 40, '2', color(255, 155, 0), color(200, 130, 0));
  numButtons[3] = new Button(180, 260, 40, '3', color(255, 155, 0), color(200, 130, 0));
  numButtons[4] = new Button(60, 320, 40, '4', color(255, 155, 0), color(200, 130, 0));
  numButtons[5] = new Button(120, 320, 40, '5', color(255, 155, 0), color(200, 130, 0));
  numButtons[6] = new Button(180, 320, 40, '6', color(255, 155, 0), color(200, 130, 0));
  numButtons[7] = new Button(60, 380, 40, '7', color(255, 155, 0), color(200, 130, 0));
  numButtons[8] = new Button(120, 380, 40, '8', color(255, 155, 0), color(200, 130, 0));
  numButtons[9] = new Button(180, 380, 40, '9', color(255, 155, 0), color(200, 130, 0));
  numButtons[10] = new Button(180, 140, 40, 'π', color(255, 155, 0), color(200, 130, 0));
  opButtons[0] = new Button(60, 140, 40, 'c', color(135, 200, 255), color(188, 222, 255));

  opButtons[1] = new Button(120, 140, 40, '±', color(0), color(127));
  opButtons[2] = new Button(240, 140, 40, '+', color(0), color(127));
  opButtons[3] = new Button(60, 200, 40, '√', color(0), color(127));
  opButtons[4] = new Button(120, 200, 40, 's', color(0), color(127));
  opButtons[5] = new Button(180, 200, 40, '%', color(0), color(127));
  opButtons[6] = new Button(240, 200, 40, '-', color(0), color(127));
  opButtons[7] = new Button(240, 260, 40, '×', color(0), color(127));
  opButtons[8] = new Button(240, 320, 40, '÷', color(0), color(127));
  opButtons[9] = new Button(240, 380, 40, '=', color(0), color(127));
  opButtons[10] = new Button(180, 440, 40, '.', color(0), color(127));
}

void draw() {
  background(100, 60, 210);
  updateDisplay();
  for (int i = 0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].hover(mouseX, mouseY);
  }
  for (int i = 0; i<opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].hover(mouseX, mouseY);
  }
}

void keyPressed() {
  println("key: " + key);
  println("keyCode: " + keyCode);
  if (keyCode ==  49 || keyCode == 97) {
    handleEvent("1", true);
  } else if (keyCode ==  50 || keyCode == 98) {
    handleEvent("2", true);
  } else if (keyCode ==  51 || keyCode == 99) {
    handleEvent("3", true);
  } else if (keyCode ==  52 || keyCode == 100) {
    handleEvent("4", true);
  } else if (keyCode ==  53 || keyCode == 101) {
    handleEvent("5", true);
  } else if (keyCode ==  54 || keyCode == 102) {
    handleEvent("6", true);
  } else if (keyCode ==  55 || keyCode == 103) {
    handleEvent("7", true);
  } else if (keyCode == 56 || keyCode == 104) {
    handleEvent("8", true);
  } else if (keyCode == 57 || keyCode == 105) {
    handleEvent("9", true);
  } else if (keyCode == 48 || keyCode == 96) {
    handleEvent("0", true);
  } else if (keyCode == 107) {
    handleEvent("+", false);
  } else if (keyCode == 8) {
    handleEvent("c", false);
  } else if (keyCode == 45 || keyCode == 109) {
    handleEvent("-", false);
  } else if (keyCode == 106) {
    handleEvent("×", false);
  } else if (keyCode == 47 || keyCode == 111) {
    handleEvent("÷", false);
  } else if (keyCode == 61 || keyCode == 10) {
    handleEvent("=", false);
  }
}

void handleEvent(String val, boolean num) {
  if (num && dval.length() < 16) {
    if (dval.equals("0.0")) {
      dval = val;
    } else {
      dval += val;
    }
    if (left) {
      l = float(dval);
    } else {
      r = float(dval);
    }
  } else if (val.equals("c")) {
    dval = "0.0";
    l = 0.0;
    r = 0.0;
    result = 0.0;
    left = true;
    op = ' ';
  } else if (val.equals("+")) {
    op = '+';
    dval = "0.0";
    left = false;
  } else if (val.equals("-")) {
    op = '-';
    dval = "0.0";
    left = false;
  } else if (val.equals("×")) {
    op = '×';
    dval = "0.0";
    left = false;
  } else if (val.equals("÷")) {
    op = '÷';
    dval = "0.0";
    left = false;
  } else if (val.equals("=")) {
    performCalculation();
  }
}

void mousePressed() {
  for (int i = 0; i<numButtons.length; i++) {
    if (numButtons[i].on) {
      numButtons[i].click = true;
    }
  }
  for (int i = 0; i<opButtons.length; i++) {
    if (opButtons[i].on) {
      opButtons[i].click = true;
    }
  }
}

void mouseReleased() {
  for (int i = 0; i<numButtons.length; i++) {
    if (numButtons[i].on && dval.length() < 16) {
      handleEvent(str(numButtons[i].val), true);
      numButtons[i].click = false;
    }
  }

  for (int i = 0; i<numButtons.length; i++) {
    if (numButtons[i].on && numButtons[i].val == 'π') {
      if (left) {
        dval = str(PI);
        l = PI;
      } else {
        dval = str(PI);
        r = PI;
      }
      numButtons[i].click = false;
    }
  }

  for (int i = 0; i<opButtons.length; i++) {
    if (opButtons[i].on && opButtons[i].val == 'c') {
      handleEvent("c", false);
      opButtons[i].click = false;
    } else if (opButtons[i].on && opButtons[i].val == '+') {
      handleEvent("+", false);
    } else if (opButtons[i].on && opButtons[i].val == '-') {
      handleEvent("-", false);
    } else if (opButtons[i].on && opButtons[i].val == '×') {
      handleEvent("×", false);
    } else if (opButtons[i].on && opButtons[i].val == '÷') {
      handleEvent("÷", false);
    } else if (opButtons[i].on && opButtons[i].val == '=') {
      opButtons[2].click = false;
      opButtons[6].click = false;
      opButtons[7].click = false;
      opButtons[8].click = false;
      opButtons[9].click = false;
      performCalculation();
    } else if (opButtons[i].on && opButtons[i].val == '±') {
      if (left) {
        l = l*-1;
        dval = str(l);
        opButtons[i].click = false;
      } else {
        r = r*-1;
        dval = str(r);
        opButtons[i].click = false;
      }
    } else if (opButtons[i].on && opButtons[i].val == 's') {
      if (left) {
        l = sq(l);
        dval = str(l);
        opButtons[i].click = false;
      } else {
        r = sq(r);
        dval = str(r);
        opButtons[i].click = false;
      }
    } else if (opButtons[i].on && opButtons[i].val == '√') {
      if (left) {
        l = sqrt(l);
        dval = str(l);
        opButtons[i].click = false;
      } else {
        r = sqrt(r);
        dval = str(r);
        opButtons[i].click = false;
      }
    } else if (opButtons[i].on && opButtons[i].val == '%') {
      if (left) {
        l = l*0.01;
        dval = str(l);
        opButtons[i].click = false;
      } else {
        r = r*0.01;
        dval = str(r);
        opButtons[i].click = false;
      }
    }
  }
  println("L:" + l + " Op:" + op + " R:" + r + " Result:" + result + " Left:" + left);
}

void updateDisplay() {
  fill(188, 222, 255);
  rect(0, 0, 300, 100);
  fill(255);
  textAlign(RIGHT);
  if (dval.length() < 12) {
    textSize(45);
  } else if (dval.length() < 13) {
    textSize(43);
  } else if (dval.length() < 14) {
    textSize(40);
  } else if (dval.length() < 15) {
    textSize(37);
  } else if (dval.length() < 16) {
    textSize(35);
  } else {
    textSize(33);
  }
  text(dval, width-20, 90);
}

void performCalculation() {
  if (op == '+') {
    result = l + r;
  } else if (op == '-') {
    result = l - r;
  } else if (op == '×') {
    result = l * r;
  } else if (op == '÷') {
    result = l/r;
  }
  dval = str(result);
  l = result;
  left = true;
}
