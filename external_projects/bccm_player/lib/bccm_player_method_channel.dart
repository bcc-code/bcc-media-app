import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'platform_interface.dart';

/// An implementation of [BccmPlayerPlatform] that uses method channels.
class MethodChannelBccmPlayer extends BccmPlayerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('bccm_player');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<String> newPlayer({String? url}) async {
    final playerId = await methodChannel.invokeMethod('new_player', <String, dynamic>{
      'url': url,
    });
    return playerId;
  }

  @override
  Future<void> setUrl({required String playerId, required String url, bool isLive = false}) async {
    await methodChannel.invokeMethod('set_url', <String, dynamic>{
      'player_id': playerId,
      'url': url,
      'is_live': isLive,
    });
  }

  @override
  Future<bool> setPrimary(String id) async {
    final playerId = await methodChannel.invokeMethod('set_primary', <String, dynamic>{
      'player_id': id,
    });
    return playerId;
  }
  
}
