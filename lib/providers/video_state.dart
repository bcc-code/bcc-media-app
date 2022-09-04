import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_state.freezed.dart';

final playerStateProvider =
    StateNotifierProvider<PlayerStateNotifier, PlayerState>(
        ((ref) => PlayerStateNotifier()));

class PlayerStateNotifier extends StateNotifier<PlayerState> {
  PlayerStateNotifier() : super(const PlayerState(players: []));

  void setPrimary(String playerId) {
    state = state.copyWith(primaryPlayerId: playerId);
  }
}

@freezed
class PlayerState with _$PlayerState {
  const factory PlayerState(
      {required List<Player> players, String? primaryPlayerId}) = _PlayerState;
}

class Player {
  String playerId;
  Player({required this.playerId});
}
