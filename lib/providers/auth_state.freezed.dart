// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthState {
  UserProfile? get user => throw _privateConstructorUsedError;
  String? get auth0AccessToken => throw _privateConstructorUsedError;
  DateTime? get expiresAt => throw _privateConstructorUsedError;
  String? get idToken => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res>;
  $Res call(
      {UserProfile? user,
      String? auth0AccessToken,
      DateTime? expiresAt,
      String? idToken});
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res> implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  final AuthState _value;
  // ignore: unused_field
  final $Res Function(AuthState) _then;

  @override
  $Res call({
    Object? user = freezed,
    Object? auth0AccessToken = freezed,
    Object? expiresAt = freezed,
    Object? idToken = freezed,
  }) {
    return _then(_value.copyWith(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserProfile?,
      auth0AccessToken: auth0AccessToken == freezed
          ? _value.auth0AccessToken
          : auth0AccessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      expiresAt: expiresAt == freezed
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      idToken: idToken == freezed
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_AuthCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$$_AuthCopyWith(_$_Auth value, $Res Function(_$_Auth) then) =
      __$$_AuthCopyWithImpl<$Res>;
  @override
  $Res call(
      {UserProfile? user,
      String? auth0AccessToken,
      DateTime? expiresAt,
      String? idToken});
}

/// @nodoc
class __$$_AuthCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$$_AuthCopyWith<$Res> {
  __$$_AuthCopyWithImpl(_$_Auth _value, $Res Function(_$_Auth) _then)
      : super(_value, (v) => _then(v as _$_Auth));

  @override
  _$_Auth get _value => super._value as _$_Auth;

  @override
  $Res call({
    Object? user = freezed,
    Object? auth0AccessToken = freezed,
    Object? expiresAt = freezed,
    Object? idToken = freezed,
  }) {
    return _then(_$_Auth(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserProfile?,
      auth0AccessToken: auth0AccessToken == freezed
          ? _value.auth0AccessToken
          : auth0AccessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      expiresAt: expiresAt == freezed
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      idToken: idToken == freezed
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Auth extends _Auth {
  const _$_Auth(
      {this.user, this.auth0AccessToken, this.expiresAt, this.idToken})
      : super._();

  @override
  final UserProfile? user;
  @override
  final String? auth0AccessToken;
  @override
  final DateTime? expiresAt;
  @override
  final String? idToken;

  @override
  String toString() {
    return 'AuthState(user: $user, auth0AccessToken: $auth0AccessToken, expiresAt: $expiresAt, idToken: $idToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Auth &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality()
                .equals(other.auth0AccessToken, auth0AccessToken) &&
            const DeepCollectionEquality().equals(other.expiresAt, expiresAt) &&
            const DeepCollectionEquality().equals(other.idToken, idToken));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(auth0AccessToken),
      const DeepCollectionEquality().hash(expiresAt),
      const DeepCollectionEquality().hash(idToken));

  @JsonKey(ignore: true)
  @override
  _$$_AuthCopyWith<_$_Auth> get copyWith =>
      __$$_AuthCopyWithImpl<_$_Auth>(this, _$identity);
}

abstract class _Auth extends AuthState {
  const factory _Auth(
      {final UserProfile? user,
      final String? auth0AccessToken,
      final DateTime? expiresAt,
      final String? idToken}) = _$_Auth;
  const _Auth._() : super._();

  @override
  UserProfile? get user;
  @override
  String? get auth0AccessToken;
  @override
  DateTime? get expiresAt;
  @override
  String? get idToken;
  @override
  @JsonKey(ignore: true)
  _$$_AuthCopyWith<_$_Auth> get copyWith => throw _privateConstructorUsedError;
}
