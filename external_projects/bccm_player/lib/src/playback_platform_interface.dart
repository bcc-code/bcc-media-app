import 'package:bccm_player/src/native/chromecast_events.dart';
import 'package:flutter/material.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'pigeon/playback_platform_pigeon.g.dart';
import '../bccm_player_native.dart';
import 'state/plugin_state_notifier.dart';

abstract class BccmPlayerInterface extends PlatformInterface {
  /// Constructs a PlaybackServiceInterface.
  BccmPlayerInterface() : super(token: _token);

  static final Object _token = Object();
  static BccmPlayerInterface _instance = BccmPlayerNative();
  static BccmPlayerInterface get instance => _instance;
  static Object? playerHtmlElement;
  final PlayerPluginStateNotifier stateNotifier = PlayerPluginStateNotifier(keepAlive: true);
  Stream<ChromecastEvent> get chromecastEventStream;
  Stream<dynamic> get playerEventStream;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [BccmPlayerInterface] when
  /// they register themselves.
  static set instance(BccmPlayerInterface instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// MUST be run first
  Future<void> setup();

  Future<String> newPlayer({String? url}) {
    throw UnimplementedError('newPlayer() has not been implemented.');
  }

  Future<bool> setPrimary(String id) {
    throw UnimplementedError('setPrimary() has not been implemented.');
  }

  Future<void> replaceCurrentMediaItem(String playerId, MediaItem mediaItem, {bool? playbackPositionFromPrimary, bool? autoplay = true}) {
    throw UnimplementedError('setUrl() has not been implemented.');
  }

  Future<void> queueMediaItem(String playerId, MediaItem mediaItem) async {
    throw UnimplementedError('addMediaItem() has not been implemented.');
  }

  Future<ChromecastState?> getChromecastState() async {
    throw UnimplementedError('getChromecastState() has not been implemented.');
  }

  /// If `playerId` is null, this returns the primary player's state.
  Future<PlayerTracksSnapshot?> getPlayerTracks({String? playerId}) async {
    throw UnimplementedError('getPlayerTracks() has not been implemented.');
  }

  /// If `playerId` is null, this returns the primary player's state.
  Future<PlayerStateSnapshot?> getPlayerState({String? playerId}) async {
    throw UnimplementedError('getPlayerState() has not been implemented.');
  }

  void openExpandedCastController() {
    throw UnimplementedError('openExpandedCastController() has not been implemented.');
  }

  void openCastDialog() {
    throw UnimplementedError('openCastDialog() has not been implemented.');
  }

  Future<void> addPlaybackListener(PlaybackListenerPigeon listener) async {
    throw UnimplementedError('addPlaybackListener() has not been implemented.');
  }

  Future<void> removePlaybackListener(PlaybackListenerPigeon listener) async {
    throw UnimplementedError('removePlaybackListener() has not been implemented.');
  }

  void play(String playerId) {
    throw UnimplementedError('play() has not been implemented.');
  }

  Future<void> seekTo(String playerId, double positionMs) {
    throw UnimplementedError('play() has not been implemented.');
  }

  void pause(String playerId) {
    throw UnimplementedError('pause() has not been implemented.');
  }

  void stop(String playerId, bool reset) {
    throw UnimplementedError('stop() has not been implemented.');
  }

  Future<void> setSelectedTrack(String playerId, TrackType type, String trackId) {
    throw UnimplementedError('setSelectedTrack() has not been implemented.');
  }

  void exitFullscreen(String playerId) {
    throw UnimplementedError('exitFullscreen() has not been implemented.');
  }

  Future enterFullscreen(
    String playerId, {
    bool? useNativeControls = true,
    BuildContext? context,
    void Function()? resetSystemOverlays,
    WidgetBuilder? playNextButton,
  }) {
    throw UnimplementedError('enterFullscreen() has not been implemented.');
  }

  Future? setNpawConfig(NpawConfig? config) {
    throw UnimplementedError('setNpawConfig() has not been implemented.');
  }

  void setAppConfig(AppConfig? config) {
    throw UnimplementedError('setAppConfig() has not been implemented.');
  }

  void setPlayerViewVisibility(int viewId, bool visible) {
    throw UnimplementedError('setAppConfig() has not been implemented.');
  }
}
