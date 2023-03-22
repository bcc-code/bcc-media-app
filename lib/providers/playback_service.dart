import 'package:bccm_player/bccm_player.dart';
import 'package:bccm_player/plugins/bcc_media.dart';
import 'package:bccm_player/plugins/riverpod.dart';
import 'package:brunstadtv_app/env/env.dart';
import 'package:brunstadtv_app/graphql/queries/episode.graphql.dart';
import 'package:brunstadtv_app/graphql/schema/items.graphql.dart';
import 'package:brunstadtv_app/providers/analytics.dart';
import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../api/brunstadtv.dart';
import '../helpers/version.dart';

final playbackServiceProvider = Provider<PlaybackService>((ref) {
  return PlaybackService(
    ref: ref,
    playbackApi: BccmPlayerInterface.instance,
    analyticsService: ref.watch(analyticsProvider),
  );
});

class PlaybackService {
  BccmPlayerInterface playbackApi;
  Analytics analyticsService;
  Ref ref;

  PlaybackService({
    required this.playbackApi,
    required this.analyticsService,
    required this.ref,
  });

  Future init() async {
    await playbackApi.setNpawConfig(
      NpawConfig(
        accountCode: Env.npawAccountCode,
        appName: 'mobile',
      ),
    );
    playbackApi.addRiverpod(ref);
    playbackApi.addPlaybackListener(BccmPlaybackListener(ref: ref, apiProvider: apiProvider));

    // Keep the analytics session alive while playing stuff.
    ref.listen<PlayerState?>(primaryPlayerProvider, (_, next) {
      if (next?.currentMediaItem != null && next?.playbackState == PlaybackState.playing) {
        analyticsService.heyJustHereToTellYouIBelieveTheSessionIsStillAlive();
      }
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
          'npaw.content.tvShow': episode.season?.$show.id,
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
