#ifndef SPHERE_H
#define SPHERE_H
#include <string>

struct Sphere {
  double r, a, v;

  Sphere() {
    r = 0;
    a = 0;
    v = 0;
  }

  void getArea() { a = 4 * 3.142 * (r * r); }

  void getVolume() { v = (4 / 3) * 3.142 * (r * r * r); }
};
#endif // SPHERE_H