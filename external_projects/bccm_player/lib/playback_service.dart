import 'package:bccm_player/playback_platform_pigeon.g.dart';
import 'package:bccm_player/playback_service_interface.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// An implementation of [BccmPlayerPlatform] that uses method channels.
class PlaybackService extends PlaybackPlatformInterface {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('bccm_player');

  final PlaybackPlatformPigeon _pigeon = PlaybackPlatformPigeon();

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<String> newPlayer({String? url}) {
    return _pigeon.newPlayer(url);
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
