import 'dart:ui';

extension SimpleBezier on Path {
  void cubicFromToFractional(Offset start, Offset p1Fraction, Offset p2Fraction, Offset end) {
    final diff = end - start;
    final p1 = Offset(diff.dx * p1Fraction.dx, diff.dy * p1Fraction.dy);
    final p2 = Offset(diff.dx * p2Fraction.dx, diff.dy * p2Fraction.dy);
    relativeCubicTo(p1.dx, p1.dy, p2.dx, p2.dy, diff.dx, diff.dy);
  }
}
