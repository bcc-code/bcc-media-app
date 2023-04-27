import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/auth_state.dart';
import 'auth_state_notifier_stub.dart'
    if (dart.library.io) './implementations/auth_state_notifier_mobile.dart'
    if (dart.library.html) './implementations/auth_state_notifier_web.dart';

abstract class AuthStateNotifier implements StateNotifier<AuthState> {
  Future<AuthState?> getExistingAndEnsureNotExpired();
  Future<bool> load();
  Future<bool> forceRefresh();
  Future logout({bool manual = true});
  Future<bool> login({String? connection});
  factory AuthStateNotifier(Ref ref) => getPlatformSpecificAuthStateNotifier(ref);
}

final authStateProvider = StateNotifierProvider<AuthStateNotifier, AuthState>((ref) {
  return AuthStateNotifier(ref);
});
