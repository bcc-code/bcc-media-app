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

  PlayerStateNotifier _createPlayerNotifier(String playerId) {
    return PlayerStateNotifier(
      keepAlive: true,
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
