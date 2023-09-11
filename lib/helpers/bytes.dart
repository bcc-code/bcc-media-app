String kiloBytesToString(num kilobytes) {
  return '${(kilobytes / 1000).round()} MB';
}

double kiloBytesForBitrateAndDuration(int bitrate, Duration duration) {
  return bitrate * duration.inSeconds / 8 / 1000;
}
