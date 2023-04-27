import 'package:flutter/widgets.dart';

class BccmGradients {
  BccmGradients._();

  static const LinearGradient blueRed = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xff6eb0e6), Color(0xffe63c62)],
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
}
