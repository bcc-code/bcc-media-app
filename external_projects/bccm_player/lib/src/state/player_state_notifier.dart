import 'dart:async';

import 'package:bccm_player/src/pigeon/playback_platform_pigeon.g.dart';
import 'package:bccm_player/src/utils/extensions.dart';
import 'package:flutter/foundation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'player_state_notifier.freezed.dart';

class PlayerStateNotifier extends StateNotifier<PlayerState> {
  final void Function()? onDispose;
  final bool keepAlive;
  late Timer positionUpdateTimer;

  PlayerStateNotifier(
      {PlayerState? player, this.onDispose, required this.keepAlive})
      : super(player ?? const PlayerState(playerId: 'unknown')) {
    positionUpdateTimer =
        Timer.periodic(const Duration(seconds: 1), updatePosition);
  }

  void updatePosition(Timer t) {
    if (!mounted) return t.cancel();
    if (state.playbackPositionMs != null &&
        state.playbackState == PlaybackState.playing) {
      // Increase by 1000 * playbackSpeed, because timer is called every 1000ms
      final newPosition =
          state.playbackPositionMs! + (1000 * state.playbackSpeed).round();
      state = state.copyWith(playbackPositionMs: newPosition);
    }
  }

  @override
  // ignore: must_call_super
  void dispose({bool? force}) {
    // prevents riverpods StateNotifierProvider from disposing it
    if (!keepAlive || force == true) {
      onDispose?.call();
      super.dispose();
    }
  }

  void setMediaItem(MediaItem? mediaItem) {
    state = state.copyWith(currentMediaItem: mediaItem);
  }

  void setPlaybackState(PlaybackState playbackState) {
    state = state.copyWith(playbackState: playbackState);
  }

  void setIsFlutterFullscreen(bool value) {
    debugPrint("setIsFlutterFullscreen: $value");
    state = state.copyWith(isFlutterFullscreen: value);
  }

  void setPlaybackPositionAndSync(int? ms) {
    debugPrint("setPlaybackPositionAndSync: $ms");
    positionUpdateTimer.cancel();
    positionUpdateTimer =
        Timer.periodic(const Duration(seconds: 1), updatePosition);
    state = state.copyWith(playbackPositionMs: ms);
  }

  void setIsInPipMode(bool isInPipMode) {
    state = state.copyWith(isInPipMode: isInPipMode);
  }

  void setIsBuffering(bool isBuffering) {
    state = state.copyWith(isBuffering: isBuffering);
  }

  void setStateFromSnapshot(PlayerStateSnapshot snapshot) {
    state = state.copyWithSnapshot(snapshot);
  }
}

@freezed
class PlayerState with _$PlayerState {
  const PlayerState._();
  const factory PlayerState({
    required String playerId,
    MediaItem? currentMediaItem,
    int? playbackPositionMs,
    @Default(1.0) double playbackSpeed,
    @Default(false) bool isNativeFullscreen,
    @Default(false) bool isFlutterFullscreen,
    @Default(PlaybackState.stopped) PlaybackState playbackState,
    @Default(false) bool isBuffering,
    @Default(false) bool isInPipMode,
  }) = _PlayerState;

  bool get isFullscreen => isNativeFullscreen || isFlutterFullscreen;

  factory PlayerState.fromPlayerStateSnapshot(PlayerStateSnapshot state) {
    return PlayerState(
      playerId: state.playerId,
      currentMediaItem: state.currentMediaItem,
      playbackPositionMs: state.playbackPositionMs?.finiteOrNull()?.round(),
      playbackSpeed: state.playbackSpeed,
      playbackState: state.playbackState,
      isBuffering: state.isBuffering,
      isNativeFullscreen: state.isFullscreen,
    );
  }
}

extension on PlayerState {
  PlayerState copyWithSnapshot(PlayerStateSnapshot snapshot) {
    return PlayerState.fromPlayerStateSnapshot(snapshot).copyWith(
      isInPipMode: isInPipMode, // not part of snapshot
      isFlutterFullscreen: isFlutterFullscreen, // not part of snapshot
    );
  }
}
