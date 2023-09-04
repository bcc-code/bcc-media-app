import 'package:auto_route/auto_route.dart';
import 'package:bccm_player/bccm_player.dart';
import 'package:bccm_player/plugins/riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:brunstadtv_app/router/router.gr.dart';

import '../helpers/widget_keys.dart';
import '../screens/tabs/live.dart';

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

  Widget _emptyPlayer(PlayerState player) {
    var metadata = ref.read(liveMetadataProvider);
    return MiniPlayer(
      titleKey: WidgetKeys.miniPlayerTitle,
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
        BccmPlayerInterface.instance.pause(player.playerId);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final player = ref.watch(primaryPlayerProvider);
    final currentMetadata = player?.currentMediaItem?.metadata;

    if (player == null || player.isInPipMode || currentMetadata == null) {
      return const SizedBox.shrink();
    }

    if (currentMetadata.extras?['id'] != 'livestream') {
      return _emptyPlayer(player);
    } else if (waitingForMediaItemToBeCorrect == true) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => setState(() {
          waitingForMediaItemToBeCorrect = false;
        }),
      );
    }

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        context.router.navigate(const LiveScreenRoute());
      },
      child: MiniPlayer(
        titleKey: WidgetKeys.miniPlayerTitle,
        secondaryTitle: currentMetadata.artist,
        title: currentMetadata.title ?? '',
        artworkUri: currentMetadata.artworkUri ?? '',
        isPlaying: player.playbackState == PlaybackState.playing,
        hideCloseButton: true,
        onPlayTap: () {
          BccmPlayerInterface.instance.play(player.playerId);
        },
        onPauseTap: () {
          BccmPlayerInterface.instance.pause(player.playerId);
        },
      ),
    );
  }
}
