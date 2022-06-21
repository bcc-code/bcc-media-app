import 'package:chewie/chewie.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:my_app/player_state.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class BccmPlayer extends StatelessWidget {
  const BccmPlayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PlayerState>(
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
