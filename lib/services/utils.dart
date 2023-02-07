import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import '../components/feature_badge.dart';
import '../helpers/btv_colors.dart';

String getFormattedDuration(int durSeconds, {bool padFirstSegment = false}) {
  final duration = Duration(seconds: durSeconds);

  String twoDigits(int n) => n.toString().padLeft(2, '0');

  final hours = duration.inHours;
  final minutes = duration.inMinutes % 60;
  final seconds = duration.inSeconds % 60;

  final durationSegments = <String>[];

  // Hours
  if (hours != 0) {
    durationSegments.add(padFirstSegment ? twoDigits(hours) : hours.toString());
  }

  // Minutes
  if (duration.inMinutes > minutes || padFirstSegment) {
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

bool isUnavailable(String? publishDate) {
  if (publishDate == null) {
    return false;
  }
  final parsedDateTime = DateTime.tryParse(publishDate);
  if (parsedDateTime == null) {
    return false;
  }
  return DateTime.now().isBefore(parsedDateTime);
}

bool isComingSoon({required String? publishDate, required bool locked}) {
  if (publishDate == null) {
    return false;
  }
  final publishDateTime = DateTime.tryParse(publishDate);
  if (publishDateTime == null) {
    return false;
  }
  return locked && DateTime.now().add(const Duration(days: 2)).isAfter(publishDateTime);
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

Widget? getFeaturedTag({required String? publishDate, required bool locked}) {
  bool isLive = false;
  bool isNewItem = false;
  if (isLive) {
    return const FeatureBadge(
      label: 'Live now',
      color: BtvColors.tint2,
    );
  } else if (isComingSoon(publishDate: publishDate, locked: locked)) {
    return const FeatureBadge(
      label: 'Coming soon',
      color: BtvColors.background2,
    );
  } else if (isNewItem) {
    return const FeatureBadge(
      label: 'New',
      color: BtvColors.tint2,
    );
  }
  return null;
}

Rect iPadSharePositionOrigin(BuildContext context) {
  final Size size = MediaQuery.of(context).size;
  return Rect.fromLTWH(0, 0, size.width, size.height / 2);
}
