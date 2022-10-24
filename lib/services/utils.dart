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

String getFormattedProductionDate(String prodDate) {
  return DateFormat('dd. MMMM y').format(DateTime.parse(prodDate));
}
