import 'package:bccm_player/playback_platform_pigeon.g.dart';
import 'package:flutter/material.dart';
import 'package:my_app/providers/playback_api.dart';
import 'package:riverpod/riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:collection/collection.dart'; // You have to add this manually, for some reason it cannot be added automatically

part 'video_state.freezed.dart';

final playerListProvider =
    StateNotifierProvider<PlayerListStateNotifier, PlayerListState>(
        ((ref) => PlayerListStateNotifier(ref)));

class PlayerListStateNotifier extends StateNotifier<PlayerListState> {
  Ref ref;

  PlayerListStateNotifier(Ref this.ref)
      : super(const PlayerListState(players: <String, Provider<Player>>{}));

  Future<String> newPlayer() async {
    var playerId = await ref.read(playbackApiProvider).newPlayer();
    var players = Map<String, Provider<Player>>.from(state.players);
    players[playerId] = Provider<Player>((ref) => Player(playerId: playerId));
    state = state.copyWith(players: players);
    return playerId;
  }

  void setPrimary(String playerId) {
    state = state.copyWith(primaryPlayerId: playerId);
  }
}

@freezed
class PlayerListState with _$PlayerListState {
  const PlayerListState._();
  Provider<Player>? getPrimaryPlayer() {
    return players[primaryPlayerId];
  }

  const factory PlayerListState(
      {required Map<String, Provider<Player>> players,
      String? primaryPlayerId}) = _PlayerState;
}

class Player {
  String playerId;
  MediaItem? currentMediaItem;
  Player({required this.playerId, this.currentMediaItem});
}
