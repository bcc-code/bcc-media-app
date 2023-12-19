// /lib/models/auth0_id_token.dart

import 'package:json_annotation/json_annotation.dart';
part 'auth0_id_token.g.dart';

@JsonSerializable()
class Auth0IdToken {
  const Auth0IdToken({
    required this.nickname,
    required this.name,
    required this.picture,
    required this.updatedAt,
    required this.iss,
    required this.sub,
    required this.aud,
    required this.iat,
    required this.exp,
    required this.countryIso2Code,
    this.churchId,
    this.appMetadata,
    this.userMetadata,
    this.birthdate,
    this.email,
    this.gender,
    this.authTime,
    this.givenName,
    this.familyName,
  });

  final String? nickname;
  final String name;
  final String? picture;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  final String iss;
  final String sub;
  final String aud;
  @JsonKey(name: 'https://login.bcc.no/claims/CountryIso2Code')
  final String? countryIso2Code;
  @JsonKey(name: 'https://login.bcc.no/claims/churchId')
  final int? churchId;
  @JsonKey(name: 'https://members.bcc.no/app_metadata')
  final Map<String, dynamic>? appMetadata;
  @JsonKey(name: 'user_metadata')
  final Map<String, dynamic>? userMetadata;
  @JsonKey(name: 'given_name')
  final String? givenName;
  @JsonKey(name: 'family_name')
  final String? familyName;
  final String? birthdate;
  final String? gender;
  final String? email;
  final int iat;
  final int exp;

  bool? get mediaSubscriber => userMetadata?['media_subscriber'];
  bool? get hasMembership => appMetadata?['hasMembership'];
  String? get bccPersonId => appMetadata?['personId']?.toString();

  @JsonKey(name: 'auth_time')
  final int? authTime; // this might be null for the first time login

  factory Auth0IdToken.fromJson(Map<String, dynamic> json) => _$Auth0IdTokenFromJson(json);

  Map<String, dynamic> toJson() => _$Auth0IdTokenToJson(this);
}
