import 'dart:async';

import '../pigeon/chromecast_pigeon.g.dart';
import 'chromecast_events.dart';

class ChromecastPigeonListener implements ChromecastPigeon {
  ChromecastPigeonListener();
  StreamController<ChromecastEvent> streamController = StreamController.broadcast();
  Stream<ChromecastEvent> get stream => streamController.stream;

  @override
  void onSessionEnded() {
    streamController.add(SessionEnded());
  }

  @override
  void onSessionEnding() {
    streamController.add(SessionEnding());
  }

  @override
  void onSessionResumeFailed() {
    streamController.add(SessionResumeFailed());
  }

  @override
  void onSessionResumed() {
    streamController.add(SessionResumed());
  }

  @override
  void onSessionResuming() {
    streamController.add(SessionResuming());
  }

  @override
  void onSessionStartFailed() {
    streamController.add(SessionStartFailed());
  }

  @override
  void onSessionStarted() {
    streamController.add(SessionStarted());
  }

  @override
  void onSessionStarting() {
    streamController.add(SessionStarting());
  }

  @override
  void onSessionSuspended() {
    streamController.add(SessionSuspended());
  }

  @override
  void onCastSessionAvailable() {
    streamController.add(CastSessionAvailable());
  }

  @override
  void onCastSessionUnavailable(CastSessionUnavailableEvent event) {
    streamController.add(CastSessionUnavailable.from(event));
  }
}
