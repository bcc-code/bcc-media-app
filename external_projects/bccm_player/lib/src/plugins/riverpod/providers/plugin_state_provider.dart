import 'package:riverpod/riverpod.dart';
import '../../../../bccm_player.dart';

final pluginStateProvider = StateNotifierProvider<PlayerPluginStateNotifier, PlayerPluginState>((ref) {
  return BccmPlayerInterface.instance.stateNotifier;
});
