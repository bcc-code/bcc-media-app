import 'package:bccm_player/playback_platform_mobile.dart';
import 'package:bccm_player/src/chromecast_events.dart';
import 'src/state/plugin_state_notifier.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'src/playback_platform_pigeon.g.dart';

abstract class PlaybackPlatformInterface extends PlatformInterface {
  /// Constructs a PlaybackServiceInterface.
  PlaybackPlatformInterface() : super(token: _token);

  static final Object _token = Object();

  static PlaybackPlatformInterface _instance = PlaybackPlatformMobile();
  static PlaybackPlatformInterface get instance => _instance;
  static Object? playerHtmlElement;

  final PlayerPluginStateNotifier stateNotifier = PlayerPluginStateNotifier();

  Stream<ChromecastEvent> chromecastEventStream();

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PlaybackPlatformInterface] when
  /// they register themselves.
  static set instance(PlaybackPlatformInterface instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

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

  void openExpandedCastController() {
    throw UnimplementedError('openExpandedCastController() has not been implemented.');
  }

  void openCastDialog() {
    throw UnimplementedError('openCastDialog() has not been implemented.');
  }

  Future<void> addPlaybackListener(PlaybackListenerPigeon listener) async {
    throw UnimplementedError('addPlaybackListener() has not been implemented.');
  }

  void play(String playerId) {
    throw UnimplementedError('play() has not been implemented.');
  }

  void pause(String playerId) {
    throw UnimplementedError('pause() has not been implemented.');
  }

  void stop(String playerId, bool reset) {
    throw UnimplementedError('stop() has not been implemented.');
  }

  void setNpawConfig(NpawConfig? config) {
    throw UnimplementedError('setNpawConfig() has not been implemented.');
  }

  void setAppConfig(AppConfig? config) {
    throw UnimplementedError('setAppConfig() has not been implemented.');
  }

  void setPlayerViewVisibility(int viewId, bool visible) {
    throw UnimplementedError('setAppConfig() has not been implemented.');
  }
}
