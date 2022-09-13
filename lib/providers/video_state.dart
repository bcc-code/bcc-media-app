import 'package:bccm_player/playback_platform_pigeon.g.dart';
import 'package:riverpod/riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:collection/collection.dart'; // You have to add this manually, for some reason it cannot be added automatically

part 'video_state.freezed.dart';
/* 
final playerListProvider =
    StateNotifierProvider<PlayerListStateNotifier, PlayerListState>(
        ((ref) => PlayerListStateNotifier(ref)));

class PlayerListStateNotifier extends StateNotifier<PlayerListState> {
  Ref ref;

  PlayerListStateNotifier(Ref this.ref)
      : super(
            const PlayerListState(players: <String, StateProvider<Player>>{}));

  Future<String> newPlayer() async {
    var playerId = await ref.read(playbackApiProvider).newPlayer();
    var players = Map<String, StateProvider<Player>>.from(state.players);
    players[playerId] =
        StateProvider<Player>((ref) => Player(playerId: playerId));
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
  StateProvider<Player>? getPrimaryPlayer() {
    return players[primaryPlayerId];
  }

  const factory PlayerListState(
      {required Map<String, StateProvider<Player>> players,
      String? primaryPlayerId}) = _PlayerState;
} */

final castPlayerProvider =
    StateNotifierProvider<PlayerNotifier, Player?>((ref) {
  return PlayerNotifier(player: const Player(playerId: 'chromecast'));
});

final primaryPlayerProvider =
    StateNotifierProvider<PlayerNotifier, Player?>((ref) {
  return PlayerNotifier();
});

class PlayerNotifier extends StateNotifier<Player?> {
  PlayerNotifier({Player? player}) : super(player);

  void setState(Player? player) {
    state = player;
  }

  void setMediaItem(MediaItem? mediaItem) {
    state = state?.copyWith(currentMediaItem: mediaItem);
  }

  void setPlaybackState(PlaybackState playbackState) {
    state = state?.copyWith(playbackState: playbackState);
  }
}

@freezed
class Player with _$Player {
  const factory Player(
      {required String playerId,
      MediaItem? currentMediaItem,
      int? playbackPositionMs,
      @Default(PlaybackState.stopped) PlaybackState playbackState}) = _Player;
}

enum PlaybackState { stopped, paused, playing }
