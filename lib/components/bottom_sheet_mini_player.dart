import 'package:auto_route/auto_route.dart';
import 'package:bccm_player/bccm_player.dart';
import 'package:bccm_player/plugins/riverpod.dart';
import 'package:brunstadtv_app/helpers/extensions.dart';
import 'package:brunstadtv_app/helpers/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:brunstadtv_app/router/router.gr.dart';

import '../l10n/app_localizations.dart';
import '../theme/design_system/design_system.dart';
import '../providers/fun.dart';

class BottomSheetMiniPlayer extends ConsumerStatefulWidget {
  const BottomSheetMiniPlayer({Key? key, required this.hidden}) : super(key: key);

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
    var artist = player.currentMediaItem?.metadata?.artist;
    var title = player.currentMediaItem?.metadata?.title;
    var artworkUri = player.currentMediaItem?.metadata?.artworkUri;
    var playbackState = player.playbackState;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () async {
        var id = player.currentMediaItem?.metadata?.extras?['id']?.asOrNull<String>();
        var collectionId = player.currentMediaItem?.metadata?.extras?['context.collectionId']?.asOrNull<String>();
        if (id == 'livestream') {
          context.router.navigate(const LiveScreenRoute());
        } else if (id != null) {
          ref.read(tempTitleProvider.notifier).state = title;
          try {
            await context.navigateTo(EpisodeScreenRoute(episodeId: id, collectionId: collectionId));
          } catch (_) {
            await context.navigateTo(HomeScreenWrapperRoute(children: [EpisodeScreenRoute(episodeId: id)]));
          }
        }
      },
      child: MiniPlayer(
        key: WidgetKeys.bottomSheetMiniPlayer,
        titleKey: WidgetKeys.miniPlayerTitle,
        secondaryTitle: artist,
        title: title ?? '',
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
        secondaryTitle: metadata.artist,
        title: metadata.title ?? '',
        artworkUri: metadata.artworkUri ?? '',
        showBorder: false,
        isPlaying: false,
      );
    }
    return Container(
      height: kMiniPlayerHeight,
      width: MediaQuery.of(context).size.width,
      color: DesignSystem.of(context).colors.background2,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
    );
  }
}
