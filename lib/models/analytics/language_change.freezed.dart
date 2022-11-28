// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'language_change.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LanguageChange _$LanguageChangeFromJson(Map<String, dynamic> json) {
  return _LanguageChange.fromJson(json);
}

/// @nodoc
mixin _$LanguageChange {
  String get languageFrom => throw _privateConstructorUsedError;
  String get languageTo => throw _privateConstructorUsedError;
  String get languageChangeType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LanguageChangeCopyWith<LanguageChange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LanguageChangeCopyWith<$Res> {
  factory $LanguageChangeCopyWith(
          LanguageChange value, $Res Function(LanguageChange) then) =
      _$LanguageChangeCopyWithImpl<$Res, LanguageChange>;
  @useResult
  $Res call(
      {String languageFrom, String languageTo, String languageChangeType});
}

/// @nodoc
class _$LanguageChangeCopyWithImpl<$Res, $Val extends LanguageChange>
    implements $LanguageChangeCopyWith<$Res> {
  _$LanguageChangeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? languageFrom = null,
    Object? languageTo = null,
    Object? languageChangeType = null,
  }) {
    return _then(_value.copyWith(
      languageFrom: null == languageFrom
          ? _value.languageFrom
          : languageFrom // ignore: cast_nullable_to_non_nullable
              as String,
      languageTo: null == languageTo
          ? _value.languageTo
          : languageTo // ignore: cast_nullable_to_non_nullable
              as String,
      languageChangeType: null == languageChangeType
          ? _value.languageChangeType
          : languageChangeType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LanguageChangeCopyWith<$Res>
    implements $LanguageChangeCopyWith<$Res> {
  factory _$$_LanguageChangeCopyWith(
          _$_LanguageChange value, $Res Function(_$_LanguageChange) then) =
      __$$_LanguageChangeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String languageFrom, String languageTo, String languageChangeType});
}

/// @nodoc
class __$$_LanguageChangeCopyWithImpl<$Res>
    extends _$LanguageChangeCopyWithImpl<$Res, _$_LanguageChange>
    implements _$$_LanguageChangeCopyWith<$Res> {
  __$$_LanguageChangeCopyWithImpl(
      _$_LanguageChange _value, $Res Function(_$_LanguageChange) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? languageFrom = null,
    Object? languageTo = null,
    Object? languageChangeType = null,
  }) {
    return _then(_$_LanguageChange(
      languageFrom: null == languageFrom
          ? _value.languageFrom
          : languageFrom // ignore: cast_nullable_to_non_nullable
              as String,
      languageTo: null == languageTo
          ? _value.languageTo
          : languageTo // ignore: cast_nullable_to_non_nullable
              as String,
      languageChangeType: null == languageChangeType
          ? _value.languageChangeType
          : languageChangeType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LanguageChange implements _LanguageChange {
  const _$_LanguageChange(
      {required this.languageFrom,
      required this.languageTo,
      required this.languageChangeType});

  factory _$_LanguageChange.fromJson(Map<String, dynamic> json) =>
      _$$_LanguageChangeFromJson(json);

  @override
  final String languageFrom;
  @override
  final String languageTo;
  @override
  final String languageChangeType;

  @override
  String toString() {
    return 'LanguageChange(languageFrom: $languageFrom, languageTo: $languageTo, languageChangeType: $languageChangeType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LanguageChange &&
            (identical(other.languageFrom, languageFrom) ||
                other.languageFrom == languageFrom) &&
            (identical(other.languageTo, languageTo) ||
                other.languageTo == languageTo) &&
            (identical(other.languageChangeType, languageChangeType) ||
                other.languageChangeType == languageChangeType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, languageFrom, languageTo, languageChangeType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LanguageChangeCopyWith<_$_LanguageChange> get copyWith =>
      __$$_LanguageChangeCopyWithImpl<_$_LanguageChange>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LanguageChangeToJson(
      this,
    );
  }
}

abstract class _LanguageChange implements LanguageChange {
  const factory _LanguageChange(
      {required final String languageFrom,
      required final String languageTo,
      required final String languageChangeType}) = _$_LanguageChange;

  factory _LanguageChange.fromJson(Map<String, dynamic> json) =
      _$_LanguageChange.fromJson;

  @override
  String get languageFrom;
  @override
  String get languageTo;
  @override
  String get languageChangeType;
  @override
  @JsonKey(ignore: true)
  _$$_LanguageChangeCopyWith<_$_LanguageChange> get copyWith =>
      throw _privateConstructorUsedError;
}
