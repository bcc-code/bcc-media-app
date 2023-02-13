import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/auth_state.dart';
import 'auth_state_notifier_stub.dart'
    if (dart.library.io) './implementations/auth_state_notifier_mobile.dart'
    if (dart.library.html) './implementations/auth_state_notifier_web.dart';

abstract class AuthStateNotifier implements StateNotifier<AuthState> {
  Future<AuthState?> getExistingAndEnsureNotExpired();
  Future<bool> load();
  Future logout({bool manual = true});
  Future<bool> login();
  factory AuthStateNotifier() => getPlatformSpecificAuthStateNotifier();
}

final authStateProvider = StateNotifierProvider<AuthStateNotifier, AuthState>((ref) {
  return AuthStateNotifier();
});
