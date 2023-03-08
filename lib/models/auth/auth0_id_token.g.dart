// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth0_id_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Auth0IdToken _$Auth0IdTokenFromJson(Map<String, dynamic> json) => Auth0IdToken(
      nickname: json['nickname'] as String,
      name: json['name'] as String,
      picture: json['picture'] as String,
      updatedAt: json['updated_at'] as String,
      iss: json['iss'] as String,
      sub: json['sub'] as String,
      aud: json['aud'] as String,
      iat: json['iat'] as int,
      exp: json['exp'] as int,
      countryIso2Code:
          json['https://login.bcc.no/claims/CountryIso2Code'] as String?,
      churchId: json['https://login.bcc.no/claims/churchId'] as int?,
      appMetadata:
          json['https://members.bcc.no/app_metadata'] as Map<String, dynamic>?,
      birthdate: json['birthdate'] as String?,
      gender: json['gender'] as String?,
      authTime: json['auth_time'] as int?,
    );

Map<String, dynamic> _$Auth0IdTokenToJson(Auth0IdToken instance) =>
    <String, dynamic>{
      'nickname': instance.nickname,
      'name': instance.name,
      'picture': instance.picture,
      'updated_at': instance.updatedAt,
      'iss': instance.iss,
      'sub': instance.sub,
      'aud': instance.aud,
      'https://login.bcc.no/claims/CountryIso2Code': instance.countryIso2Code,
      'https://login.bcc.no/claims/churchId': instance.churchId,
      'https://members.bcc.no/app_metadata': instance.appMetadata,
      'birthdate': instance.birthdate,
      'gender': instance.gender,
      'iat': instance.iat,
      'exp': instance.exp,
      'auth_time': instance.authTime,
    };
