import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

String getFormattedDuration(int durSeconds) {
  final duration = Duration(seconds: durSeconds);

  String twoDigits(int n) => n.toString().padLeft(2, '0');

  final hours = duration.inHours;
  final minutes = duration.inMinutes % 60;
  final seconds = duration.inSeconds % 60;

  final durationSegments = <String>[];

  // Hours
  if (hours != 0) {
    durationSegments.add(hours.toString());
  }

  // Minutes
  if (duration.inMinutes > minutes) {
    durationSegments.add(twoDigits(minutes));
  } else {
    durationSegments.add(minutes.toString());
  }

  // Seconds
  durationSegments.add(twoDigits(seconds));

  return durationSegments.join(':');
}

String? getFormattedProductionDate(String? prodDate) {
  if (prodDate == null) {
    return null;
  }
  final parsedDateTime = DateTime.tryParse(prodDate);
  if (parsedDateTime == null) {
    return null;
  }
  return DateFormat('dd. MMM y').format(parsedDateTime);
}

bool isComingSoon(String? prodDate) {
  if (prodDate == null) {
    return false;
  }
  final parsedDateTime = DateTime.tryParse(prodDate);
  if (parsedDateTime == null) {
    return false;
  }
  return DateTime.now().isBefore(parsedDateTime);
}

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
