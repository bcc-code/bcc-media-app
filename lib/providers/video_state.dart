import 'dart:async';

import 'package:bccm_player/playback_platform_pigeon.g.dart';
import 'package:riverpod/riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_state.freezed.dart';

StateNotifierProvider<PlayerNotifier, Player?>? getPlayerProvider(Ref ref, String playerId) {
  // TODO: proper list etc
  if (playerId == 'chromecast') {
    return castPlayerProvider;
  } else if (playerId == ref.read(primaryPlayerProvider)?.playerId) {
    return primaryPlayerProvider;
  } else {
    return null;
  }
}

final castPlayerProvider = StateNotifierProvider<PlayerNotifier, Player?>((ref) {
  return PlayerNotifier(player: const Player(playerId: 'chromecast'));
});

final primaryPlayerProvider = StateNotifierProvider<PlayerNotifier, Player?>((ref) {
  return PlayerNotifier();
});

class PlayerNotifier extends StateNotifier<Player?> {
  PlayerNotifier({Player? player}) : super(player) {
    const oneSec = Duration(seconds: 1);
    Timer.periodic(oneSec, (Timer t) {
      final s = state;
      if (s != null && s.playbackPositionMs != null && s.playbackState == PlaybackState.playing) {
        state = state?.copyWith(playbackPositionMs: s.playbackPositionMs! + 1000);
      }
    });
  }

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
