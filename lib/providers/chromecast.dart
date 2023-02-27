import 'dart:async';

import 'package:bccm_player/chromecast_pigeon.g.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final chromecastListenerProvider = Provider<ChromecastListener>((c) {
  var listener = ChromecastListener(ref: c);
  ChromecastPigeon.setup(listener);
  return listener;
});
final isCasting = StateProvider<bool>((ref) => false);

class ChromecastListener implements ChromecastPigeon {
  Ref<ChromecastListener>? ref;

  ChromecastListener({this.ref});

  StreamController<ChromecastEvent> streamController = StreamController.broadcast();

  Stream<T> on<T>() {
    if (T == dynamic) {
      return streamController.stream as Stream<T>;
    } else {
      return streamController.stream.where((event) => event is T).cast<T>();
    }
  }

  void useListenerHook<T>(void Function(T event)? onData) {
    final castSessionUnavailable = on<T>();
    useEffect(() {
      final subscription = castSessionUnavailable.listen(onData);
      return () => subscription.cancel();
    }, [castSessionUnavailable]);
  }

  @override
  void onSessionEnded() {
    streamController.add(SessionEnded());
    ref?.read(isCasting.notifier).state = false;
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
    ref?.read(isCasting.notifier).state = true;
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
    ref?.read(isCasting.notifier).state = true;
  }

  @override
  void onSessionStarting() {
    streamController.add(SessionStarting());
  }

  @override
  void onSessionSuspended() {
    streamController.add(SessionSuspended());
    ref?.read(isCasting.notifier).state = false;
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

abstract class ChromecastEvent {}

class SessionEnded extends ChromecastEvent {}

class SessionEnding extends ChromecastEvent {}

class SessionResumeFailed extends ChromecastEvent {}

class SessionResumed extends ChromecastEvent {}

class SessionResuming extends ChromecastEvent {}

class SessionStartFailed extends ChromecastEvent {}

class SessionStarted extends ChromecastEvent {}

class SessionStarting extends ChromecastEvent {}

class SessionSuspended extends ChromecastEvent {}

class CastSessionAvailable extends ChromecastEvent {}

class CastSessionUnavailable extends ChromecastEvent {
  int? playbackPositionMs;
  CastSessionUnavailable({this.playbackPositionMs});

  factory CastSessionUnavailable.from(CastSessionUnavailableEvent event) {
    return CastSessionUnavailable(playbackPositionMs: event.playbackPositionMs);
  }
}
