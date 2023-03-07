import '../../../../playback_platform_interface.dart';
import '../../../state/plugin_state_notifier.dart';
import 'package:riverpod/riverpod.dart';

final pluginStateProvider = StateNotifierProvider<PlayerPluginStateNotifier, PlayerPluginState>((ref) {
  return PlaybackPlatformInterface.instance.stateNotifier;
});
