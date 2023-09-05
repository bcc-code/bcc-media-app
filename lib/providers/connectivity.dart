import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final isOfflineProvider = Provider.autoDispose((ref) {
  final data = ref.watch(connectivityProvider).asData?.valueOrNull;
  return data == ConnectivityResult.none;
});

final connectivityProvider = StreamProvider.autoDispose((ref) {
  return _connectivityStream();
});

Stream<ConnectivityResult> _connectivityStream() async* {
  try {
    yield await Connectivity().checkConnectivity();
  } catch (e) {
    yield ConnectivityResult.none;
  }
  await for (final event in Connectivity().onConnectivityChanged) {
    yield event;
  }
}
