import 'package:bccm_player/bccm_player.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../cast/cast_player.dart';
import 'package:bccm_player/src/playback_platform_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../controls/default_controls.dart';
import 'video_platform_view.dart';

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

class VideoPlayerView extends HookWidget {
  final String id;
  final bool useNativeControls;
  final bool isFullscreenPlayer;
  final VoidCallback? resetSystemOverlays;
  final bool showNextEpisodeIndicator;
  final String? nextEpisodeButtonText;
  final VoidCallback? onNextEpisodeTapped;

  const VideoPlayerView({
    super.key,
    required this.id,
    this.useNativeControls = true,
    this.isFullscreenPlayer = false,
    this.resetSystemOverlays,
    this.showNextEpisodeIndicator = false,
    this.nextEpisodeButtonText,
    this.onNextEpisodeTapped,
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
      );
      if (isMounted()) {
        disableLocally.value = false;
      }
    }

    Future exitFullscreen() async {
      if (resetSystemOverlays != null) {
        resetSystemOverlays!();
      } else {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      }
      BccmPlayerInterface.instance.stateNotifier.getPlayerNotifier(id)?.setIsFlutterFullscreen(false);
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
      debugPrint('bccm: setPreferredOrientations portraitUp');
    }

    return _VideoWithControls(
      parent: this,
      goFullscreen: goFullscreen,
      exitFullscreen: exitFullscreen,
      showNextEpisodeIndicator: showNextEpisodeIndicator,
      nextEpisodeButtonText: nextEpisodeButtonText,
      onNextEpisodeTapped: onNextEpisodeTapped,
    );
  }
}

class _VideoWithControls extends HookWidget {
  const _VideoWithControls({
    super.key,
    required this.parent,
    required this.goFullscreen,
    required this.exitFullscreen,
    this.showNextEpisodeIndicator,
    this.nextEpisodeButtonText,
    this.onNextEpisodeTapped,
  });

  final VideoPlayerView parent;
  final Future Function() goFullscreen;
  final Future Function() exitFullscreen;
  final bool? showNextEpisodeIndicator;
  final String? nextEpisodeButtonText;
  final VoidCallback? onNextEpisodeTapped;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (BccmPlayerInterface.instance.stateNotifier.getPlayerNotifier(parent.id)?.state.isFlutterFullscreen == true) {
          exitFullscreen();
        }
        return true;
      },
      child: Stack(
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
                exitFullscreen: () => Navigator.of(context).maybePop(),
                goFullscreen: goFullscreen,
                showNextEpisodeIndicator: showNextEpisodeIndicator,
                nextEpisodeButtonText: nextEpisodeButtonText,
                onNextEpisodeTapped: onNextEpisodeTapped,
              );
            }),
          ),
        ],
      ),
    );
  }
}
