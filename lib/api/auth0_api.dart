// ignore_for_file: invalid_annotation_target

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../models/auth0/auth0_api.dart';
import '../env/env.dart';

final auth0ApiProvider = Provider<Auth0Api>((ref) {
  return Auth0Api(domain: Env.auth0Domain);
});

class Auth0Api {
  Auth0Api({required this.domain});
  final String domain;
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
}
