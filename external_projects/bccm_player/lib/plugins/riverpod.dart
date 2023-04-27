import 'package:bccm_player/src/plugins/riverpod/provider_playback_listener.dart';
import 'package:riverpod/riverpod.dart';
import '../bccm_player.dart';
export '../src/plugins/riverpod/providers/chromecast_provider.dart';
export '../src/plugins/riverpod/providers/player_provider.dart';

extension RiverpodX on ProviderContainer {
  Future setupBccmPlayer(BccmPlayerInterface api) async {
    // Add listener to update player states
    api.addPlaybackListener(read(playbackListenerProvider));
  }
}
