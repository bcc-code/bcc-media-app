import '../../../state/player_state_notifier.dart';
import 'package:bccm_player/src/plugins/riverpod/providers/plugin_state_provider.dart';
import 'package:riverpod/riverpod.dart';

final playerProviderFor = StateNotifierProvider.family<PlayerStateNotifier, PlayerState?, String>((ref, playerId) {
  final pluginStateNotifier = ref.read(pluginStateProvider.notifier);
  return ref.watch(
    pluginStateProvider.select(
      (value) => value.players[playerId] ?? pluginStateNotifier.addPlayerNotifier(PlayerState(playerId: playerId)),
    ),
  );
});

final primaryPlayerProvider = StateNotifierProvider<PlayerStateNotifier, PlayerState?>((ref) {
  final playerId = ref.watch(pluginStateProvider.select((value) => value.primaryPlayerId));
  if (playerId == null) return PlayerStateNotifier(keepAlive: false);
  return ref.watch(playerProviderFor(playerId).notifier);
});
