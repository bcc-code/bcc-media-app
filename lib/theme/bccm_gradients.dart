import 'package:flutter/widgets.dart';

class BccmGradients {
  BccmGradients._();

  static const LinearGradient blueRed = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xff6eb0e6), Color(0xffe63c62)],
    tileMode: TileMode.repeated,
  );
  static const LinearGradient softPurpleBlue = LinearGradient(
    colors: [Color.fromRGBO(160, 113, 165, 1), Color.fromRGBO(87, 167, 233, 1)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static const LinearGradient greenYellow = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xff6fc5bd), Color(0xfffccf48)],
  );
  static const LinearGradient purpleTransparent = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color.fromRGBO(253, 161, 255, 0.2), Color.fromRGBO(0, 0, 0, 0)],
  );
  static const LinearGradient purpleTransparentTopBottom = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color.fromRGBO(253, 161, 255, 0.1), Color.fromRGBO(0, 0, 0, 0)],
  );
}
