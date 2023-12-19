// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth0_api.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Auth0SignupRequestBody _$Auth0SignupRequestBodyFromJson(
    Map<String, dynamic> json) {
  return _Auth0SignupRequestBody.fromJson(json);
}

/// @nodoc
mixin _$Auth0SignupRequestBody {
  String get clientId => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get connection => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  String? get givenName => throw _privateConstructorUsedError;
  String? get familyName => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get nickname => throw _privateConstructorUsedError;
  String? get pictureUrl => throw _privateConstructorUsedError;
  Map<String, String>? get userMetadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $Auth0SignupRequestBodyCopyWith<Auth0SignupRequestBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $Auth0SignupRequestBodyCopyWith<$Res> {
  factory $Auth0SignupRequestBodyCopyWith(Auth0SignupRequestBody value,
          $Res Function(Auth0SignupRequestBody) then) =
      _$Auth0SignupRequestBodyCopyWithImpl<$Res, Auth0SignupRequestBody>;
  @useResult
  $Res call(
      {String clientId,
      String email,
      String password,
      String connection,
      String? username,
      String? givenName,
      String? familyName,
      String? name,
      String? nickname,
      String? pictureUrl,
      Map<String, String>? userMetadata});
}

/// @nodoc
class _$Auth0SignupRequestBodyCopyWithImpl<$Res,
        $Val extends Auth0SignupRequestBody>
    implements $Auth0SignupRequestBodyCopyWith<$Res> {
  _$Auth0SignupRequestBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientId = null,
    Object? email = null,
    Object? password = null,
    Object? connection = null,
    Object? username = freezed,
    Object? givenName = freezed,
    Object? familyName = freezed,
    Object? name = freezed,
    Object? nickname = freezed,
    Object? pictureUrl = freezed,
    Object? userMetadata = freezed,
  }) {
    return _then(_value.copyWith(
      clientId: null == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      connection: null == connection
          ? _value.connection
          : connection // ignore: cast_nullable_to_non_nullable
              as String,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      givenName: freezed == givenName
          ? _value.givenName
          : givenName // ignore: cast_nullable_to_non_nullable
              as String?,
      familyName: freezed == familyName
          ? _value.familyName
          : familyName // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      nickname: freezed == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String?,
      pictureUrl: freezed == pictureUrl
          ? _value.pictureUrl
          : pictureUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      userMetadata: freezed == userMetadata
          ? _value.userMetadata
          : userMetadata // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$Auth0SignupRequestBodyImplCopyWith<$Res>
    implements $Auth0SignupRequestBodyCopyWith<$Res> {
  factory _$$Auth0SignupRequestBodyImplCopyWith(
          _$Auth0SignupRequestBodyImpl value,
          $Res Function(_$Auth0SignupRequestBodyImpl) then) =
      __$$Auth0SignupRequestBodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String clientId,
      String email,
      String password,
      String connection,
      String? username,
      String? givenName,
      String? familyName,
      String? name,
      String? nickname,
      String? pictureUrl,
      Map<String, String>? userMetadata});
}

/// @nodoc
class __$$Auth0SignupRequestBodyImplCopyWithImpl<$Res>
    extends _$Auth0SignupRequestBodyCopyWithImpl<$Res,
        _$Auth0SignupRequestBodyImpl>
    implements _$$Auth0SignupRequestBodyImplCopyWith<$Res> {
  __$$Auth0SignupRequestBodyImplCopyWithImpl(
      _$Auth0SignupRequestBodyImpl _value,
      $Res Function(_$Auth0SignupRequestBodyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientId = null,
    Object? email = null,
    Object? password = null,
    Object? connection = null,
    Object? username = freezed,
    Object? givenName = freezed,
    Object? familyName = freezed,
    Object? name = freezed,
    Object? nickname = freezed,
    Object? pictureUrl = freezed,
    Object? userMetadata = freezed,
  }) {
    return _then(_$Auth0SignupRequestBodyImpl(
      clientId: null == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      connection: null == connection
          ? _value.connection
          : connection // ignore: cast_nullable_to_non_nullable
              as String,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      givenName: freezed == givenName
          ? _value.givenName
          : givenName // ignore: cast_nullable_to_non_nullable
              as String?,
      familyName: freezed == familyName
          ? _value.familyName
          : familyName // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      nickname: freezed == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String?,
      pictureUrl: freezed == pictureUrl
          ? _value.pictureUrl
          : pictureUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      userMetadata: freezed == userMetadata
          ? _value._userMetadata
          : userMetadata // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
class _$Auth0SignupRequestBodyImpl
    with DiagnosticableTreeMixin
    implements _Auth0SignupRequestBody {
  _$Auth0SignupRequestBodyImpl(
      {required this.clientId,
      required this.email,
      required this.password,
      required this.connection,
      this.username,
      this.givenName,
      this.familyName,
      this.name,
      this.nickname,
      this.pictureUrl,
      final Map<String, String>? userMetadata})
      : _userMetadata = userMetadata;

  factory _$Auth0SignupRequestBodyImpl.fromJson(Map<String, dynamic> json) =>
      _$$Auth0SignupRequestBodyImplFromJson(json);

  @override
  final String clientId;
  @override
  final String email;
  @override
  final String password;
  @override
  final String connection;
  @override
  final String? username;
  @override
  final String? givenName;
  @override
  final String? familyName;
  @override
  final String? name;
  @override
  final String? nickname;
  @override
  final String? pictureUrl;
  final Map<String, String>? _userMetadata;
  @override
  Map<String, String>? get userMetadata {
    final value = _userMetadata;
    if (value == null) return null;
    if (_userMetadata is EqualUnmodifiableMapView) return _userMetadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Auth0SignupRequestBody(clientId: $clientId, email: $email, password: $password, connection: $connection, username: $username, givenName: $givenName, familyName: $familyName, name: $name, nickname: $nickname, pictureUrl: $pictureUrl, userMetadata: $userMetadata)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Auth0SignupRequestBody'))
      ..add(DiagnosticsProperty('clientId', clientId))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('password', password))
      ..add(DiagnosticsProperty('connection', connection))
      ..add(DiagnosticsProperty('username', username))
      ..add(DiagnosticsProperty('givenName', givenName))
      ..add(DiagnosticsProperty('familyName', familyName))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('nickname', nickname))
      ..add(DiagnosticsProperty('pictureUrl', pictureUrl))
      ..add(DiagnosticsProperty('userMetadata', userMetadata));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Auth0SignupRequestBodyImpl &&
            (identical(other.clientId, clientId) ||
                other.clientId == clientId) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.connection, connection) ||
                other.connection == connection) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.givenName, givenName) ||
                other.givenName == givenName) &&
            (identical(other.familyName, familyName) ||
                other.familyName == familyName) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.pictureUrl, pictureUrl) ||
                other.pictureUrl == pictureUrl) &&
            const DeepCollectionEquality()
                .equals(other._userMetadata, _userMetadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      clientId,
      email,
      password,
      connection,
      username,
      givenName,
      familyName,
      name,
      nickname,
      pictureUrl,
      const DeepCollectionEquality().hash(_userMetadata));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$Auth0SignupRequestBodyImplCopyWith<_$Auth0SignupRequestBodyImpl>
      get copyWith => __$$Auth0SignupRequestBodyImplCopyWithImpl<
          _$Auth0SignupRequestBodyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$Auth0SignupRequestBodyImplToJson(
      this,
    );
  }
}

