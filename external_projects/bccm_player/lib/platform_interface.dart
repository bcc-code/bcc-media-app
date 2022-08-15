import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'bccm_player_method_channel.dart';

abstract class BccmPlayerPlatform extends PlatformInterface {
  /// Constructs a BccmPlayerPlatform.
  BccmPlayerPlatform() : super(token: _token);

  static final Object _token = Object();

  static BccmPlayerPlatform _instance = MethodChannelBccmPlayer();

  /// The default instance of [BccmPlayerPlatform] to use.
  ///
  /// Defaults to [MethodChannelBccmPlayer].
  static BccmPlayerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [BccmPlayerPlatform] when
  /// they register themselves.
  static set instance(BccmPlayerPlatform instance) {
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
