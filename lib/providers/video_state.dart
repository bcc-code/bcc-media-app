import 'package:bccm_player/playback_platform_pigeon.g.dart';
import 'package:riverpod/riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:collection/collection.dart'; // You have to add this manually, for some reason it cannot be added automatically

part 'video_state.freezed.dart';

final castPlayerProvider = StateNotifierProvider<PlayerNotifier, Player?>((ref) {
  return PlayerNotifier(player: const Player(playerId: 'chromecast'));
});

final primaryPlayerProvider = StateNotifierProvider<PlayerNotifier, Player?>((ref) {
  return PlayerNotifier();
});

class PlayerNotifier extends StateNotifier<Player?> {
  PlayerNotifier({Player? player}) : super(player);

  void setState(Player? player) {
    state = player;
  }

  void setMediaItem(MediaItem? mediaItem) {
    state = state?.copyWith(currentMediaItem: mediaItem);
  }

  void setPlaybackState(PlaybackState playbackState) {
    state = state?.copyWith(playbackState: playbackState);
  }

  void setPlaybackPosition(int? ms) {
    state = state?.copyWith(playbackPositionMs: ms);
  }

  void setIsInPipMode(bool isInPipMode) {
    state = state?.copyWith(isInPipMode: isInPipMode);
  }
}

@freezed
class Player with _$Player {
  const factory Player(
      {required String playerId,
      MediaItem? currentMediaItem,
      int? playbackPositionMs,
      @Default(PlaybackState.stopped) PlaybackState playbackState,
      @Default(false) bool isInPipMode}) = _Player;
}

enum PlaybackState { stopped, paused, playing }
