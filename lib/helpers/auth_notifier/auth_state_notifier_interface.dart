// Attempt at creating platform independant version of AuthStateNotifier using:
// https://stackoverflow.com/a/58713064/3389357

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/auth_state.dart';
import 'auth_state_notifier_stub.dart' if (dart.library.io) 'auth_state_mobile_notifier.dart' if (dart.library.html) 'auth_state_web_notifier.dart';

abstract class AuthStateNotifier implements StateNotifier<AuthState> {
  Future<AuthState?> getExistingAndEnsureNotExpired();

  Future<bool> load();

  Future logout({bool manual = true});

  Future<bool> login();

  factory AuthStateNotifier() => getAuthStateNotifier();
}
