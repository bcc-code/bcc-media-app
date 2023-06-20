import 'dart:async';

import 'package:bccm_player/src/pigeon/playback_platform_pigeon.g.dart';
import 'package:bccm_player/src/helpers/utils/extensions.dart';
import 'package:flutter/foundation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'player_state_notifier.freezed.dart';

class PlayerStateNotifier extends StateNotifier<PlayerState> {
  final void Function()? onDispose;
  final bool keepAlive;

  PlayerStateNotifier({PlayerState? player, this.onDispose, required this.keepAlive}) : super(player ?? const PlayerState(playerId: 'unknown')) {
    Timer.periodic(const Duration(seconds: 1), (Timer t) {
      if (!mounted) return t.cancel();
      if (state.playbackPositionMs != null && state.playbackState == PlaybackState.playing) {
        state = state.copyWith(playbackPositionMs: state.playbackPositionMs! + 1000);
      }
    });
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

  void setPlaybackPosition(int? ms) {
    state = state.copyWith(playbackPositionMs: ms);
  }

  void setIsInPipMode(bool isInPipMode) {
    state = state.copyWith(isInPipMode: isInPipMode);
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
    @Default(false) bool isNativeFullscreen,
    @Default(false) bool isFlutterFullscreen,
    @Default(PlaybackState.stopped) PlaybackState playbackState,
    @Default(false) bool isInPipMode,
  }) = _PlayerState;

  bool get isFullscreen => isNativeFullscreen || isFlutterFullscreen;

  factory PlayerState.fromPlayerStateSnapshot(PlayerStateSnapshot state) {
    return PlayerState(
      playerId: state.playerId,
      currentMediaItem: state.currentMediaItem,
      playbackPositionMs: state.playbackPositionMs?.finiteOrNull()?.round(),
      playbackState: state.playbackState,
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
