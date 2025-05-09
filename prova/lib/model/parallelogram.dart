class Parallelogram {
  double base;
  double height;

  Parallelogram({required this.base, required this.height});

  bool isValid() {
    return base > 0 && height > 0;
  }

  double calculateArea() {
    return base * height;
  }

  double calculatePerimeter() {
    return 2 * (base + height);
  }
}
