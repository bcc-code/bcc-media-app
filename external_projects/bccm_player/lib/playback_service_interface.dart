import 'package:bccm_player/playback_service.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'playback_platform_pigeon.g.dart';

abstract class PlaybackPlatformInterface extends PlatformInterface {
  /// Constructs a PlaybackServiceInterface.
  PlaybackPlatformInterface() : super(token: _token);

  static final Object _token = Object();

  static PlaybackPlatformInterface _instance = PlaybackService();
  static PlaybackPlatformInterface get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PlaybackPlatformInterface] when
  /// they register themselves.
  static set instance(PlaybackPlatformInterface instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String> newPlayer({String? url}) {
    throw UnimplementedError('newPlayer() has not been implemented.');
  }

  Future<bool> setPrimary(String id) {
    throw UnimplementedError('setPrimary() has not been implemented.');
  }

  Future<void> replaceCurrentMediaItem(String playerId, MediaItem mediaItem) {
    throw UnimplementedError('setUrl() has not been implemented.');
  }

  Future<void> queueMediaItem(String playerId, MediaItem mediaItem) async {
    throw UnimplementedError('addMediaItem() has not been implemented.');
  }

  Future<ChromecastState?> getChromecastState() async {
    throw UnimplementedError('addMediaItem() has not been implemented.');
  }
}
