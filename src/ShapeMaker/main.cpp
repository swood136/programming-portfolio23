#include "Box.h"
#include "Pyramid.h"
#include "Sphere.h"
#include <cstdlib>
#include <iostream>
#include <math.h>
bool play = true;
Box b1;
Pyramid p1;
Sphere s1;
int shapeNum;

using namespace std;

int main() {
  while (play) {
    cout << "\n Welcome to Shape Maker! To build a box, press 1. To build a "
            "pyramid, press 2. To build a sphere, press 3. Press any other key "
            "to exit. ";
    cin >> shapeNum;
    if (shapeNum == 1 || shapeNum == 2 || shapeNum == 3) {
      play = true;
    } else {
      play = false;
    }
    if (shapeNum == 1) {
      cout << "Enter the width of the box: ";
      cin >> b1.w;
      cout << "Enter the length of the box: ";
      cin >> b1.l;
      cout << "Enter the height of the box: ";
      cin >> b1.h;
      b1.getArea();
      b1.getVolume();
      cout << "Surface Area: " << b1.a << "Volume: " << b1.v;

    } else if (shapeNum == 2) {
      cout << "Enter the width of the pyramid: ";
      cin >> p1.w;
      cout << "Enter the height of the pyramid: ";
      cin >> p1.h;
      p1.getArea();
      p1.getVolume();
      cout << "Surface Area: " << p1.a << "Volume: " << p1.v;

    } else if (shapeNum == 3) {
      cout << "Enter the radius of the sphere: ";
      cin >> s1.r;
      s1.getArea();
      s1.getVolume();
      cout << "Surface Area: " << s1.a << "Volume: " << s1.v;
    }
  }
  cout << "Thank you for using ShapeMaker.";
}
