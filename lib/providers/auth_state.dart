import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../helpers/auth_notifier/auth_state_notifier_interface.dart';
import '../models/auth_state.dart';

final authStateProvider = StateNotifierProvider<AuthStateNotifier, AuthState>((ref) {
  return AuthStateNotifier();
});