abstract class _Auth0SignupRequestBody implements Auth0SignupRequestBody {
  factory _Auth0SignupRequestBody(
      {required final String clientId,
      required final String email,
      required final String password,
      required final String connection,
      final String? username,
      final String? givenName,
      final String? familyName,
      final String? name,
      final String? nickname,
      final String? pictureUrl,
      final Map<String, String>? userMetadata}) = _$Auth0SignupRequestBodyImpl;

  factory _Auth0SignupRequestBody.fromJson(Map<String, dynamic> json) =
      _$Auth0SignupRequestBodyImpl.fromJson;

  @override
  String get clientId;
  @override
  String get email;
  @override
  String get password;
  @override
  String get connection;
  @override
  String? get username;
  @override
  String? get givenName;
  @override
  String? get familyName;
  @override
  String? get name;
  @override
  String? get nickname;
  @override
  String? get pictureUrl;
  @override
  Map<String, String>? get userMetadata;
  @override
  @JsonKey(ignore: true)
  _$$Auth0SignupRequestBodyImplCopyWith<_$Auth0SignupRequestBodyImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Auth0SignupResponse _$Auth0SignupResponseFromJson(Map<String, dynamic> json) {
  return _Auth0SignupResponse.fromJson(json);
}

/// @nodoc
mixin _$Auth0SignupResponse {
  @JsonKey(name: 'user_id')
  String get user_id => throw _privateConstructorUsedError;
  @JsonKey(name: 'email_verified')
  bool get emailVerified => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $Auth0SignupResponseCopyWith<Auth0SignupResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $Auth0SignupResponseCopyWith<$Res> {
  factory $Auth0SignupResponseCopyWith(
          Auth0SignupResponse value, $Res Function(Auth0SignupResponse) then) =
      _$Auth0SignupResponseCopyWithImpl<$Res, Auth0SignupResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') String user_id,
      @JsonKey(name: 'email_verified') bool emailVerified,
      String email});
}

