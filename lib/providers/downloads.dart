// downloaded videos provider

import 'package:bccm_player/bccm_player.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final downloadsProvider = AsyncNotifierProvider<DownloadsNotifier, List<Download>>(() {
  return DownloadsNotifier();
});

class DownloadsNotifier extends AsyncNotifier<List<Download>> {
  DownloadsNotifier() : super();

  Future<void> removeDownload(String key) async {
    await DownloaderInterface.instance.removeDownload(key);
    print('removed');
  }

  void _onDownloadRemoved(DownloadRemovedEvent event) {
    print('actually removed');
    if (state.value == null) return;
    final existingIndex = state.value!.indexWhere((element) => element.key == event.key);
    if (existingIndex == -1) return;
    state = AsyncValue.data(state.value!..removeAt(existingIndex));
    print('actually removed 2');
  }

  void _onDownloadFailed(DownloadFailedEvent event) {}

  void _onStatusChanged(DownloadChangedEvent event) {
    if (state.value == null) return;
    final existingIndex = state.value!.indexWhere((element) => element.key == event.download.key);
    if (existingIndex == -1) {
      state = AsyncValue.data(state.value!..add(event.download));
    } else {
      state = AsyncValue.data(state.value!..[existingIndex] = event.download);
    }
  }

  @override
  Future<List<Download>> build() {
    final statusSub = DownloaderInterface.instance.events.statusChanged.listen(_onStatusChanged);
    final removedSub = DownloaderInterface.instance.events.downloadRemoved.listen(_onDownloadRemoved);
    final failedSub = DownloaderInterface.instance.events.downloadFailed.listen(_onDownloadFailed);

    ref.onDispose(() {
      statusSub.cancel();
      removedSub.cancel();
      failedSub.cancel();
    });

    return DownloaderInterface.instance.getDownloads();
  }

  Future<Download> startDownload(DownloadConfig downloadConfig) {
    return DownloaderInterface.instance.startDownload(downloadConfig);
  }
}
