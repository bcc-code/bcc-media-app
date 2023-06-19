import 'package:bccm_player/src/pigeon/playback_platform_pigeon.g.dart';

extension TrackX on Track {
  String get labelWithFallback => label ?? language ?? id;
}

extension TrackListX on List<Track?> {
  Iterable<Track> get safe => whereType<Track>();
}
