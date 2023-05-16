import 'package:bccm_player/bccm_player.dart';
import 'package:bccm_player/plugins/bcc_media.dart';
import 'package:bccm_player/plugins/riverpod.dart';
import 'package:brunstadtv_app/env/env.dart';
import 'package:brunstadtv_app/graphql/client.dart';
import 'package:brunstadtv_app/graphql/queries/episode.graphql.dart';
import 'package:brunstadtv_app/graphql/schema/schema.graphql.dart';
import 'package:brunstadtv_app/helpers/extensions.dart';
import 'package:brunstadtv_app/providers/analytics.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
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

  MediaItem _mapEpisode(Fragment$PlayableEpisode episode) {
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

  Future<Fragment$PlayableEpisode?> getNextEpisodeForPlayer({
    required String playerId,
  }) async {
    final episodeId = ref.read(playerProviderFor(playerId))?.currentMediaItem?.metadata?.extras?['id']?.asOrNull<String>();
    if (episodeId == null) {
      debugPrint('playNextForPlayer($playerId): No episode id found in currentMediaItem.');
      return null;
    }
    final collectionId = ref.read(playerProviderFor(playerId))?.currentMediaItem?.metadata?.extras?['context.collectionId']?.asOrNull<String>();
    final episode = await ref.read(gqlClientProvider).query$getNextEpisodes(
          Options$Query$getNextEpisodes(
            variables: Variables$Query$getNextEpisodes(
              episodeId: episodeId,
              context: collectionId != null ? Input$EpisodeContext(collectionId: collectionId) : null,
            ),
          ),
        );
    final nextEpisode = episode.parsedData!.episode.next.firstOrNull;
    if (nextEpisode == null) {
      debugPrint('playNextForPlayer($playerId): getNextEpisodes returned no next episode.');
      return null;
    }
    return nextEpisode;
  }

  Future playEpisode({required String playerId, required Fragment$PlayableEpisode episode, bool? autoplay, int? playbackPositionMs}) async {
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
