import 'package:bccm_player/bccm_player.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:flutter/material.dart';

class VideoPlayerViewFullscreen extends HookWidget {
  const VideoPlayerViewFullscreen({
    super.key,
    required this.playerId,
    this.playNextButton,
  });

  final String playerId;
  final WidgetBuilder? playNextButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            color: Colors.black,
          ),
          SizedBox.expand(
            child: Align(
              alignment: Alignment.center,
              child: VideoPlayerView(
                id: playerId,
                useNativeControls: false,
                isFullscreenPlayer: true,
                playNextButton: playNextButton,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
