// ignore_for_file: invalid_annotation_target

import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../models/auth0/auth0_api.dart';
import '../env/env.dart';
import 'dart:async';

final auth0ApiProvider = Provider<Auth0Api>((ref) {
  return Auth0Api(
    domain: Env.auth0Domain,
    clientId: Env.auth0ClientId,
    audience: Env.auth0Audience,
  );
});

class Auth0Api {
  Auth0Api({
    required this.domain,
    required this.clientId,
    required this.audience,
  });
  final String domain;
  final String clientId;
  final String audience;

  Future<Auth0SignupResponse?> signup(Auth0SignupRequestBody requestBody) async {
    final url = Uri.parse('https://$domain/dbconnections/signup');
    final body = json.encode(requestBody.toJson());
    final headers = {'content-type': 'application/json'};

    final response = await http.post(url, body: body, headers: headers);

    final jsonBody = json.decode(response.body);
    if (response.statusCode == 200) {
      return Auth0SignupResponse.fromJson(jsonBody);
    } else {
      final e = Auth0ApiException.fromJson(jsonBody);
      throw e.copyWith(statusCode: response.statusCode);
    }
  }

  Future<DeviceTokenRequestResponse?> fetchDeviceCode({required String scope}) async {
    var tokenRequest = TokenRequestBody(clientId: clientId, scope: scope, audience: audience);

    var url = Uri.parse('https://$domain/oauth/device/code');
    var response = await http.post(url, headers: {'Content-Type': 'application/json'}, body: jsonEncode(tokenRequest));

    if (response.statusCode == 200) {
      return DeviceTokenRequestResponse.fromJson(jsonDecode(response.body));
    }
    return null;
  }

  Future<Credentials> listenToResolve(DeviceTokenRequestResponse deviceToken) async {
    var tokenRequest = GetTokenRequest(deviceCode: deviceToken.deviceCode, clientId: clientId);
    var url = Uri.parse('https://$domain/oauth/token');

    var response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(tokenRequest),
    );

    if (response.statusCode == 200) {
      return Credentials.fromJson(jsonDecode(response.body));
    } else {
      final error = FailedTokenRetrieval.fromJson(jsonDecode(response.body));
      if (error.error == 'authorization_pending') {
        return Future.delayed(Duration(seconds: deviceToken.interval), () => listenToResolve(deviceToken));
      } else {
        throw error;
      }
    }
  }
}

class Credentials {
  String accessToken;
  String refreshToken;
  String idToken;
  String tokenType;
  int expiresIn;
  String scope;

  Credentials({
    required this.accessToken,
    required this.refreshToken,
    required this.idToken,
    required this.tokenType,
    required this.expiresIn,
    required this.scope,
  });

  factory Credentials.fromJson(Map<String, dynamic> json) {
    return Credentials(
      accessToken: json['access_token'],
      refreshToken: json['refresh_token'],
      idToken: json['id_token'],
      tokenType: json['token_type'],
      expiresIn: json['expires_in'],
      scope: json['scope'],
    );
  }
}

class SimpleKeychain {
  SimpleKeychain({required String service, required String accessGroup});
  // Mock class
}

class Options {
  String clientId;
  String scope;
  String audience;
  String domain;

  Options({
    required this.clientId,
    required this.scope,
    required this.audience,
    required this.domain,
  });
}

class TokenRequestBody {
  String clientId;
  String scope;
  String audience;

  TokenRequestBody({required this.clientId, required this.scope, required this.audience});

  Map<String, dynamic> toJson() => {
        'client_id': clientId,
        'scope': scope,
        'audience': audience,
      };
}

class GetTokenRequest {
  String grantType = 'urn:ietf:params:oauth:grant-type:device_code';
  String deviceCode;
  String clientId;

  GetTokenRequest({required this.deviceCode, required this.clientId});

  Map<String, dynamic> toJson() => {
        'grant_type': grantType,
        'device_code': deviceCode,
        'client_id': clientId,
      };
}

class FailedTokenRetrieval extends Error {
  String error;
  String errorDescription;

  FailedTokenRetrieval({required this.error, required this.errorDescription});

  factory FailedTokenRetrieval.fromJson(Map<String, dynamic> json) {
    return FailedTokenRetrieval(
      error: json['error'],
      errorDescription: json['error_description'],
    );
  }
}

class DeviceTokenRequestResponse {
  String deviceCode;
  String userCode;
  String verificationUri;
  int expiresIn;
  int interval;
  String verificationUriComplete;

  DeviceTokenRequestResponse({
    required this.deviceCode,
    required this.userCode,
    required this.verificationUri,
    required this.expiresIn,
    required this.interval,
    required this.verificationUriComplete,
  });

  factory DeviceTokenRequestResponse.fromJson(Map<String, dynamic> json) {
    return DeviceTokenRequestResponse(
      deviceCode: json['device_code'],
      userCode: json['user_code'],
      verificationUri: json['verification_uri'],
      expiresIn: json['expires_in'],
      interval: json['interval'],
      verificationUriComplete: json['verification_uri_complete'],
    );
  }
}

class ErrorCallbacks {
  List<Function> callbacks = [];

  void append(Function cb) {
    callbacks.add(cb);
  }
}

class Profile {
  String? name;
  String? ageGroup;

  Profile({this.name, this.ageGroup});
}
