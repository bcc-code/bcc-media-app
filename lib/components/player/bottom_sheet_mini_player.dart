import 'package:auto_route/auto_route.dart';
import 'package:bccm_player/bccm_player.dart';
import 'package:bccm_player/plugins/riverpod.dart';
import 'package:bccm_core/bccm_core.dart';
import 'package:brunstadtv_app/helpers/permanent_cache_manager.dart';
import 'package:brunstadtv_app/helpers/widget_keys.dart';
import 'package:brunstadtv_app/providers/playback_service.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:brunstadtv_app/router/router.gr.dart';

import '../../l10n/app_localizations.dart';
import 'package:bccm_core/design_system.dart';

class BottomSheetMiniPlayer extends ConsumerStatefulWidget {
  const BottomSheetMiniPlayer({super.key, required this.hidden});

  final bool hidden;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BottomSheetMiniPlayerState();
}

class _BottomSheetMiniPlayerState extends ConsumerState<BottomSheetMiniPlayer> {
  MediaMetadata? previousMetadata;

  @override
  Widget build(BuildContext context) {
    PlayerState? player = ref.watch(primaryPlayerProvider);

    if (previousMetadata != player?.currentMediaItem?.metadata) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => setState(
          () {
            previousMetadata = player?.currentMediaItem?.metadata;
          },
        ),
      );
    }

    return AnimatedAlign(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOutQuart,
      alignment: Alignment.topCenter,
      heightFactor: widget.hidden ? 0 : 1,
      child: widget.hidden || player == null ? _buildDummy() : _buildMiniPlayer(player),
    );
  }

  Widget _buildMiniPlayer(PlayerState player) {
    final artist = player.currentMediaItem?.metadata?.artist;
    final title = player.currentMediaItem?.metadata?.title;
    final artworkUri = player.currentMediaItem?.metadata?.artworkUri;
    final playbackState = player.playbackState;
    final offlineVideo = player.currentMediaItem?.isOffline;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () async {
        final id = player.currentMediaItem?.metadata?.extras?['id']?.asOrNull<String>();
        final type = player.currentMediaItem?.metadata?.extras?['type']?.asOrNull<String>();
        final collectionId = player.currentMediaItem?.metadata?.extras?['context.collectionId']?.asOrNull<String>();
        final offlineMediaItem = player.currentMediaItem?.isOffline == true;
        if (offlineMediaItem) {
          ref.read(playbackServiceProvider).openFullscreen(context);
        } else if (type == 'track') {
          await context.router.root.push(const PlayerScreenRoute());
        } else if (id != null) {
          try {
            await context.navigateTo(EpisodeScreenRoute(episodeId: id, collectionId: collectionId));
          } catch (_) {
            if (mounted) {
              await context.navigateTo(HomeWrapperScreenRoute(children: [EpisodeScreenRoute(episodeId: id)]));
            }
          }
        }
      },
      child: MiniPlayer(
        key: WidgetKeys.bottomSheetMiniPlayer,
        playerController: BccmPlayerInterface.instance.primaryController,
        titleKey: WidgetKeys.miniPlayerTitle,
        secondaryTitle: artist,
        title: title ?? '',
        artwork: artworkUri != null && (ref.watch(isOfflineProvider) || offlineVideo == true)
            ? ExtendedNetworkImageProvider(
                artworkUri,
                cache: true,
                imageCacheName: PermanentCacheManager().config.cacheKey,
                cacheMaxAge: PermanentCacheManager().config.stalePeriod,
              )
            : null,
        artworkUri: artworkUri ?? '',
        playSemanticLabel: S.of(context).play,
        pauseSemanticLabel: S.of(context).pause,
        isPlaying: playbackState == PlaybackState.playing,
        onPlayTap: () {
          BccmPlayerInterface.instance.play(player.playerId);
        },
        onPauseTap: () {
          BccmPlayerInterface.instance.pause(player.playerId);
        },
        onCloseTap: () {
          BccmPlayerInterface.instance.stop(player.playerId, true);
        },
      ),
    );
  }

  /// Builds based on the previous meta (to ensure smooth transition)
  /// Worst case, just a blank box. Shouldn't happen though, I think.
  Widget _buildDummy() {
    final metadata = previousMetadata;
    if (metadata != null) {
      return MiniPlayer(
        titleKey: WidgetKeys.miniPlayerTitle,
        playerController: BccmPlayerInterface.instance.primaryController,
        secondaryTitle: metadata.artist,
        title: metadata.title ?? '',
        artworkUri: metadata.artworkUri ?? '',
        showBorder: false,
        isPlaying: false,
      );
    }
    return Container(
      height: kMiniPlayerHeight,
      width: MediaQuery.sizeOf(context).width,
      color: DesignSystem.of(context).colors.background2,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
    );
  }
}
