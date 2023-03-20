// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feature_flags.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FeatureFlags {
  bool get signup => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FeatureFlagsCopyWith<FeatureFlags> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeatureFlagsCopyWith<$Res> {
  factory $FeatureFlagsCopyWith(
          FeatureFlags value, $Res Function(FeatureFlags) then) =
      _$FeatureFlagsCopyWithImpl<$Res, FeatureFlags>;
  @useResult
  $Res call({bool signup});
}

/// @nodoc
class _$FeatureFlagsCopyWithImpl<$Res, $Val extends FeatureFlags>
    implements $FeatureFlagsCopyWith<$Res> {
  _$FeatureFlagsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? signup = null,
  }) {
    return _then(_value.copyWith(
      signup: null == signup
          ? _value.signup
          : signup // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FeatureFlagsCopyWith<$Res>
    implements $FeatureFlagsCopyWith<$Res> {
  factory _$$_FeatureFlagsCopyWith(
          _$_FeatureFlags value, $Res Function(_$_FeatureFlags) then) =
      __$$_FeatureFlagsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool signup});
}

/// @nodoc
class __$$_FeatureFlagsCopyWithImpl<$Res>
    extends _$FeatureFlagsCopyWithImpl<$Res, _$_FeatureFlags>
    implements _$$_FeatureFlagsCopyWith<$Res> {
  __$$_FeatureFlagsCopyWithImpl(
      _$_FeatureFlags _value, $Res Function(_$_FeatureFlags) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? signup = null,
  }) {
    return _then(_$_FeatureFlags(
      signup: null == signup
          ? _value.signup
          : signup // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_FeatureFlags extends _FeatureFlags {
  const _$_FeatureFlags({this.signup = false}) : super._();

  @override
  @JsonKey()
  final bool signup;

  @override
  String toString() {
    return 'FeatureFlags(signup: $signup)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FeatureFlags &&
            (identical(other.signup, signup) || other.signup == signup));
  }

  @override
  int get hashCode => Object.hash(runtimeType, signup);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FeatureFlagsCopyWith<_$_FeatureFlags> get copyWith =>
      __$$_FeatureFlagsCopyWithImpl<_$_FeatureFlags>(this, _$identity);
}

abstract class _FeatureFlags extends FeatureFlags {
  const factory _FeatureFlags({final bool signup}) = _$_FeatureFlags;
  const _FeatureFlags._() : super._();

  @override
  bool get signup;
  @override
  @JsonKey(ignore: true)
  _$$_FeatureFlagsCopyWith<_$_FeatureFlags> get copyWith =>
      throw _privateConstructorUsedError;
}
