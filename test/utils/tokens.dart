import 'dart:convert';

import 'package:brunstadtv_app/models/auth0/auth0_id_token.dart';

const fakeIdToken = Auth0IdToken(
  nickname: 'nickname',
  name: 'name',
  picture: 'picture',
  updatedAt: 'updatedAt',
  iss: 'iss',
  sub: 'sub',
  aud: 'aud',
  iat: 0,
  exp: 0,
  countryIso2Code: 'countryIso2Code',
);
final fakeIdTokenJwt =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.${base64UrlEncode(utf8.encode(json.encode(fakeIdToken)))}.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c';
