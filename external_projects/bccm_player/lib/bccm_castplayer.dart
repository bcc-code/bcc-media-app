import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class BccmCastPlayer extends StatefulWidget {
  const BccmCastPlayer({super.key});

  @override
  State<BccmCastPlayer> createState() => _BccmPlayerState();
}

class _BccmPlayerState extends State<BccmCastPlayer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (Platform.isIOS)
          AspectRatio(
              aspectRatio: 16 / 9,
              child: UiKitView(
                  viewType: 'bccm-cast-player',
                  creationParamsCodec: const StandardMessageCodec())),
        if (Platform.isAndroid)
          Column(
            children: [
              const Text('test'),
              //SizedBox(height: 100, child: AndroidNativeText(widget: widget)),
              AspectRatio(
                  aspectRatio: 16 / 9,
                  child: AndroidCastPlayer(widget: widget)),
            ],
          )
      ],
    );
  }
}

class AndroidCastPlayer extends StatelessWidget {
  const AndroidCastPlayer({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final BccmCastPlayer widget;

  @override
  Widget build(BuildContext context) {
    return PlatformViewLink(
      viewType: 'bccm-cast-player',
      surfaceFactory: (context, controller) {
        return AndroidViewSurface(
          controller: controller as AndroidViewController,
          gestureRecognizers: const <Factory<OneSequenceGestureRecognizer>>{},
          hitTestBehavior: PlatformViewHitTestBehavior.opaque,
        );
      },
      onCreatePlatformView: (params) {
        return PlatformViewsService.initExpensiveAndroidView(
          id: params.id,
          viewType: 'bccm-cast-player',
          layoutDirection: TextDirection.ltr,
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
