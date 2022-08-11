

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

enum PlayerType { betterPlayer, videoPlayer, native }

class BccmPlayer extends StatefulWidget {
  final PlayerType type;
  final String id;

  const BccmPlayer(
      {super.key,
      required this.type,
      required this.id });

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
          src: 'something',
          type: 'application/x-mpegURL'
        )
      ));
    } */
  }

  void playVideoNative(BuildContext context) {
    setState(() {
      _hidePlayer = true;
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
                    'url': widget.id,
                  },
                  creationParamsCodec: const StandardMessageCodec())),
        if (!_hidePlayer && Platform.isAndroid)
          Column(
            children: [
              const Text('test'),
              //SizedBox(height: 100, child: AndroidNativeText(widget: widget)),
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
          'player_id': widget.id,
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
