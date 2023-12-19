import 'dart:async';
import 'dart:math';

import 'package:bccm_core/platform.dart';
import 'package:bccm_player/bccm_player.dart';
import 'package:brunstadtv_app/helpers/constants.dart';
import 'package:brunstadtv_app/helpers/shorts/short_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ShortAnalyticsListener {
  final ShortController controller;
  final WidgetRef ref;
  String? _previousShortId;
  var _previousSeconds = 0;
  var _previousState = PlaybackState.stopped;
  var _replayCount = 0;
  late final StreamSubscription? endedSubscription;
  late final StreamSubscription? playbackStateSubscription;

  ShortAnalyticsListener(this.controller, this.ref) {
    controller.player.addListener(onPlayerStateChanged);
    endedSubscription = controller.player.events.where((event) => event is PlaybackEndedEvent).cast<PlaybackEndedEvent>().listen(onPlaybackEnded);
    playbackStateSubscription = controller.player.events
        .where((event) => event is PlaybackStateChangedEvent)
        .cast<PlaybackStateChangedEvent>()
        .listen(onPlaybackStateChanged);
  }

  void dispose() {
    controller.player.removeListener(onPlayerStateChanged);
    endedSubscription?.cancel();
    playbackStateSubscription?.cancel();
  }

  void reset() {
    _previousSeconds = 0;
    _previousState = PlaybackState.stopped;
    _replayCount = 0;
  }

  void onPlayerStateChanged() {
    if (controller.currentShort == null) return;
    final mediaItemShortId = controller.player.value.currentMediaItem?.metadata?.extras?[MetadataExtraConstants.shortId];
    if (mediaItemShortId != controller.currentShort?.id) return;
    final value = controller.player.value;
    final seconds = (value.playbackPositionMs ?? 0.0) ~/ 1000;

    _previousSeconds = seconds;
    if (_previousShortId != mediaItemShortId) {
      _previousShortId = mediaItemShortId;
      reset();
    }
  }

  void onPlaybackStateChanged(PlaybackStateChangedEvent event) {
    final short = controller.currentShort;
    if (short == null) return;
    if (controller.player.value.currentMediaItem?.metadata?.extras?[MetadataExtraConstants.shortId] != controller.currentShort?.id) return;
    debugPrint('SHRT: listener - short ${short.id} playing changed from $_previousState to ${event.playbackState}');

    final wasPausedOrStopped = _previousState == PlaybackState.paused || _previousState == PlaybackState.stopped;
    final isPausedOrStopped = event.playbackState == PlaybackState.paused || event.playbackState == PlaybackState.stopped;

    final durationMs = controller.player.value.currentMediaItem?.metadata?.durationMs ?? 0;
    if (_previousState == PlaybackState.playing && isPausedOrStopped) {
      // paused
      debugPrint('SHRT: listener y - short ${short.id} paused. Sending stop for play $_replayCount');
      ref.read(analyticsProvider).shortStopped(ShortStoppedEvent(
            shortId: short.id,
            shortTitle: short.title,
            positionFraction: _previousSeconds / max(1, durationMs ~/ 1000),
            positionSeconds: _previousSeconds,
            replayCount: _replayCount,
          ));
    } else if (wasPausedOrStopped && event.playbackState == PlaybackState.playing) {
      // resumed
      debugPrint('SHRT: listener y - short ${short.id} resumed. Sending start for play $_replayCount');
      ref.read(analyticsProvider).shortStarted(
            ShortStartedEvent(
              shortId: short.id,
              shortTitle: short.title,
              replayCount: _replayCount,
              resumed: true,
              positionFraction: _previousSeconds / max(1, durationMs ~/ 1000),
              positionSeconds: _previousSeconds,
            ),
          );
    }

    _previousState = event.playbackState;
  }

  void onPlaybackEnded(PlaybackEndedEvent event) {
    final short = controller.currentShort;
    if (short == null) return;
    if (event.mediaItem?.metadata?.extras?[MetadataExtraConstants.shortId] != short.id) return;
    debugPrint('SHRT: listener y - short ${short.id} looped. Sending stop for play $_replayCount and start for play ${_replayCount + 1}');
    final durationMs = controller.player.value.currentMediaItem?.metadata?.durationMs ?? 0;
    ref.read(analyticsProvider).shortStopped(ShortStoppedEvent(
          shortId: short.id,
          shortTitle: short.title,
          positionFraction: _previousSeconds / max(1, durationMs ~/ 1000),
          positionSeconds: _previousSeconds,
          replayCount: _replayCount,
        ));
    _replayCount++;
    ref.read(analyticsProvider).shortStarted(
          ShortStartedEvent(
            shortId: short.id,
            shortTitle: short.title,
            replayCount: _replayCount,
            resumed: false,
            positionFraction: 0,
            positionSeconds: 0,
          ),
        );
  }
}
