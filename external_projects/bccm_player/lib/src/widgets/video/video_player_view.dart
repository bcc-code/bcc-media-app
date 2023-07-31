// ignore_for_file: invalid_use_of_protected_member

import 'package:bccm_player/bccm_player.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../cast/cast_player.dart';
import 'package:bccm_player/src/playback_platform_interface.dart';
import 'package:flutter/material.dart';

import '../controls/default_controls.dart';
import 'video_platform_view.dart';

/// Creates a [VideoPlayerView] widget.
/// * [id] is the unique identifier for the player.
/// * [useNativeControls] will use native UI for the player. NOTE: All other options will be ignored if this is true.
/// * [resetSystemOverlays] is a callback that will be called when the player exits fullscreen.
/// * [playNextButton] is a widget that will be shown in the bottom right corner of the player.
/// * [isFullscreenPlayer] should only be used when this is used in a fullscreen context.
class VideoPlayerView extends HookWidget {
  final String id;
  final bool useNativeControls;
  final bool isFullscreenPlayer;
  final VoidCallback? resetSystemOverlays;
  final WidgetBuilder? playNextButton;

  const VideoPlayerView({
    super.key,
    required this.id,
    this.useNativeControls = true,
    this.isFullscreenPlayer = false,
    this.resetSystemOverlays,
    this.playNextButton,
  });

  @override
  Widget build(BuildContext context) {
    final isMounted = useIsMounted();
    final disableLocally = useState(
      BccmPlayerInterface.instance.stateNotifier.getPlayerNotifier(id)?.state.isFlutterFullscreen == true && !isFullscreenPlayer,
    );
    useEffect(() {
      return BccmPlayerInterface.instance.stateNotifier.getPlayerNotifier(id)?.addListener((state) {
        state.isFlutterFullscreen == true && !isFullscreenPlayer ? disableLocally.value = true : disableLocally.value = false;
      });
    }, [id, isFullscreenPlayer]);

    if (id == 'chromecast') {
      return const CastPlayer();
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
      disableLocally.value = true;
      await BccmPlayerInterface.instance.enterFullscreen(
        id,
        useNativeControls: useNativeControls,
        context: context,
        resetSystemOverlays: resetSystemOverlays,
        playNextButton: playNextButton,
      );
      if (isMounted()) {
        disableLocally.value = false;
      }
    }

    Future exitFullscreen() async {
      BccmPlayerInterface.instance.exitFullscreen(id);
    }

    return _VideoWithControls(
      parent: this,
      goFullscreen: goFullscreen,
      exitFullscreen: exitFullscreen,
    );
  }
}

class _VideoWithControls extends HookWidget {
  const _VideoWithControls({
    required this.parent,
    required this.goFullscreen,
    required this.exitFullscreen,
  });

  final VideoPlayerView parent;
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
          child: Builder(builder: (context) {
            return DefaultControls(
              playerId: parent.id,
              exitFullscreen: exitFullscreen,
              goFullscreen: goFullscreen,
              playNextButton: parent.playNextButton,
            );
          }),
        ),
      ],
    );
  }
}
