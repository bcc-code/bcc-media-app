import '../../../state/player_state_notifier.dart';
import 'package:bccm_player/src/plugins/riverpod/providers/plugin_state_provider.dart';
import 'package:riverpod/riverpod.dart';

final playerProviderFor = StateNotifierProvider.family<PlayerStateNotifier, PlayerState?, String>((ref, playerId) {
  final pluginStateNotifier = ref.read(pluginStateProvider.notifier);
  return ref.watch(pluginStateProvider.select((value) => value.players[playerId] ?? pluginStateNotifier.addPlayerNotifier(playerId)));
});

final castPlayerProvider = StateNotifierProvider<PlayerStateNotifier, PlayerState?>((ref) {
  final provider = playerProviderFor('chromecast');
  return ref.watch(provider.notifier);
});

final primaryPlayerProvider = StateNotifierProvider<PlayerStateNotifier, PlayerState?>((ref) {
  final playerId = ref.watch(pluginStateProvider.select((value) => value.primaryPlayerId));
  if (playerId == null) return PlayerStateNotifier();
  return ref.watch(playerProviderFor(playerId).notifier);
});
