import 'package:flutter/material.dart';

import 'player_state_notifier.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';

part 'plugin_state_notifier.freezed.dart';

class PlayerPluginStateNotifier extends StateNotifier<PlayerPluginState> {
  final bool keepAlive;
  PlayerPluginStateNotifier({required this.keepAlive})
      : super(
          const PlayerPluginState(
            primaryPlayerId: null,
            players: {},
          ),
        );

  @override
  // ignore: must_call_super
  void dispose({bool? force}) {
    // prevents riverpods StateNotifierProvider from disposing it
    if (!keepAlive || force == true) {
      super.dispose();
    }
  }

  PlayerStateNotifier? getPlayer(String playerId) {
    return state.players[playerId];
  }

  void setPrimaryPlayer(String playerId) {
    state = state.copyWith(primaryPlayerId: playerId);
  }

  void removePlayer(String playerId) {
    debugPrint('removing playerId: $playerId');
    final player = state.players[playerId];
    if (player != null) {
      state = state.copyWith(players: {...state.players}..remove(playerId));
      player.dispose(force: true);
    }
  }

  PlayerStateNotifier _createPlayerNotifier(PlayerState playerState) {
    return PlayerStateNotifier(
      keepAlive: true,
      onDispose: () => removePlayer(playerState.playerId),
      player: playerState,
    );
  }

  PlayerStateNotifier addPlayerNotifier(PlayerState playerState) {
    final existing = state.players[playerState.playerId];
    if (existing != null) {
      return existing;
    }
    final notifier = _createPlayerNotifier(playerState);
    Future.delayed(Duration.zero, () {
      if (mounted) {
        state = state.copyWith(
          players: {...state.players, playerState.playerId: notifier},
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
