import 'package:bccm_player/bccm_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:flutter/material.dart';

import 'popup_menu.dart';

class DefaultControls extends HookWidget {
  const DefaultControls({
    super.key,
    required this.playerId,
    required this.goFullscreen,
    required this.exitFullscreen,
  });

  final String playerId;
  final Future Function() goFullscreen;
  final Future Function() exitFullscreen;

  @override
  Widget build(BuildContext context) {
    final player = useState(BccmPlayerInterface.instance.stateNotifier.getPlayerNotifier(playerId)?.state);
    useEffect(() {
      void listener(PlayerState state) {
        player.value = state;
      }

      return BccmPlayerInterface.instance.stateNotifier.getPlayerNotifier(playerId)?.addListener(listener);
    });
    final currentMs = player.value?.playbackPositionMs ?? 0;
    final duration = player.value?.currentMediaItem?.metadata?.durationMs ?? player.value?.playbackPositionMs?.toDouble() ?? 1;
    debugPrint('bccm: player data: ${player.value?.toString() ?? 'no player data'}');
    final isFullscreen = player.value?.isFlutterFullscreen == true;
    void seekTo(double positionMs) {
      BccmPlayerInterface.instance.seekTo(playerId, positionMs);
    }

    final w = Container(
      alignment: Alignment.bottomCenter,
      color: Colors.black.withOpacity(0.1),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        height: 50,
        child: Row(
          children: [
            IconButton(
              icon: Icon(
                player.value?.playbackState != PlaybackState.playing ? Icons.play_arrow : Icons.pause,
              ),
              onPressed: () {
                if (player.value?.playbackState != PlaybackState.playing) {
                  BccmPlayerInterface.instance.play(playerId);
                } else {
                  BccmPlayerInterface.instance.pause(playerId);
                }
              },
            ),
            Expanded(
              child: Slider(
                value: (currentMs.isFinite ? currentMs : 0) / (duration.isFinite && duration > 0 ? duration : 1),
                onChanged: (double value) {
                  final positionMs = value * duration;
                  seekTo(positionMs);
                },
              ),
            ),
            _SettingsWidget(),
            IconButton(
              icon: Icon(
                isFullscreen ? Icons.fullscreen_exit : Icons.fullscreen,
              ),
              onPressed: () {
                if (!isFullscreen) {
                  debugPrint('bccm: not fullscreen, so go fullscreen');
                  goFullscreen();
                } else {
                  debugPrint('bccm: is fullscreen, so exit fullscreen');
                  exitFullscreen();
                }
              },
            ),
          ],
        ),
      ),
    );

    return isFullscreen ? SafeArea(child: w) : w;
  }
}

/// An arbitrary widget that lives in a popup menu
class PopupMenuWidget extends PopupMenuEntry<Never> {
  const PopupMenuWidget({super.key, required this.height, required this.child});

  final Widget child;

  @override
  final double height;

  @override
  _PopupMenuWidgetState createState() => _PopupMenuWidgetState();

  @override
  bool represents(value) => false;
}

class _PopupMenuWidgetState extends State<PopupMenuWidget> {
  bool clicked = false;
  @override
  Widget build(BuildContext context) => widget.child;
}

class _SettingsWidget extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      offset: Offset(0, 50),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      padding: EdgeInsets.zero,
      elevation: 0,
      constraints: null,
      surfaceTintColor: Colors.transparent,
      itemBuilder: (context) => <PopupMenuEntry>[
        PopupMenuWidget(
          height: 100.0,
          child: ClipRRect(borderRadius: BorderRadius.circular(16), child: SettingsTabs()),
        ),
      ],
    );
  }
}

class SettingsTabs extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final color = PopupMenuTheme.of(context).color ?? Theme.of(context).colorScheme.surface;
    final height = useState(100.0);
    return Container(
      color: color,
      width: 150,
      height: height.value,
      child: Navigator(
        onGenerateRoute: (routeSettings) {
          // if audio route
          switch (routeSettings.name) {
            case 'audio':
              height.value = 200;
              return CupertinoPageRoute(
                builder: (context) => Container(
                  color: color,
                  height: height.value,
                  width: 150,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      ListTile(dense: true, title: Text('English', style: Theme.of(context).textTheme.labelMedium)),
                      ListTile(dense: true, title: Text('Norsk', style: Theme.of(context).textTheme.labelMedium)),
                    ],
                  ),
                ),
              );
          }
          return CupertinoPageRoute(
            builder: (context) => GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('audio');
              },
              child: Container(
                color: color,
                height: height.value,
                width: 150,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    ListTile(dense: true, title: Text('Audio language', style: Theme.of(context).textTheme.labelMedium)),
                    ListTile(dense: true, title: Text('Subtitle language', style: Theme.of(context).textTheme.labelMedium)),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
