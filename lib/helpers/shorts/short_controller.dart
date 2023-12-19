import 'dart:async';

import 'package:bccm_player/bccm_player.dart';
import 'package:brunstadtv_app/providers/graphql.dart';
import 'package:bccm_core/api.dart';
import 'package:brunstadtv_app/helpers/constants.dart';
import 'package:brunstadtv_app/helpers/debouncer.dart';
import 'package:brunstadtv_app/helpers/shorts/short_analytics.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';
import 'package:brunstadtv_app/providers/analytics.dart';
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
    player = BccmPlayerController.empty(bufferMode: BufferMode.fastStartShortForm);
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
    if (newShort.id == _short?.id) {
      debugPrint('SHRT: setting up for ${newShort.id}');
      return currentSetupFuture;
    }
    _short = newShort;
    return currentSetupFuture = _setupShort(newShort, true);
  }

  Future<void> _setupShort(Fragment$Short newShort, bool current) async {
    await playerInitFuture;
    debugPrint('SHRT: setting up for ${newShort.id}');
    final url = newShort.streams.getBestStreamUrl();
    final uri = Uri.tryParse(url);
    if (uri == null) {
      debugPrint('SHRT: invalid url: $url');
      // shorts.value.removeWhere((element) => element.id == short.id);
      return;
    }
    if (!ref.context.mounted) return;
    await player.replaceCurrentMediaItem(
      MediaItem(
        url: url,
        metadata: MediaMetadata(
          title: newShort.title,
          artist: S.of(ref.context).shortsTab,
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

  onPlayerStateChanged() {
    final s = currentShort;
    if (s == null) return;
    final progressSeconds = (player.value.playbackPositionMs ?? 0) ~/ 1000;
    if (progressSeconds != previousSeconds) {
      _progressDebouncer.run(() {
        ref.read(gqlClientProvider).mutate$setShortProgress(
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
  }

  void dispose() {
    _disposed = true;
    player.removeListener(onPlayerStateChanged);
    player.dispose();
    _texture?.dispose();
    _analyticsListener.dispose();
  }
}