/// @nodoc
class _$Auth0SignupResponseCopyWithImpl<$Res, $Val extends Auth0SignupResponse>
    implements $Auth0SignupResponseCopyWith<$Res> {
  _$Auth0SignupResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user_id = null,
    Object? emailVerified = null,
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      user_id: null == user_id
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as String,
      emailVerified: null == emailVerified
          ? _value.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$Auth0SignupResponseImplCopyWith<$Res>
    implements $Auth0SignupResponseCopyWith<$Res> {
  factory _$$Auth0SignupResponseImplCopyWith(_$Auth0SignupResponseImpl value,
          $Res Function(_$Auth0SignupResponseImpl) then) =
      __$$Auth0SignupResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') String user_id,
      @JsonKey(name: 'email_verified') bool emailVerified,
      String email});
}

/// @nodoc
class __$$Auth0SignupResponseImplCopyWithImpl<$Res>
    extends _$Auth0SignupResponseCopyWithImpl<$Res, _$Auth0SignupResponseImpl>
    implements _$$Auth0SignupResponseImplCopyWith<$Res> {
  __$$Auth0SignupResponseImplCopyWithImpl(_$Auth0SignupResponseImpl _value,
      $Res Function(_$Auth0SignupResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user_id = null,
    Object? emailVerified = null,
    Object? email = null,
  }) {
    return _then(_$Auth0SignupResponseImpl(
      user_id: null == user_id
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as String,
      emailVerified: null == emailVerified
          ? _value.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$Auth0SignupResponseImpl
    with DiagnosticableTreeMixin
    implements _Auth0SignupResponse {
  const _$Auth0SignupResponseImpl(
      {@JsonKey(name: 'user_id') required this.user_id,
      @JsonKey(name: 'email_verified') required this.emailVerified,
      required this.email});

  factory _$Auth0SignupResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$Auth0SignupResponseImplFromJson(json);

  @override
  @JsonKey(name: 'user_id')
  final String user_id;
  @override
  @JsonKey(name: 'email_verified')
  final bool emailVerified;
  @override
  final String email;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Auth0SignupResponse(user_id: $user_id, emailVerified: $emailVerified, email: $email)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Auth0SignupResponse'))
      ..add(DiagnosticsProperty('user_id', user_id))
      ..add(DiagnosticsProperty('emailVerified', emailVerified))
      ..add(DiagnosticsProperty('email', email));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Auth0SignupResponseImpl &&
            (identical(other.user_id, user_id) || other.user_id == user_id) &&
            (identical(other.emailVerified, emailVerified) ||
                other.emailVerified == emailVerified) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, user_id, emailVerified, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$Auth0SignupResponseImplCopyWith<_$Auth0SignupResponseImpl> get copyWith =>
      __$$Auth0SignupResponseImplCopyWithImpl<_$Auth0SignupResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$Auth0SignupResponseImplToJson(
      this,
    );
  }
}

abstract class _Auth0SignupResponse implements Auth0SignupResponse {
  const factory _Auth0SignupResponse(
      {@JsonKey(name: 'user_id') required final String user_id,
      @JsonKey(name: 'email_verified') required final bool emailVerified,
      required final String email}) = _$Auth0SignupResponseImpl;

  factory _Auth0SignupResponse.fromJson(Map<String, dynamic> json) =
      _$Auth0SignupResponseImpl.fromJson;

  @override
  @JsonKey(name: 'user_id')
  String get user_id;
  @override
  @JsonKey(name: 'email_verified')
  bool get emailVerified;
  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$Auth0SignupResponseImplCopyWith<_$Auth0SignupResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Auth0ApiException _$Auth0ApiExceptionFromJson(Map<String, dynamic> json) {
  return _Auth0ApiException.fromJson(json);
}

/// @nodoc
mixin _$Auth0ApiException {
  String? get name => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int? get statusCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $Auth0ApiExceptionCopyWith<Auth0ApiException> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $Auth0ApiExceptionCopyWith<$Res> {
  factory $Auth0ApiExceptionCopyWith(
          Auth0ApiException value, $Res Function(Auth0ApiException) then) =
      _$Auth0ApiExceptionCopyWithImpl<$Res, Auth0ApiException>;
  @useResult
  $Res call({String? name, String? code, String? description, int? statusCode});
}

/// @nodoc
class _$Auth0ApiExceptionCopyWithImpl<$Res, $Val extends Auth0ApiException>
    implements $Auth0ApiExceptionCopyWith<$Res> {
  _$Auth0ApiExceptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? code = freezed,
    Object? description = freezed,
    Object? statusCode = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$Auth0ApiExceptionImplCopyWith<$Res>
    implements $Auth0ApiExceptionCopyWith<$Res> {
  factory _$$Auth0ApiExceptionImplCopyWith(_$Auth0ApiExceptionImpl value,
          $Res Function(_$Auth0ApiExceptionImpl) then) =
      __$$Auth0ApiExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, String? code, String? description, int? statusCode});
}

/// @nodoc
class __$$Auth0ApiExceptionImplCopyWithImpl<$Res>
    extends _$Auth0ApiExceptionCopyWithImpl<$Res, _$Auth0ApiExceptionImpl>
    implements _$$Auth0ApiExceptionImplCopyWith<$Res> {
  __$$Auth0ApiExceptionImplCopyWithImpl(_$Auth0ApiExceptionImpl _value,
      $Res Function(_$Auth0ApiExceptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? code = freezed,
    Object? description = freezed,
    Object? statusCode = freezed,
  }) {
    return _then(_$Auth0ApiExceptionImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$Auth0ApiExceptionImpl
    with DiagnosticableTreeMixin
    implements _Auth0ApiException {
  const _$Auth0ApiExceptionImpl(
      {this.name, this.code, this.description, this.statusCode});

  factory _$Auth0ApiExceptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$Auth0ApiExceptionImplFromJson(json);

  @override
  final String? name;
  @override
  final String? code;
  @override
  final String? description;
  @override
  final int? statusCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Auth0ApiException(name: $name, code: $code, description: $description, statusCode: $statusCode)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Auth0ApiException'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('code', code))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('statusCode', statusCode));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Auth0ApiExceptionImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, code, description, statusCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$Auth0ApiExceptionImplCopyWith<_$Auth0ApiExceptionImpl> get copyWith =>
      __$$Auth0ApiExceptionImplCopyWithImpl<_$Auth0ApiExceptionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$Auth0ApiExceptionImplToJson(
      this,
    );
  }
}

abstract class _Auth0ApiException implements Auth0ApiException {
  const factory _Auth0ApiException(
      {final String? name,
      final String? code,
      final String? description,
      final int? statusCode}) = _$Auth0ApiExceptionImpl;

  factory _Auth0ApiException.fromJson(Map<String, dynamic> json) =
      _$Auth0ApiExceptionImpl.fromJson;

  @override
  String? get name;
  @override
  String? get code;
  @override
  String? get description;
  @override
  int? get statusCode;
  @override
  @JsonKey(ignore: true)
  _$$Auth0ApiExceptionImplCopyWith<_$Auth0ApiExceptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
