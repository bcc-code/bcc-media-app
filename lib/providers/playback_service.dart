import 'package:bccm_player/playback_platform_pigeon.g.dart';
import 'package:bccm_player/playback_service_interface.dart';
import 'package:brunstadtv_app/env/env.dart';
import 'package:brunstadtv_app/graphql/queries/episode.graphql.dart';
import 'package:brunstadtv_app/graphql/schema/items.graphql.dart';
import 'package:brunstadtv_app/providers/analytics.dart';
import 'package:brunstadtv_app/providers/chromecast.dart';
import 'package:brunstadtv_app/providers/playback_listener.dart';
import 'package:brunstadtv_app/providers/video_state.dart';
import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../helpers/version.dart';

final playbackApiProvider = Provider<PlaybackPlatformInterface>((ref) {
  return PlaybackPlatformInterface.instance;
});

final playbackServiceProvider = Provider<PlaybackService>((ref) {
  return PlaybackService(
    ref: ref,
    playbackApi: ref.watch(playbackApiProvider),
    analyticsService: ref.watch(analyticsProvider),
  );
});

class PlaybackService {
  PlaybackPlatformInterface playbackApi;
  Analytics analyticsService;
  Ref ref;

  PlaybackService({
    required this.playbackApi,
    required this.analyticsService,
    required this.ref,
  }) {
    _init();
  }

  Future _init() async {
    playbackApi.setPlaybackListener(PlaybackListener(ref: ref));

    // Keep the analytics session alive while playing stuff.
    ref.listen<Player?>(primaryPlayerProvider, (_, next) {
      if (next?.currentMediaItem != null && next?.playbackState == PlaybackState.playing) {
        analyticsService.heyJustHereToTellYouIBelieveTheSessionIsStillAlive();
      }
    });

    // Get and set chromecast state
    playbackApi.getChromecastState().then((value) {
      ref.read(isCasting.notifier).state = value?.connectionState == CastConnectionState.connected;
      ref.read(castPlayerProvider.notifier).setMediaItem(value?.mediaItem);
    });

    // Initialize npaw
    if (Env.npawAccountCode != '') {
      PackageInfo.fromPlatform().then(
        (packageInfo) => playbackApi.setNpawConfig(
          NpawConfig(
            accountCode: Env.npawAccountCode,
            appName: 'mobile',
            appReleaseVersion: formatAppVersion(packageInfo),
          ),
        ),
      );
    }
  }

  MediaItem _mapEpisode(Query$FetchEpisode$episode episode) {
    return MediaItem(
        url: episode.streams.getBestStreamUrl(),
        mimeType: 'application/x-mpegURL',
        metadata: MediaMetadata(title: episode.title, artist: episode.season?.$show.title, artworkUri: episode.image, extras: {
          'id': episode.id.toString(),
          'npaw.content.id': episode.id,
          'npaw.content.tvShow': episode.season?.$show.title,
          'npaw.content.season': episode.season?.title,
          'npaw.content.episodeTitle': episode.title,
        }));
  }

  Future playEpisode({required String playerId, required Query$FetchEpisode$episode episode, bool? autoplay, int? playbackPositionMs}) async {
    var mediaItem = _mapEpisode(episode);
    mediaItem.playbackStartPositionMs = playbackPositionMs?.toDouble();
    await playbackApi.replaceCurrentMediaItem(playerId, mediaItem, autoplay: autoplay);
  }

  Future queueEpisode({required String playerId, required Query$FetchEpisode$episode episode}) async {
    var mediaItem = _mapEpisode(episode);
    playbackApi.queueMediaItem(playerId, mediaItem);
  }
}

extension StreamUrlExtension on List<Fragment$BasicStream> {
  String getBestStreamUrl() {
    var streamUrl = firstWhereOrNull((element) => element.type == Enum$StreamType.hls_cmaf || element.type == Enum$StreamType.hls_ts)?.url;
    streamUrl ??= first.url;
    return streamUrl;
  }
}
