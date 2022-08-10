
import 'bccm_player_platform_interface.dart';

class BccmPlayer {
  Future<String?> getPlatformVersion() {
    return BccmPlayerPlatform.instance.getPlatformVersion();
  }
}
