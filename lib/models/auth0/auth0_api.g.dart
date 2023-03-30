// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth0_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Auth0SignupRequestBody _$$_Auth0SignupRequestBodyFromJson(
        Map<String, dynamic> json) =>
    _$_Auth0SignupRequestBody(
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

Map<String, dynamic> _$$_Auth0SignupRequestBodyToJson(
    _$_Auth0SignupRequestBody instance) {
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

_$_Auth0SignupResponse _$$_Auth0SignupResponseFromJson(
        Map<String, dynamic> json) =>
    _$_Auth0SignupResponse(
      user_id: json['user_id'] as String,
      emailVerified: json['email_verified'] as bool,
      email: json['email'] as String,
    );

Map<String, dynamic> _$$_Auth0SignupResponseToJson(
        _$_Auth0SignupResponse instance) =>
    <String, dynamic>{
      'user_id': instance.user_id,
      'email_verified': instance.emailVerified,
      'email': instance.email,
    };
