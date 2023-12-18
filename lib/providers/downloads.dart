// downloaded videos provider

import 'dart:async';

import 'package:bccm_player/bccm_player.dart';
import 'package:brunstadtv_app/api/brunstadtv.dart';
import 'package:brunstadtv_app/models/offline/download_additional_data.dart';
import 'package:bccm_core/bccm_core.dart';
import 'package:brunstadtv_app/providers/auth.dart';
import 'package:brunstadtv_app/providers/availability.dart';
import 'package:brunstadtv_app/providers/connectivity.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'feature_flags.dart';

final downloadsEnabledProvider = Provider<bool>((ref) {
  return ref.watch(featureFlagsProvider.select((value) => value.download)) && ref.watch(authStateProvider.select((value) => !value.guestMode));
});

final downloadsProvider = AsyncNotifierProvider<DownloadsNotifier, List<Download>>(() {
  return DownloadsNotifier();
});

class DownloadsNotifier extends AsyncNotifier<List<Download>> {
  DownloadsNotifier() : super();

  Map<String, bool> recentlyRemoved = {};

  Future<void> removeDownload(String key) async {
    if (recentlyRemoved[key] == true) {
      print('Already removing $key');
      return;
    }
    recentlyRemoved[key] = true;
    try {
      await DownloaderInterface.instance.removeDownload(key);
    } catch (_) {
      recentlyRemoved.remove(key);
      rethrow;
    }
  }

  void _onDownloadRemoved(DownloadRemovedEvent event) {
    if (state.value == null) return;
    final existingIndex = state.value!.indexWhere((element) => element.key == event.key);
    if (existingIndex == -1) return;
    state = AsyncValue.data(state.value!..removeAt(existingIndex));
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

  void expiryCheck() {
    for (final Download download in state.valueOrNull ?? []) {
      final skipAvailabilityCheck = ref.read(isOfflineProvider) || ref.read(authStateProvider).guestMode;
      final episodeId = download.config.typedAdditionalData.episodeId;
      final availability = episodeId == null || skipAvailabilityCheck ? null : ref.read(episodeAvailabilityProvider(episodeId)).valueOrNull;
      final expiresAt = getEarliestNullableDateTime([
        download.config.typedAdditionalData.expiresAt,
        availability?.availableTo,
      ]);
      if (availability?.errorCode == ApiErrorCodes.noAccess ||
          availability?.errorCode == ApiErrorCodes.notPublished ||
          expiresAt != null && expiresAt.isBefore(DateTime.now())) {
        removeDownload(download.key);
      }
    }
  }

  void refreshAvailability() {
    if (ref.read(isOfflineProvider)) return;
    for (final Download download in state.valueOrNull ?? []) {
      if (recentlyRemoved[download.key] == true) continue;
      final episodeId = download.config.typedAdditionalData.episodeId;
      if (episodeId == null) continue;
      ref.invalidate(episodeAvailabilityProvider(episodeId));
    }
  }

  @override
  Future<List<Download>> build() async {
    if (ref.watch(authStateProvider.select((value) => value.guestMode))) {
      return [];
    }
    final statusSub = DownloaderInterface.instance.events.statusChanged.listen(_onStatusChanged);
    final removedSub = DownloaderInterface.instance.events.downloadRemoved.listen(_onDownloadRemoved);
    final failedSub = DownloaderInterface.instance.events.downloadFailed.listen(_onDownloadFailed);

    final availabilityRefreshTimer = Timer.periodic(const Duration(minutes: 1), (_) {
      expiryCheck();
      refreshAvailability();
    });

    ref.onDispose(() {
      statusSub.cancel();
      removedSub.cancel();
      failedSub.cancel();
      availabilityRefreshTimer.cancel();
    });

    return DownloaderInterface.instance.getDownloads();
  }

  Future<Download> startDownload(DownloadConfig downloadConfig) {
    return DownloaderInterface.instance.startDownload(downloadConfig);
  }

  Future<Download> retryDownload(String key) async {
    if (state.value == null) return Future.error('State is null');
    final oldDownload = state.value!.firstWhere((element) => element.key == key);
    final newDownload = await DownloaderInterface.instance.startDownload(oldDownload.config);
    removeDownload(oldDownload.key);

    return newDownload;
  }
}
