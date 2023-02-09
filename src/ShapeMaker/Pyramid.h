#ifndef PYRAMID_H
#define PYRAMID_H
#include <math.h>
#include <string>

struct Pyramid {
  double w, h, a, v;

  Pyramid() {
    w = 0;
    h = 0;
    a = 0;
    v = 0;
  }

  void getArea() {
    a = w * w + w * sqrt(((w / 2) * (w / 2)) + (h * h)) +
        w * sqrt(((w / 2) * (w / 2)) + (h * h));
  }

  void getVolume() { v = (w * w * h) / 3; }
};
#endif // PYRAMID_H