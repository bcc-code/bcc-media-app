// ignore_for_file: invalid_annotation_target
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth0_api.freezed.dart';
part 'auth0_api.g.dart';

@freezed
class Auth0SignupRequestBody with _$Auth0SignupRequestBody {
  @JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
  factory Auth0SignupRequestBody({
    required String clientId,
    required String email,
    required String password,
    required String connection,
    String? username,
    String? givenName,
    String? familyName,
    String? name,
    String? nickname,
    String? pictureUrl,
    Map<String, String>? userMetadata,
  }) = _Auth0SignupRequestBody;

  factory Auth0SignupRequestBody.fromJson(Map<String, dynamic> json) => _$Auth0SignupRequestBodyFromJson(json);
}

@freezed
class Auth0SignupResponse with _$Auth0SignupResponse {
  const factory Auth0SignupResponse({
    @JsonKey(name: 'user_id') required String user_id,
    @JsonKey(name: 'email_verified') required bool emailVerified,
    required String email,
  }) = _Auth0SignupResponse;

  factory Auth0SignupResponse.fromJson(Map<String, dynamic> json) => _$Auth0SignupResponseFromJson(json);
}
