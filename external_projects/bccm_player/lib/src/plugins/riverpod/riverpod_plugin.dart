import 'package:bccm_player/src/playback_platform_interface.dart';
import 'package:bccm_player/src/plugins/riverpod/provider_playback_listener.dart';
import 'package:riverpod/riverpod.dart';

export 'package:bccm_player/src/plugins/riverpod/providers/player_provider.dart';

extension RiverpodX on BccmPlayerInterface {
  void addRiverpod(Ref ref) {
    // Add listener to update player states
    addPlaybackListener(RiverpodPlaybackListener(ref: ref));
  }
}
