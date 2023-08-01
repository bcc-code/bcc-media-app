import 'package:bccm_player/src/pigeon/chromecast_pigeon.g.dart';
import 'package:bccm_player/src/native/root_pigeon_playback_listener.dart';
import 'package:bccm_player/src/native/chromecast_pigeon_listener.dart';
import 'package:bccm_player/src/pigeon/playback_platform_pigeon.g.dart';
import 'package:bccm_player/src/state/state_playback_listener.dart';
import 'package:bccm_player/src/widgets/video/video_player_view_fullscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wakelock/wakelock.dart';

import 'bccm_player.dart';

/// An implementation of [BccmPlayerPlatform] that uses pigeon.
class BccmPlayerNative extends BccmPlayerInterface {
  final PlaybackPlatformPigeon _pigeon = PlaybackPlatformPigeon();
  late final RootPigeonPlaybackListener _rootPlaybackListener;
  final ChromecastPigeonListener _chromecastListener = ChromecastPigeonListener();
  Future<void>? setupFuture;

  @override
  get chromecastEventStream => _chromecastListener.stream;

  @override
  get playerEventStream => _rootPlaybackListener.stream;

  @override
  Future<void> setup() async {
    return setupFuture ??= _setup();
  }

  Future<void> _setup() async {
    await _pigeon.attach();
    _rootPlaybackListener = RootPigeonPlaybackListener(this);
    _rootPlaybackListener.addListener(StatePlaybackListener(stateNotifier));
    ChromecastPigeon.setup(_chromecastListener);
    PlaybackListenerPigeon.setup(_rootPlaybackListener);
    // load primary player state
    final initialState = await getPlayerState();
    if (initialState != null) {
      stateNotifier.getOrAddPlayerNotifier(initialState.playerId).setStateFromSnapshot(initialState);
      stateNotifier.setPrimaryPlayer(initialState.playerId);
    }
  }

  @override
  Future<String> newPlayer({String? url}) async {
    final playerId = await _pigeon.newPlayer(url);
    stateNotifier.getOrAddPlayerNotifier(playerId);
    return playerId;
  }

  @override
  Future<bool> setPrimary(String id) async {
    await _pigeon.setPrimary(id);
    return true;
  }

  @override
  Future<void> replaceCurrentMediaItem(String playerId, MediaItem mediaItem, {bool? playbackPositionFromPrimary, bool? autoplay = true}) async {
    await _pigeon.replaceCurrentMediaItem(playerId, mediaItem, playbackPositionFromPrimary, autoplay);
  }

  @override
  Future<void> queueMediaItem(String playerId, MediaItem mediaItem) {
    return _pigeon.queueMediaItem(playerId, mediaItem);
  }

  @override
  Future<ChromecastState?> getChromecastState() {
    return _pigeon.getChromecastState();
  }

  @override
  Future<PlayerTracksSnapshot?> getPlayerTracks({String? playerId}) {
    return _pigeon.getTracks(playerId);
  }

  @override
  Future<PlayerStateSnapshot?> getPlayerState({String? playerId}) {
    return _pigeon.getPlayerState(playerId);
  }

  @override
  void openExpandedCastController() {
    _pigeon.openExpandedCastController();
  }

  @override
  void openCastDialog() {
    _pigeon.openCastDialog();
  }

  @override
  Future<void> addPlaybackListener(PlaybackListenerPigeon listener) async {
    _rootPlaybackListener.addListener(listener);
  }

  @override
  void play(String playerId) {
    _pigeon.play(playerId);
  }

  @override
  Future<void> seekTo(String playerId, double positionMs) {
    return _pigeon.seekTo(playerId, positionMs);
  }

  @override
  void pause(String playerId) {
    _pigeon.pause(playerId);
  }

  @override
  void stop(String playerId, bool reset) {
    _pigeon.stop(playerId, reset);
  }

  @override
  Future<void> setSelectedTrack(String playerId, TrackType type, String? trackId) {
    return _pigeon.setSelectedTrack(playerId, type, trackId);
  }

  @override
  Future<void> setPlaybackSpeed(String playerId, double speed) {
    return _pigeon.setPlaybackSpeed(playerId, speed);
  }

  @override
  void exitFullscreen(String playerId) {
    if (currentFullscreenNavigator != null) {
      currentFullscreenNavigator?.maybePop();
    } else {
      _pigeon.exitFullscreen(playerId);
    }
  }

  NavigatorState? currentFullscreenNavigator;
  @override
  Future enterFullscreen(
    String playerId, {
    bool? useNativeControls = true,
    BuildContext? context,
    void Function()? resetSystemOverlays,
    WidgetBuilder? playNextButton,
  }) async {
    if (useNativeControls == true) {
      _pigeon.enterFullscreen(playerId);
    } else if (context == null) {
      throw ErrorDescription('enterFullscreen: context cant be null if useNativeControls is false.');
    } else {
      Wakelock.enable();
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
      SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
      debugPrint('bccm: setPreferredOrientations landscape');

      stateNotifier.getPlayerNotifier(playerId)?.setIsFlutterFullscreen(true);
      currentFullscreenNavigator = Navigator.of(context, rootNavigator: true);
      await Navigator.of(context, rootNavigator: true).push(
        PageRouteBuilder(
          pageBuilder: (context, aAnim, bAnim) => VideoPlayerViewFullscreen(
            playerId: playerId,
            playNextButton: playNextButton,
          ),
          transitionsBuilder: (context, aAnim, bAnim, child) => FadeTransition(
            opacity: aAnim,
            child: child,
          ),
          fullscreenDialog: true,
        ),
      );

      if (resetSystemOverlays != null) {
        resetSystemOverlays();
      } else {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      }

      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
      debugPrint('bccm: setPreferredOrientations portraitUp');

      stateNotifier.getPlayerNotifier(playerId)?.setIsFlutterFullscreen(false);
      Wakelock.disable();
    }
  }

  @override
  Future setNpawConfig(NpawConfig? config) {
    return _pigeon.setNpawConfig(config);
  }

  @override
  void setAppConfig(AppConfig? config) {
    _pigeon.setAppConfig(config);
  }

  @override
  void setPlayerViewVisibility(int viewId, bool visible) {
    _pigeon.setPlayerViewVisibility(viewId, visible);
  }
}
