import 'dart:io';

import 'package:bccm_player/playback_service_interface.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class BccmCastPlayer extends StatefulWidget {
  const BccmCastPlayer({super.key});

  @override
  State<BccmCastPlayer> createState() => _BccmPlayerState();
}

class _BccmPlayerState extends State<BccmCastPlayer> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        PlaybackPlatformInterface.instance.openExpandedCastController();
      },
      splashColor: Colors.transparent,
      child: ClipRect(
        child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
              decoration:
                  const BoxDecoration(color: Color.fromARGB(255, 29, 40, 56)),
              child: SvgPicture.asset('assets/images/chromecast_bg.svg',
                  fit: BoxFit.cover,
                  package: 'bccm_player',
                  semanticsLabel: 'Casting'),
            )),
      ),
    );
    return Column(
      children: [
        if (Platform.isIOS)
          InkWell(
            onTap: () {
              PlaybackPlatformInterface.instance.openExpandedCastController();
            },
            splashColor: Colors.transparent,
            child: ClipRect(
              child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 29, 40, 56)),
                    child: SvgPicture.asset('assets/images/chromecast_bg.svg',
                        fit: BoxFit.cover,
                        package: 'bccm_player',
                        semanticsLabel: 'Casting'),
                  )),
            ),
          ),
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
