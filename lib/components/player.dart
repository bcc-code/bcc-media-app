import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../states/videoplayer_state.dart';

enum PlayerType { betterPlayer, videoPlayer, native }

class BccmPlayer extends StatefulWidget {
  static const modalPlayer = MethodChannel('app.bcc.media/player');
  final PlayerType type;
  final String url;

  const BccmPlayer(
      {super.key,
      required this.type,
      this.url =
          'https://proxy.brunstad.tv/api/vod/toplevelmanifest?playbackUrl=https%3a%2f%2fvod.brunstad.tv%2fddfa071a-1ec2-4d4d-a094-566e53451122%2fMAGA_20220605_SEQ.ism%2fmanifest(format%3dm3u8-aapl%2caudio-only%3dfalse)&token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cm46bWljcm9zb2Z0OmF6dXJlOm1lZGlhc2VydmljZXM6Y29udGVudGtleWlkZW50aWZpZXIiOiI0MTI4MGI3ZS1lMGJhLTQzNGQtOTc5My02NTY0ZjhmNTc1YTYiLCJuYmYiOjE2NTY1MTI3MzUsImV4cCI6MTY1NjUyMzgzNSwiaXNzIjoiaHR0cHM6Ly9icnVuc3RhZC50diIsImF1ZCI6InVybjpicnVuc3RhZHR2In0.5xO_d3juFjaINSz9OOZyPmcB9PODw3-PJj0205kdRxo&subs=true'});

  @override
  State<BccmPlayer> createState() => _BccmPlayerState();
  
}

class _BccmPlayerState extends State<BccmPlayer> {
  bool _hidePlayer = false;
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
    setState(() {
      _hidePlayer = true;
    });
    BccmPlayer.modalPlayer.invokeMethod('open', <String, dynamic>{
      'url': widget.url,
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
    if (widget.type == PlayerType.native) {
      return Column(
        children: [
          Container(
              color: Colors.blueAccent,
              child: SizedBox(
                width: 100,
                height: 100,
                child: ElevatedButton(
                    onPressed: () {
                      playVideoNative(context);
                    },
                    child: const Text('Play')),
              )),
          if (!_hidePlayer && Platform.isIOS)
            AspectRatio(
                aspectRatio: 16 / 9,
                child: UiKitView(
                    viewType: 'bccm-player',
                    creationParams: <String, dynamic>{
                      'url': widget.url,
                    },
                    creationParamsCodec: const StandardMessageCodec())),
          if (!_hidePlayer && Platform.isAndroid)
            Column(
              children: [
                const Text('test'),
                SizedBox(height: 100, child: AndroidNativeText(widget: widget)),
                SizedBox(
                  height: 450,
                  child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: AndroidPlayer(widget: widget)),
                ),
              ],
            )
        ],
      );
    } else {
      return Consumer<VideoPlayerState>(
          builder: ((context, value, child) => FutureBuilder(
                future: value.initializeVideoPlayerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Column(
                      children: [
                        Container(
                            color: Colors.blueAccent,
                            child: SizedBox(
                              width: 100,
                              height: 100,
                              child: ElevatedButton(
                                  onPressed: () {
                                    playVideoNative(context);
                                  },
                                  child: const Text('Play')),
                            )),
                        AspectRatio(
                            aspectRatio: value.controller.value.aspectRatio,
                            child: Chewie(
                                controller: ChewieController(
                              videoPlayerController: value.controller,
                              autoPlay: true,
                              //isLive: true,
                              looping: true,
                            ))),
                      ],
                    );
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

class AndroidPlayer extends StatelessWidget {
  const AndroidPlayer({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final BccmPlayer widget;

  @override
  Widget build(BuildContext context) {
    return PlatformViewLink(
    viewType: 'bccm-player',
    surfaceFactory:
        (context, controller) {
      return AndroidViewSurface(
        controller: controller as AndroidViewController,
        gestureRecognizers: const <Factory<OneSequenceGestureRecognizer>>{},
        hitTestBehavior: PlatformViewHitTestBehavior.opaque,
      );
    },
    onCreatePlatformView: (params) {
      return PlatformViewsService.initExpensiveAndroidView(
        id: params.id,
        viewType: 'bccm-player',
        layoutDirection: TextDirection.ltr,
        creationParams: <String, dynamic>{
          'url': widget.url,
        },
        creationParamsCodec: const StandardMessageCodec(),
        onFocus: () {
          params.onFocusChanged(true);
        },
      )
        ..addOnPlatformViewCreatedListener(params.onPlatformViewCreated)
        ..create();
    },
  );
  }
}


class AndroidNativeText extends StatelessWidget {
  const AndroidNativeText({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final BccmPlayer widget;

  @override
  Widget build(BuildContext context) {
    return PlatformViewLink(
    viewType: 'bccm-test',
    surfaceFactory:
        (context, controller) {
      return AndroidViewSurface(
        controller: controller as AndroidViewController,
        gestureRecognizers: const <Factory<OneSequenceGestureRecognizer>>{},
        hitTestBehavior: PlatformViewHitTestBehavior.opaque,
      );
    },
    onCreatePlatformView: (params) {
      return PlatformViewsService.initSurfaceAndroidView(
        id: params.id,
        viewType: 'bccm-test',
        layoutDirection: TextDirection.ltr,
        creationParams: <String, dynamic>{
          'text': widget.url,
        },
        creationParamsCodec: const StandardMessageCodec(),
        onFocus: () {
          params.onFocusChanged(true);
        },
      )
        ..addOnPlatformViewCreatedListener(params.onPlatformViewCreated)
        ..create();
    },
  );
  }
}
