import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:brunstadtv_app/providers/chromecast.dart';
import 'package:brunstadtv_app/providers/playback_api.dart';
import 'package:brunstadtv_app/providers/video_state.dart';
import 'package:brunstadtv_app/router/router.gr.dart';

import '../screens/live.dart';
import 'mini_player.dart';

class LiveMiniPlayer extends ConsumerStatefulWidget {
  const LiveMiniPlayer({Key? key, required this.onStartRequest}) : super(key: key);

  final void Function() onStartRequest;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LiveMiniPlayerState();
}

class _LiveMiniPlayerState extends ConsumerState<LiveMiniPlayer> {
  @override
  void initState() {
    super.initState();
  }

  bool waitingForMediaItemToBeCorrect = false;

  Widget _emptyPlayer(Player player) {
    var metadata = ref.read(liveMetadataProvider);
    return MiniPlayer(
      secondaryTitle: metadata.artist,
      title: metadata.title ?? '',
      artworkUri: metadata.artworkUri,
      isPlaying: false,
      loading: waitingForMediaItemToBeCorrect,
      hideCloseButton: true,
      onPlayTap: () {
        setState(() {
          waitingForMediaItemToBeCorrect = true;
        });
        widget.onStartRequest();
      },
      onPauseTap: () {
        ref.read(playbackApiProvider).pause(player.playerId);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Player? player;
    if (ref.watch(isCasting)) {
      player = ref.watch(castPlayerProvider);
    } else {
      player = ref.watch(primaryPlayerProvider);
    }

    if (player == null || player.isInPipMode) {
      return const SizedBox.shrink();
    }

    if (player.currentMediaItem?.metadata?.extras?['id'] != 'livestream') {
      return _emptyPlayer(player);
    } else if (waitingForMediaItemToBeCorrect == true) {
      WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
            waitingForMediaItemToBeCorrect = false;
          }));
    }

    var artist = player.currentMediaItem?.metadata?.artist;
    var title = player.currentMediaItem?.metadata?.title;
    var artworkUri = player.currentMediaItem?.metadata?.artworkUri;
    var playbackState = player.playbackState;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        context.router.navigate(const LiveScreenRoute());
      },
      child: MiniPlayer(
        secondaryTitle: artist,
        title: title ?? '',
        artworkUri: artworkUri ?? 'https://source.unsplash.com/random/1600x900/?fruit',
        isPlaying: playbackState == PlaybackState.playing,
        hideCloseButton: true,
        onPlayTap: () {
          ref.read(playbackApiProvider).play(player!.playerId);
        },
        onPauseTap: () {
          ref.read(playbackApiProvider).pause(player!.playerId);
        },
      ),
    );
  }
}
