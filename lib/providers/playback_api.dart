import 'package:bccm_player/playback_platform_pigeon.g.dart';
import 'package:bccm_player/playback_service.dart';
import 'package:bccm_player/playback_service_interface.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final playbackApiProvider = Provider<PlaybackPlatformInterface>((ref) {
  return PlaybackService();
});
