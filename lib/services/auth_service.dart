import 'dart:convert';

import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:flutter/services.dart';
import 'package:my_app/env/.env.dart';

import '../helpers/constants.dart';
import '../models/auth0_id_token.dart';

class AuthService {
  static final AuthService instance = AuthService._internal();
  factory AuthService() => instance;
  AuthService._internal();

  final Auth0 auth0 = Auth0(Env.AUTH0_DOMAIN, Env.AUTH0_CLIENT_ID);
  UserProfile? user;
  String? auth0AccessToken;
  String? idToken;

  Future<String> login() async {
    try {
      final result = await auth0.webAuthentication().login(
          audience: Env.AUTH0_AUDIENCE,
          scopes: {'openid', 'profile', 'offline_access', 'email'},
          redirectUrl: 'media.bcc.app://login-callback');

      auth0AccessToken = result.accessToken;
      user = result.user;
      idToken = result.idToken;
      return 'success';
      //return await _storeCredentials(result);
    } catch (e) {
      return 'Unknown error $e';
    }
  }

  Auth0IdToken parseIdToken(String idToken) {
    final parts = idToken.split(r'.');
    assert(parts.length == 3);

    final Map<String, dynamic> json = jsonDecode(
      utf8.decode(
        base64Url.decode(
          base64Url.normalize(parts[1]),
        ),
      ),
    );

    return Auth0IdToken.fromJson(json);
  }
}
