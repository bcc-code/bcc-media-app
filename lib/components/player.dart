import 'package:better_player/better_player.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../states/betterplayer_state.dart';
import '../states/videoplayer_state.dart';

enum PlayerType { betterPlayer, videoPlayer, native }

class BccmPlayer extends StatelessWidget {
  static const modalPlayer = MethodChannel('app.bcc.media/modal-player');
  final PlayerType type;

  const BccmPlayer({super.key, required this.type});

  void playVideoWeb(BuildContext context) {
    /* 
    final v = html.window.document.getElementById('videoab');
    if(v != null) {
      v.style.display='block';
      createVideoJsPlayer('videoab', Options(
        src: SrcOptions(
          src: 'https://proxy.brunstad.tv/api/vod/toplevelmanifest?playbackUrl=https%3a%2f%2fvod.brunstad.tv%2fa97a0f51-3866-46ff-8171-29d53004aeb5%2fMAGA_S01_E04_BIEX_SEQ.ism%2fmanifest(format%3dm3u8-aapl%2caudio-only%3dfalse)&token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cm46bWljcm9zb2Z0OmF6dXJlOm1lZGlhc2VydmljZXM6Y29udGVudGtleWlkZW50aWZpZXIiOiJmMjhhOTE3Ni1mMTU5LTQ3MWItYmVkZi1jYzczZDQ3NDZkYzUiLCJuYmYiOjE2NTYwNTgyMDYsImV4cCI6MTY1NjA2OTMwNiwiaXNzIjoiaHR0cHM6Ly9icnVuc3RhZC50diIsImF1ZCI6InVybjpicnVuc3RhZHR2In0.RInjNF9ZQV4Yl4lAhIv0ROS7EI7RX-rQMS3nNXPU9Vo&subs=false',
          type: 'application/x-mpegURL'
        )
      ));
    } */
  }

  void playVideoNative(BuildContext context) {
    modalPlayer.invokeMethod('open', <String, dynamic>{
        'url': 'https://proxy.brunstad.tv/api/vod/toplevelmanifest?playbackUrl=https%3a%2f%2fvod.brunstad.tv%2f51284609-2605-4da0-8895-95fe908b23fb%2fINTR_S04_E04_MAS_NOR.ism%2fmanifest(format%3dm3u8-aapl%2caudio-only%3dfalse)&token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cm46bWljcm9zb2Z0OmF6dXJlOm1lZGlhc2VydmljZXM6Y29udGVudGtleWlkZW50aWZpZXIiOiIwYTYzMjI4Yi0yNjRjLTQxNmUtODliOS00NzRhMWQ2MmJjMTYiLCJuYmYiOjE2NTY0MTExMDksImV4cCI6MTY1NjQyMjIwOSwiaXNzIjoiaHR0cHM6Ly9icnVuc3RhZC50diIsImF1ZCI6InVybjpicnVuc3RhZHR2In0.-QyoIR1bZIej6MKnUZ5R12m2Luy-a89_mE7EXgp69xM&subs=false',
      });
  }

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return Container(
          color: Colors.blueAccent,
          child: SizedBox(
            width: 100,
            height: 100,
            child: ElevatedButton(
                onPressed: () {
                  playVideoWeb(context);
                },
                child: const Text('Play')),
          ));
    }
    if (type == PlayerType.betterPlayer) {
      return Consumer<BetterPlayerState>(
          builder: ((context, value, child) => BetterPlayer(
              controller: value.controller.betterPlayerController!)));
    } else if (type == PlayerType.native) {
      return Container(
          color: Colors.blueAccent,
          child: SizedBox(
            width: 100,
            height: 100,
            child: ElevatedButton(
                onPressed: () {
                  playVideoNative(context);
                },
                child: const Text('Play')),
          ));
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
