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
  bool get loading => throw _privateConstructorUsedError;
  UserProfile? get user => throw _privateConstructorUsedError;
  String? get auth0AccessToken => throw _privateConstructorUsedError;
  String? get idToken => throw _privateConstructorUsedError;
  bool get guestUser => throw _privateConstructorUsedError;

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
      {bool loading,
      UserProfile? user,
      String? auth0AccessToken,
      String? idToken,
      bool guestUser});
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
    Object? loading = null,
    Object? user = freezed,
    Object? auth0AccessToken = freezed,
    Object? idToken = freezed,
    Object? guestUser = null,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserProfile?,
      auth0AccessToken: freezed == auth0AccessToken
          ? _value.auth0AccessToken
          : auth0AccessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      idToken: freezed == idToken
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String?,
      guestUser: null == guestUser
          ? _value.guestUser
          : guestUser // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AuthCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$$_AuthCopyWith(_$_Auth value, $Res Function(_$_Auth) then) =
      __$$_AuthCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool loading,
      UserProfile? user,
      String? auth0AccessToken,
      String? idToken,
      bool guestUser});
}

/// @nodoc
class __$$_AuthCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res, _$_Auth>
    implements _$$_AuthCopyWith<$Res> {
  __$$_AuthCopyWithImpl(_$_Auth _value, $Res Function(_$_Auth) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? user = freezed,
    Object? auth0AccessToken = freezed,
    Object? idToken = freezed,
    Object? guestUser = null,
  }) {
    return _then(_$_Auth(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserProfile?,
      auth0AccessToken: freezed == auth0AccessToken
          ? _value.auth0AccessToken
          : auth0AccessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      idToken: freezed == idToken
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String?,
      guestUser: null == guestUser
          ? _value.guestUser
          : guestUser // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Auth implements _Auth {
  const _$_Auth(
      {this.loading = false,
      this.user,
      this.auth0AccessToken,
      this.idToken,
      this.guestUser = false});

  @override
  @JsonKey()
  final bool loading;
  @override
  final UserProfile? user;
  @override
  final String? auth0AccessToken;
  @override
  final String? idToken;
  @override
  @JsonKey()
  final bool guestUser;

  @override
  String toString() {
    return 'AuthState(loading: $loading, user: $user, auth0AccessToken: $auth0AccessToken, idToken: $idToken, guestUser: $guestUser)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Auth &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.auth0AccessToken, auth0AccessToken) ||
                other.auth0AccessToken == auth0AccessToken) &&
            (identical(other.idToken, idToken) || other.idToken == idToken) &&
            (identical(other.guestUser, guestUser) ||
                other.guestUser == guestUser));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, loading, user, auth0AccessToken, idToken, guestUser);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthCopyWith<_$_Auth> get copyWith =>
      __$$_AuthCopyWithImpl<_$_Auth>(this, _$identity);
}

abstract class _Auth implements AuthState {
  const factory _Auth(
      {final bool loading,
      final UserProfile? user,
      final String? auth0AccessToken,
      final String? idToken,
      final bool guestUser}) = _$_Auth;

  @override
  bool get loading;
  @override
  UserProfile? get user;
  @override
  String? get auth0AccessToken;
  @override
  String? get idToken;
  @override
  bool get guestUser;
  @override
  @JsonKey(ignore: true)
  _$$_AuthCopyWith<_$_Auth> get copyWith => throw _privateConstructorUsedError;
}
