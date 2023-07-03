import 'dart:math';

/// Convert milliseconds to 'hh:mm:ss'
String getFormattedDuration(num durationMs) {
  final duration = Duration(milliseconds: durationMs.toInt());
  return [
    if (duration.inHours != 0) duration.inHours.toString().padLeft(2, '0'),
    (duration.inMinutes % 60).toString().padLeft(2, '0'),
    (duration.inSeconds % 60).toString().padLeft(2, '0')
  ].join(':');
}

double calcTimeLeftMs({required num? duration, required num? currentMs}) {
  currentMs ??= 0;
  duration ??= 0;
  if (!duration.isFinite) duration = 0;
  if (!currentMs.isFinite) currentMs = 0;

  return max(0, (duration - currentMs).toDouble());
}
