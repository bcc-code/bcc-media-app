import 'package:flutter/material.dart';

// Parse color from hex string in the formats "aabbcc", "#aabbcc", "ffaabbcc", "#ffaabbcc"
Color? getColorFromHex(String hexString) {
  final buffer = StringBuffer();
  hexString = hexString.replaceFirst('#', '');
  if (hexString.length != 6 && hexString.length != 8) {
    return null;
  }
  if (hexString.length == 6) {
    buffer.write('ff');
  }
  buffer.write(hexString);
  final color = int.tryParse(buffer.toString(), radix: 16);
  if (color == null) {
    return null;
  }
  return Color(color);
}
