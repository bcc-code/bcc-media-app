class PlaybackSpeed {
  final double speed;
  final String label;

  const PlaybackSpeed(this.speed, {String? label}) : this.label = label ?? '${speed}x';
}

abstract class PlaybackSpeeds {
  static const speed25 = PlaybackSpeed(0.25);
  static const speed50 = PlaybackSpeed(0.5);
  static const speed75 = PlaybackSpeed(0.75);
  static const speed100 = PlaybackSpeed(1.0, label: 'Normal');
  static const speed125 = PlaybackSpeed(1.25);
  static const speed150 = PlaybackSpeed(1.5);
  static const speed175 = PlaybackSpeed(1.75);
  static const speed200 = PlaybackSpeed(2.0);
}
