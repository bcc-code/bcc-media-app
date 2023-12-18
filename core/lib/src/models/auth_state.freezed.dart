// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthState {
  Auth0IdToken? get user => throw _privateConstructorUsedError;
  String? get auth0AccessToken => throw _privateConstructorUsedError;
  DateTime? get expiresAt => throw _privateConstructorUsedError;
  String? get idToken => throw _privateConstructorUsedError;
  bool? get signedOutManually => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
  @useResult
  $Res call(
      {Auth0IdToken? user,
      String? auth0AccessToken,
      DateTime? expiresAt,
      String? idToken,
      bool? signedOutManually});
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? auth0AccessToken = freezed,
    Object? expiresAt = freezed,
    Object? idToken = freezed,
    Object? signedOutManually = freezed,
  }) {
    return _then(_value.copyWith(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as Auth0IdToken?,
      auth0AccessToken: freezed == auth0AccessToken
          ? _value.auth0AccessToken
          : auth0AccessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      idToken: freezed == idToken
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String?,
      signedOutManually: freezed == signedOutManually
          ? _value.signedOutManually
          : signedOutManually // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthImplCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$$AuthImplCopyWith(
          _$AuthImpl value, $Res Function(_$AuthImpl) then) =
      __$$AuthImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Auth0IdToken? user,
      String? auth0AccessToken,
      DateTime? expiresAt,
      String? idToken,
      bool? signedOutManually});
}

/// @nodoc
class __$$AuthImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthImpl>
    implements _$$AuthImplCopyWith<$Res> {
  __$$AuthImplCopyWithImpl(_$AuthImpl _value, $Res Function(_$AuthImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? auth0AccessToken = freezed,
    Object? expiresAt = freezed,
    Object? idToken = freezed,
    Object? signedOutManually = freezed,
  }) {
    return _then(_$AuthImpl(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as Auth0IdToken?,
      auth0AccessToken: freezed == auth0AccessToken
          ? _value.auth0AccessToken
          : auth0AccessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      idToken: freezed == idToken
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String?,
      signedOutManually: freezed == signedOutManually
          ? _value.signedOutManually
          : signedOutManually // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$AuthImpl extends _Auth {
  const _$AuthImpl(
      {this.user,
      this.auth0AccessToken,
      this.expiresAt,
      this.idToken,
      this.signedOutManually})
      : super._();

  @override
  final Auth0IdToken? user;
  @override
  final String? auth0AccessToken;
  @override
  final DateTime? expiresAt;
  @override
  final String? idToken;
  @override
  final bool? signedOutManually;

  @override
  String toString() {
    return 'AuthState(user: $user, auth0AccessToken: $auth0AccessToken, expiresAt: $expiresAt, idToken: $idToken, signedOutManually: $signedOutManually)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.auth0AccessToken, auth0AccessToken) ||
                other.auth0AccessToken == auth0AccessToken) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.idToken, idToken) || other.idToken == idToken) &&
            (identical(other.signedOutManually, signedOutManually) ||
                other.signedOutManually == signedOutManually));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, auth0AccessToken,
      expiresAt, idToken, signedOutManually);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthImplCopyWith<_$AuthImpl> get copyWith =>
      __$$AuthImplCopyWithImpl<_$AuthImpl>(this, _$identity);
}

abstract class _Auth extends AuthState {
  const factory _Auth(
      {final Auth0IdToken? user,
      final String? auth0AccessToken,
      final DateTime? expiresAt,
      final String? idToken,
      final bool? signedOutManually}) = _$AuthImpl;
  const _Auth._() : super._();

  @override
  Auth0IdToken? get user;
  @override
  String? get auth0AccessToken;
  @override
  DateTime? get expiresAt;
  @override
  String? get idToken;
  @override
  bool? get signedOutManually;
  @override
  @JsonKey(ignore: true)
  _$$AuthImplCopyWith<_$AuthImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
