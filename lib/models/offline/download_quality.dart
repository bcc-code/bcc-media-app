import 'package:bccm_player/bccm_player.dart';
import 'package:collection/collection.dart';

enum DownloadQuality {
  low,
  medium,
  high,
}

Map<DownloadQuality, Track> downloadQualitiesForTracks(List<Track> videoTracks) {
  List<Track?> lowTracks = [];
  List<Track?> mediumTracks = [];
  List<Track?> highTracks = [];

  int lowThreshold = 360;
  int mediumThreshold = 720;

  final tracks = videoTracks
      .where((element) => element.bitrate != null && element.bitrate! > 0 && element.height != null)
      .sorted((a, b) => a.height!.compareTo(b.height!));
      
  for (Track track in tracks) {
    if (track.height! <= lowThreshold) {
      lowTracks.add(track);
    } else if (track.height! <= mediumThreshold) {
      mediumTracks.add(track);
    } else {
      highTracks.add(track);
    }
  }

  return {
    if (lowTracks.isNotEmpty) DownloadQuality.low: lowTracks.last!,
    if (mediumTracks.isNotEmpty) DownloadQuality.medium: mediumTracks.last!,
    if (highTracks.isNotEmpty) DownloadQuality.high: highTracks.last!,
  };
}
