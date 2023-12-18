import 'package:auth0_flutter_web/auth0_flutter_web.dart';
import 'package:bccm_core/src/models/auth0/auth0_id_token.dart';
import 'package:bccm_core/src/models/auth_state.dart';
import 'package:bccm_core/src/features/auth/auth0_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../auth_state.dart';

// Careful. This line is very important,
// but because it's conditionally imported (see auth_state_notifier_interface.dart)
// IDEs don't show any errors when you remove it..
AuthStateNotifier getPlatformSpecificAuthStateNotifier(AuthConfig config) => AuthStateNotifierWeb(config);

class AuthStateNotifierWeb extends StateNotifier<AuthState> implements AuthStateNotifier {
  AuthStateNotifierWeb(this.config) : super(const AuthState()) {
    _auth0 = createAuth0Client(Auth0ClientOptions(
      domain: config.auth0Domain,
      client_id: config.auth0ClientId,
      audience: config.auth0Audience,
      scope: config.scopes.join(' '),
      // cacheLocation: 'localStorage',
    ));
  }
  late Future<Auth0> _auth0;
  AuthConfig config;

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
    final user = await auth0.getIdTokenClaims();
    final userProfile = Auth0IdToken.fromJson(user!);
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
  Future logout({bool manual = true}) async {
    state = const AuthState();
    final auth0 = await _auth0;
    auth0.logout(options: LogoutOptions(localOnly: true));
  }

  @override
  Future<bool> login({String? connection}) async {
    final auth0 = await _auth0;
    await auth0.loginWithPopup(
      options: PopupLoginOptions(
        audience: config.auth0Audience,
        scope: config.scopes.join(' '),
      ),
    );
    await setStateFromResult(auth0);
    return true;
  }

  @override
  Future<bool> forceRefresh() {
    throw UnimplementedError();
  }

  @override
  Future<void> loginViaDeviceCode(DeviceTokenRequestResponse deviceToken) {
    throw UnimplementedError();
  }
}
