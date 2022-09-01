import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

final playerStateProvider =
    StateNotifierProvider<PlayerStateNotifier, PlayerState>(
        ((ref) => PlayerStateNotifier()));

class PlayerStateNotifier extends StateNotifier<PlayerState> {
  PlayerStateNotifier() : super(const PlayerState(players: []));
}

@immutable
class PlayerState {
  final List<Player> players;
  const PlayerState({required this.players});
}

class Player {
  String playerId;
  Player({required this.playerId});
}
