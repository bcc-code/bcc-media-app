// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth0_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$Auth0SignupRequestBodyImpl _$$Auth0SignupRequestBodyImplFromJson(
        Map<String, dynamic> json) =>
    _$Auth0SignupRequestBodyImpl(
      clientId: json['client_id'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      connection: json['connection'] as String,
      username: json['username'] as String?,
      givenName: json['given_name'] as String?,
      familyName: json['family_name'] as String?,
      name: json['name'] as String?,
      nickname: json['nickname'] as String?,
      pictureUrl: json['picture_url'] as String?,
      userMetadata: (json['user_metadata'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
    );

Map<String, dynamic> _$$Auth0SignupRequestBodyImplToJson(
    _$Auth0SignupRequestBodyImpl instance) {
  final val = <String, dynamic>{
    'client_id': instance.clientId,
    'email': instance.email,
    'password': instance.password,
    'connection': instance.connection,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('username', instance.username);
  writeNotNull('given_name', instance.givenName);
  writeNotNull('family_name', instance.familyName);
  writeNotNull('name', instance.name);
  writeNotNull('nickname', instance.nickname);
  writeNotNull('picture_url', instance.pictureUrl);
  writeNotNull('user_metadata', instance.userMetadata);
  return val;
}

_$Auth0SignupResponseImpl _$$Auth0SignupResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$Auth0SignupResponseImpl(
      user_id: json['user_id'] as String,
      emailVerified: json['email_verified'] as bool,
      email: json['email'] as String,
    );

Map<String, dynamic> _$$Auth0SignupResponseImplToJson(
        _$Auth0SignupResponseImpl instance) =>
    <String, dynamic>{
      'user_id': instance.user_id,
      'email_verified': instance.emailVerified,
      'email': instance.email,
    };

_$Auth0ApiExceptionImpl _$$Auth0ApiExceptionImplFromJson(
        Map<String, dynamic> json) =>
    _$Auth0ApiExceptionImpl(
      name: json['name'] as String?,
      code: json['code'] as String?,
      description: json['description'] as String?,
      statusCode: json['statusCode'] as int?,
    );

Map<String, dynamic> _$$Auth0ApiExceptionImplToJson(
        _$Auth0ApiExceptionImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
      'description': instance.description,
      'statusCode': instance.statusCode,
    };
