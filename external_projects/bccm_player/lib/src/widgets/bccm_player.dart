import 'package:universal_io/io.dart';

import './bccm_cast_player.dart';
import 'package:bccm_player/src/playback_platform_interface.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class BccmPlayer extends StatelessWidget {
  final String id;

  const BccmPlayer({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    if (id == 'chromecast') {
      return const BccmCastPlayer();
    }

    Widget getPlatformSpecificPlayer() {
      if (kIsWeb) {
        return HtmlElementView(viewType: 'bccm-player-$id');
      } else if (Platform.isAndroid) {
        return _AndroidPlayer(id: id);
      } else if (Platform.isIOS) {
        return _IOSPlayer(id: id);
      }
      return const SizedBox.shrink();
    }

    return AspectRatio(
      aspectRatio: 16 / 9,
      child: getPlatformSpecificPlayer(),
    );
  }
}

class _IOSPlayer extends StatelessWidget {
  const _IOSPlayer({
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        BccmPlayerInterface.instance.play(id);
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
          'player_id': id,
        },
        creationParamsCodec: const StandardMessageCodec(),
      ),
    );
  }
}

class _AndroidPlayer extends StatelessWidget {
  const _AndroidPlayer({
    Key? key,
    required this.id,
  }) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context) {
    return PlatformViewLink(
      viewType: 'bccm-player',
      surfaceFactory: (context, controller) {
        debugPrint("viewId ${controller.viewId}");
        return AndroidViewSurface(
          controller: controller as AndroidViewController,
          hitTestBehavior: PlatformViewHitTestBehavior.opaque,
          gestureRecognizers: {
            Factory<TapGestureRecognizer>(() => TapGestureRecognizer()),
            Factory<HorizontalDragGestureRecognizer>(() => HorizontalDragGestureRecognizer()),
          },
        );
      },
      onCreatePlatformView: (params) {
        var controller = PlatformViewsService.initExpensiveAndroidView(
          id: params.id,
          viewType: 'bccm-player',
          layoutDirection: TextDirection.ltr,
          creationParams: <String, dynamic>{
            'player_id': id,
          },
          creationParamsCodec: const StandardMessageCodec(),
          onFocus: () {
            params.onFocusChanged(true);
          },
        );
        controller
          ..addOnPlatformViewCreatedListener((val) {
            params.onPlatformViewCreated(val);
          })
          ..create();
        return controller;
      },
    );
  }
}
