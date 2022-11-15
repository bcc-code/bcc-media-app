import 'package:bccm_player/playback_platform_pigeon.g.dart';
import 'package:bccm_player/playback_service.dart';
import 'package:bccm_player/playback_service_interface.dart';
import 'package:brunstadtv_app/api/brunstadtv.dart';
import 'package:brunstadtv_app/graphql/queries/episode.graphql.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final playbackApiProvider = Provider<PlaybackPlatformInterface>((ref) {
  return PlaybackService();
});

MediaItem _mapEpisode(Query$FetchEpisode$episode episode) {
  return MediaItem(
      url: episode.getBestStreamUrl(),
      mimeType: 'application/x-mpegURL',
      metadata: MediaMetadata(title: episode.title, artist: episode.season?.$show.title, artworkUri: episode.imageUrl, extras: {
        'id': episode.id.toString(),
        'npaw.content.id': episode.id,
        'npaw.content.tvShow': episode.season?.$show.title,
        'npaw.content.season': episode.season?.title,
        'npaw.content.episodeTitle': episode.title,
      }));
}

Future playEpisode({required String playerId, required Query$FetchEpisode$episode episode, bool? autoplay, int? playbackPositionMs}) async {
  var mediaItem = _mapEpisode(episode);
  mediaItem.playbackStartPositionMs = playbackPositionMs;
  await PlaybackPlatformInterface.instance.replaceCurrentMediaItem(playerId, mediaItem, autoplay: autoplay);
}

Future queueEpisode({required String playerId, required Query$FetchEpisode$episode episode}) async {
  var mediaItem = _mapEpisode(episode);
  PlaybackPlatformInterface.instance.queueMediaItem(playerId, mediaItem);
}
