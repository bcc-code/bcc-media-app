// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth0_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Auth0SignupRequestBody _$$_Auth0SignupRequestBodyFromJson(
        Map<String, dynamic> json) =>
    _$_Auth0SignupRequestBody(
      clientId: json['clientId'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      connection: json['connection'] as String,
      username: json['username'] as String?,
      givenName: json['givenName'] as String?,
      familyName: json['familyName'] as String?,
      name: json['name'] as String?,
      nickname: json['nickname'] as String?,
      pictureUrl: json['pictureUrl'] as String?,
      userMetadata: json['userMetadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$_Auth0SignupRequestBodyToJson(
    _$_Auth0SignupRequestBody instance) {
  final val = <String, dynamic>{
    'clientId': instance.clientId,
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
  writeNotNull('givenName', instance.givenName);
  writeNotNull('familyName', instance.familyName);
  writeNotNull('name', instance.name);
  writeNotNull('nickname', instance.nickname);
  writeNotNull('pictureUrl', instance.pictureUrl);
  writeNotNull('userMetadata', instance.userMetadata);
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
