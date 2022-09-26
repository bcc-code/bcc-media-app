import 'dart:convert';

import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:flutter/services.dart';
import 'package:brunstadtv_app/env/.env.dart';

import '../helpers/constants.dart';
import '../models/auth0_id_token.dart';

class AuthService {
  static final AuthService instance = AuthService._internal();
  factory AuthService() => instance;
  AuthService._internal();

  final Auth0 auth0 = Auth0("https://${Env.AUTH0_DOMAIN}", Env.AUTH0_CLIENT_ID);
  UserProfile? user;
  String? auth0AccessToken;
  String? idToken;

  Future<Error?> init() async {
    try {
      final result = await auth0.credentialsManager.credentials();

      auth0AccessToken = result.accessToken;
      user = result.user;
      idToken = result.idToken;
      return null;
      //return await _storeCredentials(result);
    } on Error catch (e) {
      return e;
    }
  }

  Future<Error?> login() async {
    try {
      final result =
          await auth0.webAuthentication(scheme: 'tv.brunstad.app').login(
        audience: Env.AUTH0_AUDIENCE,
        scopes: {'openid', 'profile', 'offline_access', 'email'},
      );

      auth0AccessToken = result.accessToken;
      user = result.user;
      idToken = result.idToken;
      return null;
      //return await _storeCredentials(result);
    } on Error catch (e) {
      return e;
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
