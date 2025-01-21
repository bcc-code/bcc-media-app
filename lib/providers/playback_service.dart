import 'package:auto_route/auto_route.dart';
import 'package:bccm_core/bccm_core.dart';
import 'package:bccm_player/bccm_player.dart';
import 'package:bccm_player/plugins/bcc_media.dart';
import 'package:bccm_player/plugins/riverpod.dart';
import 'package:brunstadtv_app/components/player/custom_cast_player.dart';
import 'package:brunstadtv_app/env/env.dart';
import 'package:brunstadtv_app/flavors.dart';
import 'package:bccm_core/platform.dart';
import 'package:brunstadtv_app/helpers/constants.dart';
import 'package:brunstadtv_app/models/offline/download_additional_data.dart';
import 'package:brunstadtv_app/router/router.gr.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_to_airplay/flutter_to_airplay.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:universal_io/io.dart';
import 'package:unleash_proxy_client_flutter/id_generator.dart';

import '../api/brunstadtv.dart';

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
    var npawAppName = FlavorConfig.current.applicationCode;
    if (FlavorConfig.current.flavor == Flavor.bccmedia) {
      npawAppName = ref.read(isAndroidTvProvider) ? AppNames.bccmAndroidTv : AppNames.bccmMobile;
    }
    if (FlavorConfig.current.flavor == Flavor.kids) {
      npawAppName = AppNames.kidsMobile;
    }
    BccmPlaybackListener(
      ref: ref,
      updateProgress: (episodeId, progressSeconds) => ref.read(apiProvider).updateProgress(
            episodeId: episodeId,
            progress: progressSeconds,
          ),
      onMediaItemTransition: (event) {
        if (event.mediaItem != null) {
          final videoId = event.mediaItem!.metadata?.extras?['npaw.content.id'];
          final referenceId = event.mediaItem!.metadata?.extras?['npaw.content.transactionCode'];
          ref.read(analyticsProvider).videoPlayed(VideoPlayedEvent(
                videoId: videoId,
                referenceId: referenceId,
                data: {
                  // Whatever data we want to pass to the analytics event
                },
              ));
        }
      },
    );

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
            appName: npawAppName,
            appReleaseVersion: formatAppVersion(packageInfo),
            deviceIsAnonymous: FlavorConfig.current.strictAnonymousAnalytics,
          ),
        ),
      );
    }
  }

  MediaItem mapDownload(Download download) {
    return MediaItem(
      url: download.offlineUrl,
      isLive: false,
      isOffline: true,
      mimeType: download.config.mimeType,
      metadata: MediaMetadata(
        title: download.config.title,
        artist: download.config.typedAdditionalData.secondaryTitle,
        artworkUri: download.config.typedAdditionalData.artworkUri,
        durationMs: download.config.typedAdditionalData.durationMs,
        extras: download.config.additionalData,
      ),
    );
  }

  MediaItem mapEpisode(Fragment$PlayableMediaItem$$Episode episode, {String? playlistId, String? videoLanguageCode}) {
    final collectionId = episode.context.asOrNull<Fragment$EpisodeContext$$ContextCollection>()?.id;
    final stream = episode.streams.getBestStream(videoLanguageCode: videoLanguageCode);
    final user = ref.read(authStateProvider).user;
    final ageGroup = user?.let((u) => getAgeGroupFromUser(u));
    final transactionCode = generateId();
    return MediaItem(
      url: stream.url,
      mimeType: 'application/x-mpegURL',
      metadata: MediaMetadata(
        title: episode.title,
        artist: episode.season?.$show.title,
        artworkUri: episode.image,
        durationMs: (episode.duration * 1000).toDouble(),
        extras: {
          'id': episode.id.toString(),
          if (stream.videoLanguage != null) 'videoLanguage': toThreeLetterLanguageCode(stream.videoLanguage!),
          if (collectionId != null) 'context.collectionId': collectionId,
          if (playlistId != null) 'context.playlistId': playlistId,
          'context.cursor': episode.cursor,
          'npaw.content.id': episode.id,
          'npaw.content.tvShow': episode.season?.$show.id,
          if (episode.season != null) 'npaw.content.season': episode.season!.id,
          'npaw.content.title': episode.originalTitle,
          if (ageGroup != null) 'npaw.content.customDimension2': ageGroup.name,
          'npaw.content.transactionCode': transactionCode,
        },
      ),
    );
  }

  BccmPlayerViewConfig getDefaultViewConfig() {
    return BccmPlayerViewConfig(
      resetSystemOverlays: () {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      },
      deviceOrientationsFullscreen: (_) => [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight],
      deviceOrientationsNormal: (_) => [DeviceOrientation.portraitUp],
      castPlayerBuilder: (context) => const CustomCastPlayerView(),
      controlsConfig: BccmPlayerControlsConfig(
        playbackSpeeds: [0.75, 1, 1.5, 1.75, 2],
        additionalActionsBuilder: (context) => [
          if (Platform.isIOS)
            Padding(
              padding: const EdgeInsets.only(bottom: 3, right: 4),
              child: Transform.scale(
                scale: 0.8,
                child: const AirPlayRoutePickerView(
                  width: 20,
                  height: 32,
                  prioritizesVideoDevices: true,
                  tintColor: Colors.white,
                  activeTintColor: Colors.white,
                  backgroundColor: Colors.transparent,
                ),
              ),
            )
        ],
        hideQualitySelector: true,
      ),
    );
  }

  Future<Fragment$PlayableMediaItem$$Episode?> getNextEpisodeForPlayer({
    required String playerId,
  }) async {
    final episodeId = ref.read(playerProviderFor(playerId))?.currentMediaItem?.metadata?.extras?['id']?.asOrNull<String>();
    if (episodeId == null) {
      debugPrint('playNextForPlayer($playerId): No episode id found in currentMediaItem.');
      return null;
    }
    final collectionId = ref.read(playerProviderFor(playerId))?.currentMediaItem?.metadata?.extras?['context.collectionId']?.asOrNull<String>();
    final episode = await ref.read(bccmGraphQLProvider).query$getNextEpisodes(
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

  Future playEpisode({
    required String playerId,
    required Fragment$PlayableMediaItem$$Episode episode,
    bool? autoplay,
    int? playbackPositionMs,
    String? playlistId,
    String? videoLanguageCode,
  }) async {
    var mediaItem = mapEpisode(episode, playlistId: playlistId, videoLanguageCode: videoLanguageCode);
    mediaItem.playbackStartPositionMs = playbackPositionMs?.toDouble();
    await platformApi.replaceCurrentMediaItem(playerId, mediaItem, autoplay: autoplay);
  }

  Future<void> openFullscreen(BuildContext context, {BccmPlayerViewConfig? config}) async {
    config ??= getDefaultViewConfig();
    final viewController = BccmPlayerViewController(
      playerController: platformApi.primaryController,
      config: config.copyWith(
        controlsConfig: config.controlsConfig.copyWith(hideQualitySelector: false),
      ),
    );
    return viewController.enterFullscreen(context: context).then((_) {
      viewController.dispose();
    });
  }

  Future<void> playDownload(Download download) async {
    final mediaItem = mapDownload(download);
    platformApi.primaryController.replaceCurrentMediaItem(mediaItem);
  }

  /// A helper function to autoplay and navigate to the next episode, if available
  ///
  /// Works even when in background e.g. on iOS, as it doesn't rely on the new episode page to render.
  Future<bool> getNextEpisodeAndAutoplayIt(PlaybackService playbackService, String playerId, StackRouter router) async {
    final nextEpisode = await playbackService.getNextEpisodeForPlayer(playerId: playerId);
    if (nextEpisode == null) {
      playbackService.platformApi.exitFullscreen(playerId);
      return false;
    }
    // When we are fullscreen on iOS, flutter's lifecyclestate becomes 'paused', and the widget tree won't build e.g. on navigation.
    // Therefore we can't rely on the routing to autoplay the next episode.
    // But we still call navigate(), so that it's performed when the user exits fullscreen.
    // TODO: Navigate upon fullscreen exit instead. Basically: if leaving fullscreen and we're on the wrong page, navigate.
    playbackService.playEpisode(
      playerId: playerId,
      episode: nextEpisode,
      playbackPositionMs: 0,
      autoplay: true,
    );
    router.navigate(
      EpisodeScreenRoute(
        episodeId: nextEpisode.id,
        collectionId: nextEpisode.context?.asOrNull<Fragment$EpisodeContext$$ContextCollection>()?.id,
        autoplay: true,
        queryParamStartPositionSeconds: 0,
      ),
    );
    return true;
  }
}

extension StreamUrlExtension on List<Fragment$BasicStream> {
  Fragment$BasicStream? getDownloadableStream() {
    var stream = firstWhereOrNull((s) => s.downloadable && (s.type == Enum$StreamType.hls_cmaf));
    stream ??= firstWhereOrNull((s) => s.downloadable && (s.type == Enum$StreamType.hls_ts));
    return stream;
  }

  Fragment$BasicStream getBestStream({String? videoLanguageCode}) {
    bool correctLang(Fragment$BasicStream? s) => s == null ? true : s.videoLanguage == videoLanguageCode;
    var streamUrl = firstWhereOrNull((s) => s.type == Enum$StreamType.hls_cmaf && correctLang(s));
    streamUrl ??= firstWhereOrNull((s) => s.type == Enum$StreamType.hls_cmaf);
    streamUrl ??= firstWhereOrNull((s) => s.type == Enum$StreamType.hls_ts && correctLang(s));
    streamUrl ??= firstWhereOrNull((s) => s.type == Enum$StreamType.hls_ts);
    streamUrl ??= first;
    return streamUrl;
  }
}
