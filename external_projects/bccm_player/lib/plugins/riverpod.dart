import 'package:bccm_player/playback_platform_interface.dart';
import 'package:bccm_player/plugins/riverpod.dart';
import 'package:bccm_player/src/plugins/riverpod/provider_playback_listener.dart';
import 'package:riverpod/riverpod.dart';

import '../src/chromecast_events.dart';
import '../src/playback_platform_pigeon.g.dart';
export '../src/plugins/riverpod/providers/chromecast_provider.dart';
export '../src/plugins/riverpod/providers/player_provider.dart';

extension RiverpodX on PlaybackPlatformInterface {
  void addRiverpod(Ref ref) {
    // Add listener to update player states
    addPlaybackListener(RiverpodPlaybackListener(ref: ref));
    final castStartSub = chromecastEventStream()
        .where(
          (event) => event is SessionStarted || event is SessionResumed,
        )
        .listen((event) => ref.read(isCasting.notifier).state = true);
    final castStopSub = chromecastEventStream()
        .where(
          (event) => event is SessionEnded || event is SessionSuspended,
        )
        .listen((event) => ref.read(isCasting.notifier).state = false);

    var disposeCalled = false;
    ref.onDispose(() {
      disposeCalled = true;
      castStartSub.cancel();
      castStopSub.cancel();
    });

    // Get and set chromecast state
    PlaybackPlatformInterface.instance.getChromecastState().then((value) {
      if (disposeCalled) return;
      ref.read(isCasting.notifier).state = value?.connectionState == CastConnectionState.connected;
      ref.read(castPlayerProvider.notifier).setMediaItem(value?.mediaItem);
    });
  }
}
