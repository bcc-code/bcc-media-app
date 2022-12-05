import 'package:flutter/widgets.dart';

class BtvGradients {
  BtvGradients._();

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
}
