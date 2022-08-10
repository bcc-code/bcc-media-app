

import 'platform_interface.dart';

class PlaybackService {
  Future<String?> getPlatformVersion() {
    return BccmPlayerPlatform.instance.getPlatformVersion();
  }
}