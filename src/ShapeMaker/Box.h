#ifndef BOX_H
#define BOX_H
#include <string>

struct Box {
  double l, w, h, a, v;

public:
  Box() {
    l = 0;
    w = 0;
    h = 0;
    a = 0;
    v = 0;
  }
  void getVolume() { v = l * w * h; }
  void getArea() { a = 2 * w * l + 2 * h * l + 2 * h * w; }
};
#endif // BOX_H