import 'package:bccm_player/playback_platform_pigeon.g.dart';
import 'package:bccm_player/playback_service.dart';
import 'package:bccm_player/playback_service_interface.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:brunstadtv_app/api/episodes.dart';
import 'package:brunstadtv_app/providers/video_state.dart';

final playbackApiProvider = Provider<PlaybackPlatformInterface>((ref) {
  return PlaybackService();
});

Future playEpisode(
    {required String playerId,
    required Episode episode,
    int? playbackPositionMs}) async {
  var mediaItem = MediaItem(
      url: episode.streamUrl,
      mimeType: 'application/x-mpegURL',
      metadata: MediaMetadata(
          title: episode.title,
          artworkUri: episode.imageUrl,
          extras: {
            'id': episode.id.toString(),
            'npaw.content.id': episode.id,
            'npaw.content.tvShow': episode.showTitle,
            'npaw.content.season': episode.seasonTitle,
            'npaw.content.episodeTitle': episode.title,
          }),
      playbackStartPositionMs: playbackPositionMs);

  PlaybackPlatformInterface.instance
      .replaceCurrentMediaItem(playerId, mediaItem, autoplay: true);
}

Future queueEpisode(
    {required String playerId, required Episode episode}) async {
  var mediaItem = MediaItem(
      url: episode.streamUrl,
      mimeType: 'application/x-mpegURL',
      metadata: MediaMetadata(
          title: episode.title,
          artworkUri: episode.imageUrl,
          extras: {
            'id': episode.id.toString(),
            'npaw.content.id': episode.id,
            'npaw.content.tvShow': episode.showTitle,
            'npaw.content.season': episode.seasonTitle,
            'npaw.content.episodeTitle': episode.title,
          }));

  PlaybackPlatformInterface.instance.queueMediaItem(playerId, mediaItem);
}
