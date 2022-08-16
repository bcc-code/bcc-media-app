import 'package:bccm_player/playback_service.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract class PlaybackServiceInterface extends PlatformInterface {
  /// Constructs a PlaybackServiceInterface.
  PlaybackServiceInterface() : super(token: _token);

  static final Object _token = Object();

  static PlaybackServiceInterface _instance = PlaybackService();

  /// The default instance of [PlaybackServiceInterface] to use.
  ///
  /// Defaults to [MethodChannelBccmPlayer].
  static PlaybackServiceInterface get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PlaybackServiceInterface] when
  /// they register themselves.
  static set instance(PlaybackServiceInterface instance) {
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
  Future<void> setUrl({required String playerId, required String url, bool isLive = false}) {
    throw UnimplementedError('setUrl() has not been implemented.');
  }
}
