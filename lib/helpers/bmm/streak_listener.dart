import 'package:bccm_player/bccm_player.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final streakListenerProvider = NotifierProvider<StreakListener, void>(() {
  return StreakListener();
});

class StreakListener extends Notifier<void> {
  String? todaysFraKaareTrackId;
  DateTime? eligibleUntil;

  void setTodaysFraKaareTrackId(String id, DateTime until) {
    todaysFraKaareTrackId = id;
    eligibleUntil = until;
  }

  @override
  void build() {
    final player = BccmPlayerController.primary;
    onPlayerStateChanged() {
      if (todaysFraKaareTrackId == null || eligibleUntil == null) return;
      final extras = player.value.currentMediaItem?.metadata?.extras;
      if (extras == null) return;
      if (extras['type'] != 'track') return;
      if (extras['id'] != todaysFraKaareTrackId) {
        return;
      }
      if (player.value.playbackState == PlaybackState.playing) {}
    }

    player.addListener(onPlayerStateChanged);
    ref.onDispose(() {
      player.removeListener(onPlayerStateChanged);
    });
  }
}
