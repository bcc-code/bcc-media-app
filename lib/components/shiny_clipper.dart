import 'package:flutter/material.dart';

class ShinyClipper extends CustomClipper<Path> {
  // Generated from svg with https://itchylabs.com/tools/path-to-bezier/
  // Slightly modified
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double xScaling = size.width / 150;
    const double yScaling = 1;
    path.lineTo(48.1429 * xScaling, 24.7451 * yScaling);
    path.cubicTo(
      16.9429 * xScaling,
      50.7451 * yScaling,
      3.14288 * xScaling,
      81.5785 * yScaling,
      0.142883 * xScaling,
      93.7451 * yScaling,
    );
    path.cubicTo(
      0.142883 * xScaling,
      93.7451 * yScaling,
      208.643 * xScaling,
      93.7451 * yScaling,
      208.643 * xScaling,
      93.7451 * yScaling,
    );
    path.cubicTo(
      208.643 * xScaling,
      93.7451 * yScaling,
      208.643 * xScaling,
      -24.7549 * yScaling,
      208.643 * xScaling,
      -24.7549 * yScaling,
    );
    path.cubicTo(
      208.643 * xScaling,
      -24.7549 * yScaling,
      88.1429 * xScaling,
      -24.7549 * yScaling,
      88.1429 * xScaling,
      -24.7549 * yScaling,
    );
    path.cubicTo(
      87.8095 * xScaling,
      -19.0882 * yScaling,
      79.3429 * xScaling,
      -1.25488 * yScaling,
      48.1429 * xScaling,
      24.7451 * yScaling,
    );
    path.cubicTo(
      48.1429 * xScaling,
      24.7451 * yScaling,
      48.1429 * xScaling,
      24.7451 * yScaling,
      48.1429 * xScaling,
      24.7451 * yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
