import 'package:intl/intl.dart';

/// Convert seconds to 'hh:mm:ss'
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

/// Get current UTC offset in the format 'hh:mm'
String getUtcOffset() {
  final timeZoneOffset = DateTime.now().timeZoneOffset;
  final hours = timeZoneOffset.inHours.toString().padLeft(2, '0');
  final minutes = (timeZoneOffset.inMinutes % 60).toString().padLeft(2, '0');
  return '$hours:$minutes';
}

/// Get date in ISO8601 format with UTC offset
String getFormattedDateTime(DateTime date) {
  final localDateTime = DateFormat('yyyy-MM-ddTHH:mm:ss').format(date);
  return '$localDateTime+${getUtcOffset()}';
}
