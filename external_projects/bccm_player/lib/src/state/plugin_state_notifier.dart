import 'package:flutter/material.dart';

import 'player_state_notifier.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';

part 'plugin_state_notifier.freezed.dart';

class PlayerPluginStateNotifier extends StateNotifier<PlayerPluginState> {
  PlayerPluginStateNotifier()
      : super(
          const PlayerPluginState(
            primaryPlayerId: null,
            players: {},
          ),
        );

  void setPrimaryPlayer(String playerId) {
    state = state.copyWith(primaryPlayerId: playerId);
  }

  void removePlayer(String playerId) {
    debugPrint('removing playerId: $playerId');
    state = state.copyWith(players: {...state.players}..remove(playerId));
  }

  PlayerStateNotifier _createPlayerNotifier(String playerId) {
    return PlayerStateNotifier(
      onDispose: () => removePlayer(playerId),
      player: PlayerState(
        playerId: playerId,
      ),
    );
  }

  PlayerStateNotifier addPlayerNotifier(String playerId) {
    final notifier = _createPlayerNotifier(playerId);
    Future.delayed(Duration.zero, () {
      if (mounted) {
        state = state.copyWith(
          players: {...state.players, playerId: notifier},
        );
      }
    });
    return notifier;
  }
}

@freezed
class PlayerPluginState with _$PlayerPluginState {
  const factory PlayerPluginState({
    required String? primaryPlayerId,
    required Map<String, PlayerStateNotifier> players,
  }) = _PlayerPluginState;
}
