import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'bccm_player_platform_interface.dart';

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
}
