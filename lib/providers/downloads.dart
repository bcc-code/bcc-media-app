// downloaded videos provider

import 'package:bccm_player/bccm_player.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final downloadedVideosProvider = FutureProvider((ref) {
  return DownloaderInterface.instance.getDownloads();
});
