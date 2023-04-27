import 'package:auto_route/auto_route.dart';
import 'package:bccm_player/bccm_player.dart';
import 'package:bccm_player/plugins/riverpod.dart';
import 'package:brunstadtv_app/helpers/extensions.dart';
import 'package:brunstadtv_app/helpers/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:brunstadtv_app/router/router.gr.dart';

import '../theme/bccm_colors.dart';
import '../providers/fun.dart';
import 'mini_player.dart';

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
    PlayerState? player;
    if (ref.watch(isCasting)) {
      player = ref.watch(castPlayerProvider);
    } else {
      player = ref.watch(primaryPlayerProvider);
    }
    if (previousMetadata != player?.currentMediaItem?.metadata) {
      WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
            previousMetadata = player?.currentMediaItem?.metadata;
          }));
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
      onTap: () {
        var id = player.currentMediaItem?.metadata?.extras?['id']?.asOrNull<String>();
        if (id == 'livestream') {
          context.router.navigate(const LiveScreenRoute());
        } else if (id != null) {
          ref.read(tempTitleProvider.notifier).state = title;
          try {
            context.navigateTo(EpisodeScreenRoute(episodeId: id));
          } catch (_) {
            context.navigateTo(HomeScreenWrapperRoute(children: [EpisodeScreenRoute(episodeId: id)]));
          }
        }
      },
      child: MiniPlayer(
        key: WidgetKeys.bottomSheetMiniPlayer,
        secondaryTitle: artist,
        title: title ?? '',
        artworkUri: artworkUri ?? 'https://source.unsplash.com/random/1600x900/?fruit',
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
    if (previousMetadata != null) {
      var artist = previousMetadata!.artist;
      var title = previousMetadata!.title;
      var artworkUri = previousMetadata!.artworkUri;
      return MiniPlayer(
        secondaryTitle: artist,
        title: title ?? '',
        artworkUri: artworkUri ?? 'https://source.unsplash.com/random/1600x900/?fruit',
        isPlaying: false,
        border: null,
      );
    }
    return Container(
        height: kMiniPlayerHeight,
        width: MediaQuery.of(context).size.width,
        color: BccmColors.background2,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ));
  }
}
