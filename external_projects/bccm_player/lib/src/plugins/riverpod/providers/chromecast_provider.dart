import 'dart:async';

import 'package:riverpod/riverpod.dart';

import '../../../playback_platform_interface.dart';
import '../../../native/chromecast_events.dart';

final chromecastEventStreamProvider = Provider<Stream<ChromecastEvent>>((ref) {
  return BccmPlayerInterface.instance.chromecastEventStream();
});
