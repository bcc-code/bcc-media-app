String formatMinutesAndSeconds(num millis) {
  // returns e.g. 01:50
  var duration = Duration(milliseconds: millis.toInt());
  return '${duration.inMinutes.toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
}
