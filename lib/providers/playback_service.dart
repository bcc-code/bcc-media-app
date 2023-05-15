import 'package:bccm_player/bccm_player.dart';
import 'package:bccm_player/plugins/bcc_media.dart';
import 'package:bccm_player/plugins/riverpod.dart';
import 'package:brunstadtv_app/env/env.dart';
import 'package:brunstadtv_app/graphql/queries/episode.graphql.dart';
import 'package:brunstadtv_app/graphql/schema/schema.graphql.dart';
import 'package:brunstadtv_app/helpers/extensions.dart';
import 'package:brunstadtv_app/providers/analytics.dart';
import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../api/brunstadtv.dart';
import '../graphql/schema/episodes.graphql.dart';
import '../helpers/version.dart';

final playbackServiceProvider = Provider<PlaybackService>((ref) {
  return PlaybackService(
    ref: ref,
    platformApi: BccmPlayerInterface.instance,
    analyticsService: ref.watch(analyticsProvider),
  );
});

class PlaybackService {
  BccmPlayerInterface platformApi;
  Analytics analyticsService;
  Ref ref;

  PlaybackService({
    required this.platformApi,
    required this.analyticsService,
    required this.ref,
  });

  Future init() async {
    await platformApi.setNpawConfig(
      NpawConfig(
        accountCode: Env.npawAccountCode,
        appName: 'mobile',
      ),
    );

    BccmPlaybackListener(ref: ref, apiProvider: apiProvider);

    // Keep the analytics session alive while playing stuff.
    ref.listen<PlayerState?>(primaryPlayerProvider, (_, next) {
      if (next?.currentMediaItem != null && next?.playbackState == PlaybackState.playing) {
        analyticsService.heyJustHereToTellYouIBelieveTheSessionIsStillAlive();
      }
    });

    // Initialize npaw
    if (Env.npawAccountCode != '') {
      PackageInfo.fromPlatform().then(
        (packageInfo) => platformApi.setNpawConfig(
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
    final collectionId = episode.context.asOrNull<Fragment$EpisodeContext$$ContextCollection>()?.id;
    return MediaItem(
      url: episode.streams.getBestStreamUrl(),
      mimeType: 'application/x-mpegURL',
      metadata: MediaMetadata(
        title: episode.title,
        artist: episode.season?.$show.title,
        artworkUri: episode.image,
        extras: {
          'id': episode.id.toString(),
          if (collectionId != null) 'context.collectionId': collectionId,
          'npaw.content.id': episode.id,
          'npaw.content.tvShow': episode.season?.$show.id,
          if (episode.season != null) 'npaw.content.season': '${episode.season!.id} - ${episode.season!.title}',
          'npaw.content.episodeTitle': episode.title,
        },
      ),
    );
  }

  Future playEpisodeById({
    required String playerId,
    required String episodeId,
    Input$EpisodeContext? context,
    bool? autoplay,
    int? playbackPositionMs,
  }) async {
    final episode = await ref.read(apiProvider).fetchEpisode(episodeId, context: context);
    if (episode == null) return;
    playEpisode(
      playerId: playerId,
      episode: episode,
      autoplay: autoplay,
      playbackPositionMs: playbackPositionMs,
    );
  }

  Future playEpisode({required String playerId, required Query$FetchEpisode$episode episode, bool? autoplay, int? playbackPositionMs}) async {
    var mediaItem = _mapEpisode(episode);
    mediaItem.playbackStartPositionMs = playbackPositionMs?.toDouble();
    await platformApi.replaceCurrentMediaItem(playerId, mediaItem, autoplay: autoplay);
  }

  Future queueEpisode({required String playerId, required Query$FetchEpisode$episode episode}) async {
    var mediaItem = _mapEpisode(episode);
    platformApi.queueMediaItem(playerId, mediaItem);
  }
}

extension StreamUrlExtension on List<Fragment$BasicStream> {
  String getBestStreamUrl() {
    var streamUrl = firstWhereOrNull((element) => element.type == Enum$StreamType.hls_cmaf || element.type == Enum$StreamType.hls_ts)?.url;
    streamUrl ??= first.url;
    return streamUrl;
  }
}
