import '../pigeon/chromecast_pigeon.g.dart';

extension ChromecastStreamExtensions on Stream<ChromecastEvent> {
  Stream<T> on<T extends ChromecastEvent>() {
    if (T == dynamic) {
      return this as Stream<T>;
    } else {
      return where((event) => event is T).cast<T>();
    }
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
