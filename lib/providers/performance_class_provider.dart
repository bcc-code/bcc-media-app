import 'package:bccm_player/bccm_player.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final androidPerformanceClassProvider = FutureProvider((ref) {
  return BccmPlayerInterface.instance.getAndroidPerformanceClass();
});
