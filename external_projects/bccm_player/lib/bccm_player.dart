import 'package:universal_io/io.dart';

import 'package:bccm_player/bccm_castplayer.dart';
import 'package:bccm_player/playback_service_interface.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

enum PlayerType { betterPlayer, videoPlayer, native }

class BccmPlayer extends StatefulWidget {
  final String id;

  const BccmPlayer({super.key, required this.id});

  @override
  State<BccmPlayer> createState() => _BccmPlayerState();
}

class _BccmPlayerState extends State<BccmPlayer> {
  bool _hidePlayer = false;

  void playVideoNative(BuildContext context) {
    setState(() {
      _hidePlayer = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.id == 'chromecast') {
      return const BccmCastPlayer();
    }
    if (kIsWeb) {
      return AspectRatio(aspectRatio: 16 / 9, child: HtmlElementView(viewType: 'bccm-player'));
      return Container(color: Colors.blueAccent, child: SizedBox(width: 100, height: 100));
    }
    return Column(
      children: [
        if (!_hidePlayer && Platform.isIOS)
          AspectRatio(
              aspectRatio: 16 / 9,
              child: InkWell(
                onTap: () {
                  PlaybackPlatformInterface.instance.play(widget.id);
                },
                child: UiKitView(
                    viewType: 'bccm-player',
                    hitTestBehavior: PlatformViewHitTestBehavior.translucent,
                    gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
                      Factory<OneSequenceGestureRecognizer>(
                        () => EagerGestureRecognizer(),
                      ),
                    },
                    creationParams: <String, dynamic>{
                      'player_id': widget.id,
                    },
                    creationParamsCodec: const StandardMessageCodec()),
              )),
        if (!_hidePlayer && Platform.isAndroid)
          Column(
            children: [
              //SizedBox(height: 100, child: AndroidNativeText(widget: widget)),
              AspectRatio(aspectRatio: 16 / 9, child: AndroidPlayer(id: widget.id)),
            ],
          )
      ],
    );
  }
}

class AndroidPlayer extends StatefulWidget {
  const AndroidPlayer({
    Key? key,
    required this.id,
  }) : super(key: key);

  final String id;

  @override
  State<AndroidPlayer> createState() => _AndroidPlayerState();
}

class _AndroidPlayerState extends State<AndroidPlayer> {
  bool hide = false;
  int? viewId;
  @override
  Widget build(BuildContext context) {
    return PlatformViewLink(
      viewType: 'bccm-player',
      surfaceFactory: (context, controller) {
        debugPrint("viewId ${controller.viewId}");
        return AndroidViewSurface(
          controller: controller as AndroidViewController,
          hitTestBehavior: PlatformViewHitTestBehavior.opaque,
          gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
            Factory<OneSequenceGestureRecognizer>(
              () => EagerGestureRecognizer(),
            ),
          },
        );
      },
      onCreatePlatformView: (params) {
        var controller = PlatformViewsService.initExpensiveAndroidView(
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
        );
        controller
          ..addOnPlatformViewCreatedListener((val) {
            if (mounted) {
              setState(() {
                viewId = controller.viewId;
              });
            }

            params.onPlatformViewCreated(val);
          })
          ..create();
        return controller;
      },
    );
  }
}
