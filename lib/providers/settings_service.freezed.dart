// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'settings_service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Settings {
  Locale get appLanguage => throw _privateConstructorUsedError;
  String? get audioLanguage => throw _privateConstructorUsedError;
  String? get subtitleLanguage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SettingsCopyWith<Settings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsCopyWith<$Res> {
  factory $SettingsCopyWith(Settings value, $Res Function(Settings) then) =
      _$SettingsCopyWithImpl<$Res>;
  $Res call(
      {Locale appLanguage, String? audioLanguage, String? subtitleLanguage});
}

/// @nodoc
class _$SettingsCopyWithImpl<$Res> implements $SettingsCopyWith<$Res> {
  _$SettingsCopyWithImpl(this._value, this._then);

  final Settings _value;
  // ignore: unused_field
  final $Res Function(Settings) _then;

  @override
  $Res call({
    Object? appLanguage = freezed,
    Object? audioLanguage = freezed,
    Object? subtitleLanguage = freezed,
  }) {
    return _then(_value.copyWith(
      appLanguage: appLanguage == freezed
          ? _value.appLanguage
          : appLanguage // ignore: cast_nullable_to_non_nullable
              as Locale,
      audioLanguage: audioLanguage == freezed
          ? _value.audioLanguage
          : audioLanguage // ignore: cast_nullable_to_non_nullable
              as String?,
      subtitleLanguage: subtitleLanguage == freezed
          ? _value.subtitleLanguage
          : subtitleLanguage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_SettingsCopyWith<$Res> implements $SettingsCopyWith<$Res> {
  factory _$$_SettingsCopyWith(
          _$_Settings value, $Res Function(_$_Settings) then) =
      __$$_SettingsCopyWithImpl<$Res>;
  @override
  $Res call(
      {Locale appLanguage, String? audioLanguage, String? subtitleLanguage});
}

/// @nodoc
class __$$_SettingsCopyWithImpl<$Res> extends _$SettingsCopyWithImpl<$Res>
    implements _$$_SettingsCopyWith<$Res> {
  __$$_SettingsCopyWithImpl(
      _$_Settings _value, $Res Function(_$_Settings) _then)
      : super(_value, (v) => _then(v as _$_Settings));

  @override
  _$_Settings get _value => super._value as _$_Settings;

  @override
  $Res call({
    Object? appLanguage = freezed,
    Object? audioLanguage = freezed,
    Object? subtitleLanguage = freezed,
  }) {
    return _then(_$_Settings(
      appLanguage: appLanguage == freezed
          ? _value.appLanguage
          : appLanguage // ignore: cast_nullable_to_non_nullable
              as Locale,
      audioLanguage: audioLanguage == freezed
          ? _value.audioLanguage
          : audioLanguage // ignore: cast_nullable_to_non_nullable
              as String?,
      subtitleLanguage: subtitleLanguage == freezed
          ? _value.subtitleLanguage
          : subtitleLanguage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Settings implements _Settings {
  const _$_Settings(
      {required this.appLanguage, this.audioLanguage, this.subtitleLanguage});

  @override
  final Locale appLanguage;
  @override
  final String? audioLanguage;
  @override
  final String? subtitleLanguage;

  @override
  String toString() {
    return 'Settings(appLanguage: $appLanguage, audioLanguage: $audioLanguage, subtitleLanguage: $subtitleLanguage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Settings &&
            const DeepCollectionEquality()
                .equals(other.appLanguage, appLanguage) &&
            const DeepCollectionEquality()
                .equals(other.audioLanguage, audioLanguage) &&
            const DeepCollectionEquality()
                .equals(other.subtitleLanguage, subtitleLanguage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(appLanguage),
      const DeepCollectionEquality().hash(audioLanguage),
      const DeepCollectionEquality().hash(subtitleLanguage));

  @JsonKey(ignore: true)
  @override
  _$$_SettingsCopyWith<_$_Settings> get copyWith =>
      __$$_SettingsCopyWithImpl<_$_Settings>(this, _$identity);
}

abstract class _Settings implements Settings {
  const factory _Settings(
      {required final Locale appLanguage,
      final String? audioLanguage,
      final String? subtitleLanguage}) = _$_Settings;

  @override
  Locale get appLanguage;
  @override
  String? get audioLanguage;
  @override
  String? get subtitleLanguage;
  @override
  @JsonKey(ignore: true)
  _$$_SettingsCopyWith<_$_Settings> get copyWith =>
      throw _privateConstructorUsedError;
}
