/// Convert milliseconds to 'hh:mm:ss'
String getFormattedDuration(num durationMs) {
  final duration = Duration(milliseconds: durationMs.toInt());
  return [
    if (duration.inHours != 0) duration.inHours.toString().padLeft(2, '0'),
    (duration.inMinutes % 60).toString().padLeft(2, '0'),
    (duration.inSeconds % 60).toString().padLeft(2, '0')
  ].join(':');
}
