import 'package:better_player/better_player.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../states/betterplayer_state.dart';
import '../states/videoplayer_state.dart';

enum PlayerType { betterPlayer, videoPlayer }

class BccmPlayer extends StatelessWidget {
  final PlayerType type;

  const BccmPlayer({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    if (type == PlayerType.betterPlayer) {
      return Consumer<BetterPlayerState>(
          builder: ((context, value, child) => BetterPlayer(
              controller: value.controller.betterPlayerController!)));
    } else {
      return Consumer<VideoPlayerState>(
          builder: ((context, value, child) => FutureBuilder(
                future: value.initializeVideoPlayerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return AspectRatio(
                        aspectRatio: value.controller.value.aspectRatio,
                        child: Chewie(
                            controller: ChewieController(
                          videoPlayerController: value.controller,
                          autoPlay: true,
                          //isLive: true,
                          looping: true,
                        )));
                  } else {
                    return Row(children: [
                      const Center(child: CircularProgressIndicator()),
                      Text(snapshot.connectionState.toString())
                    ]);
                  }
                },
              )));
    }
  }
}
