import 'package:auth0_flutter/auth0_flutter.dart' show UserProfile;
import 'package:auth0_flutter_web/auth0_flutter_web.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:rudder_sdk_flutter/RudderController.dart';

import '../../env/env.dart';
import '../../models/auth_state.dart';
import 'auth_state_notifier_interface.dart';

final _auth0 = createAuth0Client(Auth0ClientOptions(
  domain: Env.auth0Domain,
  client_id: Env.auth0ClientId,
  // cacheLocation: 'localStorage',
));

class AuthStateWebNotifier extends StateNotifier<AuthState> implements AuthStateNotifier {
  AuthStateWebNotifier() : super(const AuthState());

  @override
  Future<AuthState?> getExistingAndEnsureNotExpired() async {
    if (state.expiresAt == null || state.auth0AccessToken == null) {
      return null;
    }
    if (state.expiresAt!.isBefore(DateTime.now())) {
      await load();
    }
    if (state.expiresAt!.isBefore(DateTime.now())) {
      throw Exception('Auth state is still expired after attempting to renew.');
    }
    return state;
  }

  Future setStateFromResult(Auth0 auth0) async {
    if (!await auth0.isAuthenticated()) {
      return;
    }
    final user = await auth0.getUser();
    final userProfile = UserProfile.fromMap(user!);
    final accessToken = await auth0.getTokenSilently();
    final idToken = (await auth0.getIdTokenClaims())!['__raw'];
    final expiresAt = DateTime.now().add(const Duration(days: 2));
    state = state.copyWith(auth0AccessToken: accessToken, idToken: idToken, user: userProfile, expiresAt: expiresAt);
  }

  @override
  Future<bool> load() async {
    final auth0 = await _auth0;
    if (await auth0.isAuthenticated()) {
      await setStateFromResult(auth0);
      return true;
    }
    return false;
  }

  @override
  Future logout({bool federated = true}) async {
    final auth0 = await _auth0;
    auth0.logout();
  }

  @override
  Future<bool> login() async {
    final auth0 = await _auth0;
    await auth0.loginWithPopup(
      options: PopupLoginOptions(
        audience: Env.auth0Audience,
        scope: 'openid:profile:offline_access:church:country',
      ),
    );
    await setStateFromResult(auth0);
    return true;
  }
}

AuthStateNotifier getAuthStateNotifier() => AuthStateWebNotifier();
