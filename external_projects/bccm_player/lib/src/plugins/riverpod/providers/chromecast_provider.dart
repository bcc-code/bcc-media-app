import 'dart:async';

import 'package:riverpod/riverpod.dart';

import '../../../../playback_platform_interface.dart';
import '../../../chromecast_events.dart';

final chromecastEventStreamProvider = Provider<Stream<ChromecastEvent>>((ref) {
  return PlaybackPlatformInterface.instance.chromecastEventStream();
});
final isCasting = StateProvider<bool>((ref) => false);
