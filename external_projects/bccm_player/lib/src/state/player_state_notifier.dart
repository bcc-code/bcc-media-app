import 'dart:async';

import 'package:bccm_player/src/pigeon/playback_platform_pigeon.g.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'player_state_notifier.freezed.dart';

class PlayerStateNotifier extends StateNotifier<PlayerState> {
  final void Function()? onDispose;

  PlayerStateNotifier({PlayerState? player, this.onDispose}) : super(player ?? const PlayerState(playerId: 'unknown')) {
    Timer.periodic(const Duration(seconds: 1), (Timer t) {
      if (!mounted) return t.cancel();
      if (state.playbackPositionMs != null && state.playbackState == PlaybackState.playing) {
        state = state.copyWith(playbackPositionMs: state.playbackPositionMs! + 1000);
      }
    });
  }

  @override
  void dispose() {
    onDispose?.call();
    super.dispose();
  }

  void setMediaItem(MediaItem? mediaItem) {
    state = state.copyWith(currentMediaItem: mediaItem);
  }

  void setPlaybackState(PlaybackState playbackState) {
    state = state.copyWith(playbackState: playbackState);
  }

  void setPlaybackPosition(int? ms) {
    state = state.copyWith(playbackPositionMs: ms);
  }

  void setIsInPipMode(bool isInPipMode) {
    state = state.copyWith(isInPipMode: isInPipMode);
  }
}

@freezed
class PlayerState with _$PlayerState {
  const factory PlayerState({
    required String playerId,
    MediaItem? currentMediaItem,
    int? playbackPositionMs,
    @Default(PlaybackState.stopped) PlaybackState playbackState,
    @Default(false) bool isInPipMode,
  }) = _PlayerState;
}

enum PlaybackState { stopped, paused, playing }
