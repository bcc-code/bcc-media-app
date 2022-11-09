import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/helpers/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:brunstadtv_app/providers/chromecast.dart';
import 'package:brunstadtv_app/providers/playback_api.dart';
import 'package:brunstadtv_app/providers/video_state.dart';
import 'package:brunstadtv_app/router/router.gr.dart';

import '../providers/fun.dart';
import 'mini_player.dart';

class BottomSheetMiniPlayer extends ConsumerStatefulWidget {
  const BottomSheetMiniPlayer({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _BottomSheetMiniPlayerState();
}

class _BottomSheetMiniPlayerState extends ConsumerState<BottomSheetMiniPlayer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Player? player;
    if (ref.watch(isCasting)) {
      player = ref.watch(castPlayerProvider);
    } else {
      player = ref.watch(primaryPlayerProvider);
    }

    if (player == null || player.currentMediaItem == null) {
      return const SizedBox.shrink();
    }

    if (player.isInPipMode) {
      return const SizedBox.shrink();
    }

    var artist = player.currentMediaItem?.metadata?.artist;
    var title = player.currentMediaItem?.metadata?.title;
    var artworkUri = player.currentMediaItem?.metadata?.artworkUri;
    var playbackState = player.playbackState;

    return GestureDetector(
      onTap: () {
        var id = player?.currentMediaItem?.metadata?.extras?['id']
            .asOrNull<String>();
        if (id == 'livestream') {
          context.router.navigate(const LiveScreenRoute());
        } else if (id != null) {
          ref.read(tempTitleProvider.notifier).state = title;
          try {
            context.navigateTo(EpisodeScreenRoute(episodeId: id));
          } catch (_) {
            context.navigateTo(HomeScreenWrapperRoute(
                children: [EpisodeScreenRoute(episodeId: id)]));
          }
        }
      },
      child: MiniPlayer(
        secondaryTitle: artist,
        title: title ?? '',
        artworkUri:
            artworkUri ?? 'https://source.unsplash.com/random/1600x900/?fruit',
        isPlaying: playbackState == PlaybackState.playing,
        onPlayTap: () {
          ref.read(playbackApiProvider).play(player!.playerId);
        },
        onPauseTap: () {
          ref.read(playbackApiProvider).pause(player!.playerId);
        },
        onCloseTap: () {
          ref.read(playbackApiProvider).stop(player!.playerId, true);
        },
      ),
    );
  }
}
