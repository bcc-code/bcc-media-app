import 'package:auth0_flutter_web/auth0_flutter_web.dart';
import 'package:brunstadtv_app/models/auth0/auth0_id_token.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../env/env.dart';
import '../../../models/auth_state.dart';
import '../auth_state.dart';

// Careful. This line is very important,
// but because it's conditionally imported (see auth_state_notifier_interface.dart)
// IDEs don't show any errors when you remove it..
AuthStateNotifier getPlatformSpecificAuthStateNotifier(Ref ref) => AuthStateNotifierWeb();

final _auth0 = createAuth0Client(Auth0ClientOptions(
    domain: Env.auth0Domain, client_id: Env.auth0ClientId, audience: Env.auth0Audience, scope: 'openid profile offline_access church country'
    // cacheLocation: 'localStorage',
    ));

class AuthStateNotifierWeb extends StateNotifier<AuthState> implements AuthStateNotifier {
  AuthStateNotifierWeb() : super(const AuthState());

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
        audience: Env.auth0Audience,
        scope: 'openid profile offline_access church country',
      ),
    );
    await setStateFromResult(auth0);
    return true;
  }

  @override
  Future<bool> forceRefresh() {
    // TODO: implement forceRefresh
    throw UnimplementedError();
  }
}
