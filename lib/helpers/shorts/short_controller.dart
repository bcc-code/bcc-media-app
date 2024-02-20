import 'dart:async';

import 'package:bccm_player/bccm_player.dart';
import 'package:bccm_core/platform.dart';
import 'package:brunstadtv_app/helpers/constants.dart';
import 'package:bccm_core/bccm_core.dart';
import 'package:brunstadtv_app/helpers/shorts/short_analytics.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';
import 'package:brunstadtv_app/providers/feature_flags.dart';
import 'package:brunstadtv_app/providers/playback_service.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:universal_io/io.dart';

class ShortController {
  late final BccmPlayerController player;
  late final ShortAnalyticsListener _analyticsListener;
  final WidgetRef ref;
  final _progressDebouncer = Debouncer(milliseconds: 1000);
  int previousSeconds = 0;

  late Future<void> playerInitFuture;
  Future<void>? currentSetupFuture;
  Fragment$Short? _short;
  Fragment$Short? get currentShort => _short;
  BccmTexture? _texture;
  bool _disposed = false;
  bool muted = false;

  ShortController(this.ref) {
    final disableNpaw = ref.read(featureFlagsProvider).disableNpawShorts;
    debugPrint('SHRT: disableNpaw: $disableNpaw');
    player = BccmPlayerController.empty(bufferMode: BufferMode.fastStartShortForm, disableNpaw: disableNpaw);
    playerInitFuture = player.initialize();
    playerInitFuture.then((_) {
      player.setMixWithOthers(true);
      player.setRepeatMode(RepeatMode.one);
      if (!Platform.isAndroid) return;
      player.switchToVideoTexture().then((t) {
        _texture = t;
      });
    });
    _analyticsListener = ShortAnalyticsListener(this, ref);
    player.addListener(onPlayerStateChanged);
  }

  Future<void> setupShort(Fragment$Short newShort, bool current) async {
    if (newShort.id == _short?.id && currentSetupFuture != null) {
      return currentSetupFuture;
    }
    _short = newShort;
    final future = currentSetupFuture = _setupShort(newShort);
    future.then((_) {
      if (future == currentSetupFuture) {
        currentSetupFuture = null;
      }
    });
    return future;
  }

  Fragment$BasicStream? _getStream(List<Fragment$BasicStream> streams) {
    final stream = streams.getBestStream();
    final uri = Uri.tryParse(stream.url);
    if (uri == null) {
      debugPrint('SHRT: invalid url: ${stream.url}');
      return null;
    }
    return stream;
  }

  Future<void> _setupShort(Fragment$Short newShort, {bool? forceRefetchUrl}) async {
    await playerInitFuture;
    debugPrint('SHRT: setting up for ${newShort.id}');
    var stream = _getStream(newShort.streams);
    if (stream == null) return;
    final expiresAt = DateTime.tryParse(stream.expiresAt);
    if (forceRefetchUrl == true || expiresAt != null && expiresAt.isBefore(DateTime.now().add(const Duration(minutes: 30)))) {
      final result = await ref
          .read(bccmGraphQLProvider)
          .query$getShortStreams(Options$Query$getShortStreams(variables: Variables$Query$getShortStreams(id: newShort.id)));
      final streams = result.parsedData?.short.streams;
      if (streams != null) {
        stream = _getStream(streams);
      }
    }
    if (stream == null) return;

    final context = ref.context;
    if (!context.mounted) return;
    await player.replaceCurrentMediaItem(
      MediaItem(
        url: stream.url,
        metadata: MediaMetadata(
          title: newShort.title,
          artist: S.of(context).shortsTab,
          extras: {
            MetadataExtraConstants.shortId: newShort.id,
            'npaw.content.id': newShort.id,
            'npaw.content.type': 'short',
          },
        ),
      ),
      autoplay: false,
    );
    debugPrint('${player.value.playerId} done with replaceCurrentMediaItem');
    if (_disposed) return;
    player.setVolume(muted ? 0 : 1);
  }

  int retries = 0;
  onPlayerStateChanged() {
    final s = currentShort;
    if (s == null) return;
    final progressSeconds = (player.value.playbackPositionMs ?? 0) ~/ 1000;
    if (progressSeconds != previousSeconds) {
      _progressDebouncer.run(() {
        ref.read(bccmGraphQLProvider).mutate$setShortProgress(
              Options$Mutation$setShortProgress(
                variables: Variables$Mutation$setShortProgress(
                  id: s.id,
                  progress: progressSeconds.toDouble(),
                ),
              ),
            );
      });
      ref.read(analyticsProvider).heyJustHereToTellYouIBelieveTheSessionIsStillAlive();
    }

    previousSeconds = progressSeconds;

    if (player.value.error != null && currentSetupFuture == null) {
      debugPrint('SHRT: player error: ${player.value.error}');
      if (retries > 3) {
        debugPrint('SHRT: failed to play short ${s.id} after 3 retries. Player error: ${player.value.error}');
        return;
      }
      currentSetupFuture = _setupShort(s, forceRefetchUrl: true);
      retries++;
    }
  }

  void dispose() {
    _disposed = true;
    player.removeListener(onPlayerStateChanged);
    player.dispose();
    _texture?.dispose();
    _analyticsListener.dispose();
  }
}
