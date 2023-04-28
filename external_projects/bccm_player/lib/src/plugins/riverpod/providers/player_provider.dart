import 'package:riverpod/riverpod.dart';
import '../../../../bccm_player.dart';
import 'plugin_state_provider.dart';

final playerProviderFor = StateNotifierProvider.family<PlayerStateNotifier, PlayerState?, String>((ref, playerId) {
  return ref.watch(
    pluginStateProvider.select((value) => value.players[playerId] ?? PlayerStateNotifier(keepAlive: false)),
  );
});

final primaryPlayerProvider = StateNotifierProvider<PlayerStateNotifier, PlayerState?>((ref) {
  final playerNotifier = ref.watch(
    pluginStateProvider.select((value) => value.players[value.primaryPlayerId]),
  );
  if (playerNotifier == null) return PlayerStateNotifier(keepAlive: false);
  return playerNotifier;
});
