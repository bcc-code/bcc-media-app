import 'package:bccm_player/bccm_player.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:universal_io/io.dart';

import './bccm_cast_player.dart';
import 'package:bccm_player/src/playback_platform_interface.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import 'controls/default_controls.dart';

// BccmPlayerView - Stack(Video, PlayerControls).
// Video: Platform specific uikit/android/web (includes video and subs)
// PlayerControls: Just pure controls (play/pause, seek, fullscreen)
// BccmPlayerView; On fullscreen button: push fullscreen route with BccmPlayerView - Stack(Video, Controls).

// flutter-based ui MVP:
// Fullscreen
// Play/pause
// Seek and progress
// Audio selection
// Airplay
// Next:
// Subtitle selection
// Playback speed selection

class VideoPlatformView extends StatelessWidget {
  final String id;
  final bool showControls;

  const VideoPlatformView({
    super.key,
    required this.id,
    this.showControls = true,
  });

  @override
  Widget build(BuildContext context) {
    Widget getPlatformSpecificPlayer() {
      if (kIsWeb) {
        return _WebPlayer(parent: this);
      } else if (Platform.isAndroid) {
        return _AndroidPlayer(parent: this);
      } else if (Platform.isIOS) {
        return _IOSPlayer(parent: this);
      }
      return const SizedBox.shrink();
    }

    return AspectRatio(
      aspectRatio: 16 / 9,
      child: getPlatformSpecificPlayer(),
    );
  }
}

class BccmPlayerView extends HookWidget {
  final String id;
  final bool useNativeControls;

  const BccmPlayerView({
    super.key,
    required this.id,
    this.useNativeControls = true,
  });

  @override
  Widget build(BuildContext context) {
    final isMounted = useIsMounted();
    final disableLocally = useState(false);
    if (id == 'chromecast') {
      return const BccmCastPlayer();
    }
    if (useNativeControls) {
      return VideoPlatformView(
        id: id,
        showControls: true,
      );
    }
    if (disableLocally.value) {
      return const SizedBox.shrink();
    }

    Future goFullscreen() async {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
      // set landscape
      SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);

      BccmPlayerInterface.instance.stateNotifier.getPlayerNotifier(id)?.setIsFlutterFullscreen(true);
      disableLocally.value = true;
      await Navigator.of(context, rootNavigator: true).push(
        PageRouteBuilder(
          pageBuilder: (context, aAnim, bAnim) => FullscreenPlayer(playerId: id),
          transitionsBuilder: (context, aAnim, bAnim, child) => FadeTransition(opacity: aAnim, child: child),
        ),
      );
      if (isMounted()) {
        disableLocally.value = false;
        BccmPlayerInterface.instance.stateNotifier.getPlayerNotifier(id)?.setIsFlutterFullscreen(false);
      }
    }

    Future exitFullscreen() async {
      SystemChrome.restoreSystemUIOverlays();
      await Navigator.of(context).maybePop();
      BccmPlayerInterface.instance.stateNotifier.getPlayerNotifier(id)?.setIsFlutterFullscreen(false);
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    }

    return _VideoWithControls(
      parent: this,
      goFullscreen: goFullscreen,
      exitFullscreen: exitFullscreen,
    );
  }
}

class _WebPlayer extends StatelessWidget {
  const _WebPlayer({
    required this.parent,
  });

  final VideoPlatformView parent;

  @override
  Widget build(BuildContext context) {
    return HtmlElementView(viewType: 'bccm-player-${parent.id}');
  }
}

class _IOSPlayer extends StatelessWidget {
  const _IOSPlayer({
    required this.parent,
  });

  final VideoPlatformView parent;

  @override
  Widget build(BuildContext context) {
    return UiKitView(
      viewType: 'bccm-player',
      hitTestBehavior: PlatformViewHitTestBehavior.translucent,
      gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
        Factory<OneSequenceGestureRecognizer>(
          () => EagerGestureRecognizer(),
        ),
      },
      creationParams: <String, dynamic>{
        'player_id': parent.id,
        'show_controls': parent.showControls,
      },
      creationParamsCodec: const StandardMessageCodec(),
    );
  }
}

class _AndroidPlayer extends StatelessWidget {
  const _AndroidPlayer({
    Key? key,
    required this.parent,
  }) : super(key: key);

  final VideoPlatformView parent;

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
            'player_id': parent.id,
            'show_controls': parent.showControls,
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

class FullscreenPlayer extends HookWidget {
  const FullscreenPlayer({
    super.key,
    required this.playerId,
  });

  final String playerId;

  @override
  Widget build(BuildContext context) {
    final animation = useAnimationController(duration: const Duration(milliseconds: 400));
    animation.forward();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.center,
        children: [
          // black widget that fades in
          Container(
            color: Colors.black,
          ),
          SizedBox.expand(
            child: Align(
              alignment: Alignment.center,
              child: BccmPlayerView(
                id: playerId,
                useNativeControls: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _VideoWithControls extends HookWidget {
  const _VideoWithControls({
    super.key,
    required this.parent,
    required this.goFullscreen,
    required this.exitFullscreen,
  });

  final BccmPlayerView parent;
  final Future Function() goFullscreen;
  final Future Function() exitFullscreen;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: IgnorePointer(
            ignoring: true,
            child: VideoPlatformView(
              id: parent.id,
              showControls: false,
            ),
          ),
        ),
        Positioned.fill(
          child: DefaultControls(
            playerId: parent.id,
            exitFullscreen: exitFullscreen,
            goFullscreen: goFullscreen,
          ),
        ),
      ],
    );
  }
}
