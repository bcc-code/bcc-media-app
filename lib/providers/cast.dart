import 'dart:async';

import 'package:bccm_player/chromecast_pigeon.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChromecastListener implements ChromecastPigeon {
  static ChromecastListener instance = ChromecastListener._internal();
  ChromecastListener._internal();
  StreamController<ChromecastEvent> streamController =
      StreamController.broadcast();

  Stream<T> on<T>() {
    if (T == dynamic) {
      return streamController.stream as Stream<T>;
    } else {
      return streamController.stream.where((event) => event is T).cast<T>();
    }
  }

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
}

class ChromecastEvent {}

class SessionEnded extends ChromecastEvent {}

class SessionEnding extends ChromecastEvent {}

class SessionResumeFailed extends ChromecastEvent {}

class SessionResumed extends ChromecastEvent {}

class SessionResuming extends ChromecastEvent {}

class SessionStartFailed extends ChromecastEvent {}

class SessionStarted extends ChromecastEvent {}

class SessionStarting extends ChromecastEvent {}

class SessionSuspended extends ChromecastEvent {}
