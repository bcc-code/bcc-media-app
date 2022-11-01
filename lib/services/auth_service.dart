import 'dart:convert';

import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../env/env.dart';
import '../helpers/constants.dart';
import '../models/auth0_id_token.dart';
import '../router/router.gr.dart';

class AuthService {
  static final AuthService instance = AuthService._internal();
  factory AuthService() => instance;
  AuthService._internal();

  final Auth0 auth0 = Auth0("https://${Env.auth0Domain}", Env.auth0ClientId);
  UserProfile? user;
  String? auth0AccessToken;
  String? idToken;

  Future<Error?> init() async {
    try {
      if (!await auth0.credentialsManager.hasValidCredentials(minTtl: 60)) {
        return null;
      }
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

  Future logoutAndNavigate(BuildContext context) async {
    await auth0.credentialsManager.clearCredentials();
    auth0AccessToken = null;
    idToken = null;
    user = null;
    FirebaseMessaging.instance.deleteToken();
    context.router.push(LoginScreenRoute());
  }

  Future<Error?> login() async {
    try {
      final PackageInfo info = await PackageInfo.fromPlatform();
      final result =
          await auth0.webAuthentication(scheme: info.packageName).login(
        audience: Env.auth0Audience,
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
