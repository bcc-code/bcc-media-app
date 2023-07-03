import 'package:bccm_player/src/pigeon/playback_platform_pigeon.g.dart';
import 'package:bccm_player/plugins/riverpod.dart';
import 'package:riverpod/riverpod.dart';
import '../../utils/debouncer.dart';
import '../../utils/extensions.dart';
import 'bccm_api.dart';

class BccmPlaybackListener {
  Ref ref;
  final progressDebouncer = Debouncer(milliseconds: 1000);
  final Provider<BccmApi> apiProvider;

  BccmPlaybackListener({required this.ref, required this.apiProvider}) {
    ref.listen(playerEventRawStreamProvider, (event, d) {
      switch (event.runtimeType) {
        case PositionDiscontinuityEvent:
          onPositionDiscontinuity(event as PositionDiscontinuityEvent);
          break;
        case PlayerStateUpdateEvent:
          onPlayerStateUpdate(event as PlayerStateUpdateEvent);
          break;
      }
    });
  }

  void onPositionDiscontinuity(PositionDiscontinuityEvent event) {
    var player = ref.read(playerProviderFor(event.playerId));
    _updateProgress(
      episodeId: player?.currentMediaItem?.metadata?.extras?['id']?.asOrNull<String>(),
      positionMs: event.playbackPositionMs?.finiteOrNull()?.round(),
    );
  }

  void onPlayerStateUpdate(PlayerStateUpdateEvent event) {
    if (event.snapshot.playbackState != PlaybackState.playing) return;
    _updateProgress(
      episodeId: event.snapshot.currentMediaItem?.metadata?.extras?['id']?.asOrNull<String>(),
      positionMs: event.snapshot.playbackPositionMs?.finiteOrNull()?.round(),
    );
  }

  void _updateProgress({required String? episodeId, required int? positionMs}) {
    if (episodeId == null || positionMs == null) return;
    final positionSeconds = positionMs / 1000;
    progressDebouncer.run(() => ref.read(apiProvider).updateProgress(episodeId: episodeId, progress: positionSeconds));
  }
}
