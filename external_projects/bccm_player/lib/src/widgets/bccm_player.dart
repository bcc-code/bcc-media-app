import 'package:bccm_player/bccm_player.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:universal_io/io.dart';

import './bccm_cast_player.dart';
import 'package:bccm_player/src/playback_platform_interface.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

// BccmPlayerView - Stack(Video, PlayerControls).
// Video: Platform specific uikit/android/web (includes video and subs)
// PlayerControls: Just pure controls (play/pause, seek, fullscreen)
// BccmPlayerView; On fullscreen button: push fullscreen route with BccmPlayerView - Stack(Video, Controls).

class BccmPlayer extends StatelessWidget {
  final String id;
  final bool showControls;

  const BccmPlayer({
    super.key,
    required this.id,
    this.showControls = true,
  });

  @override
  Widget build(BuildContext context) {
    final isMounted = useIsMounted();
    if (id == 'chromecast') {
      return const BccmCastPlayer();
    }

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

    final video = getPlatformSpecificPlayer();

    Future goFullscreen() async {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
      // set landscape
      SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);

      BccmPlayerInterface.instance.stateNotifier.getPlayerNotifier(id)?.setIsFlutterFullscreen(true);
      await Navigator.of(context, rootNavigator: true).push(
        MaterialPageRoute(
          builder: (context) => FullscreenPlayer(parent: this, video: video),
        ),
      );
      if (isMounted()) {
        BccmPlayerInterface.instance.stateNotifier.getPlayerNotifier(id)?.setIsFlutterFullscreen(false);
      }
    }

    Future exitFullscreen() async {
      SystemChrome.restoreSystemUIOverlays();
      await Navigator.of(context).maybePop();
      BccmPlayerInterface.instance.stateNotifier.getPlayerNotifier(id)?.setIsFlutterFullscreen(false);
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    }

    return _CustomControls(
      parent: this,
      goFullscreen: goFullscreen,
      exitFullscreen: exitFullscreen,
      video: IgnorePointer(
        ignoring: !showControls,
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: video,
        ),
      ),
    );
  }
}

class _WebPlayer extends StatelessWidget {
  const _WebPlayer({
    required this.parent,
  });

  final BccmPlayer parent;

  @override
  Widget build(BuildContext context) {
    return HtmlElementView(viewType: 'bccm-player-${parent.id}');
  }
}

class _IOSPlayer extends StatelessWidget {
  const _IOSPlayer({
    required this.parent,
  });

  final BccmPlayer parent;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        BccmPlayerInterface.instance.play(parent.id);
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
          'player_id': parent.id,
          'show_controls': parent.showControls,
        },
        creationParamsCodec: const StandardMessageCodec(),
      ),
    );
  }
}

class _AndroidPlayer extends StatelessWidget {
  const _AndroidPlayer({
    Key? key,
    required this.parent,
  }) : super(key: key);

  final BccmPlayer parent;

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
    required this.parent,
    required this.video,
  });

  final BccmPlayer parent;
  final Widget video;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      body: Center(
        child: _CustomControls(
          parent: parent,
          goFullscreen: () async {},
          exitFullscreen: () async => await Navigator.maybeOf(context)?.maybePop(),
          video: IgnorePointer(
            ignoring: true,
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: video,
            ),
          ),
        ),
      ),
    );
  }
}

class _CustomControls extends HookWidget {
  const _CustomControls({
    required this.parent,
    required this.video,
    required this.goFullscreen,
    required this.exitFullscreen,
  });

  final BccmPlayer parent;
  final Future Function() goFullscreen;
  final Future Function() exitFullscreen;
  final Widget video;

  @override
  Widget build(BuildContext context) {
    final player = useStream(BccmPlayerInterface.instance.stateNotifier.getPlayerNotifier(parent.id)?.stream);
    final currentMs = player.data?.playbackPositionMs ?? 0;
    final duration = player.data?.currentMediaItem?.metadata?.durationMs ?? player.data?.playbackPositionMs ?? 1;
    final isFullscreen = player.data?.isFlutterFullscreen == true;
    void seekTo(double positionMs) {
      BccmPlayerInterface.instance.seekTo(parent.id, positionMs);
    }

    return Stack(
      children: [
        video,
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    player.data?.playbackState != PlaybackState.playing ? Icons.play_arrow : Icons.pause,
                  ),
                  onPressed: () {
                    if (player.data?.playbackState != PlaybackState.playing) {
                      BccmPlayerInterface.instance.play(parent.id);
                    } else {
                      BccmPlayerInterface.instance.pause(parent.id);
                    }
                  },
                ),
                Expanded(
                  child: Slider(
                    value: currentMs / duration,
                    onChanged: (double value) {
                      final positionMs = value * duration;
                      seekTo(positionMs);
                    },
                  ),
                ),
                IconButton(
                  icon: Icon(
                    isFullscreen ? Icons.fullscreen_exit : Icons.fullscreen,
                  ),
                  onPressed: () {
                    if (!isFullscreen) {
                      goFullscreen();
                    } else {
                      exitFullscreen();
                    }
                  },
                ),
                Text('Fullscreen: $isFullscreen'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
