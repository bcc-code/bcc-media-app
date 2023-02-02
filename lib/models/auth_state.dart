import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:brunstadtv_app/models/auth/auth0_id_token.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const AuthState._();

  const factory AuthState({
    Auth0IdToken? user,
    String? auth0AccessToken,
    DateTime? expiresAt,
    String? idToken,
    bool? signedOutManually,
  }) = _Auth;

  bool get guestMode => auth0AccessToken == null;
}
