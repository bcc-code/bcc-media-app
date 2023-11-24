// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'language_changed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LanguageChangedEvent _$LanguageChangedEventFromJson(Map<String, dynamic> json) {
  return _LanguageChangedEvent.fromJson(json);
}

/// @nodoc
mixin _$LanguageChangedEvent {
  String? get languageFrom => throw _privateConstructorUsedError;
  String get languageTo => throw _privateConstructorUsedError;
  String get languageChangeType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LanguageChangedEventCopyWith<LanguageChangedEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LanguageChangedEventCopyWith<$Res> {
  factory $LanguageChangedEventCopyWith(LanguageChangedEvent value,
          $Res Function(LanguageChangedEvent) then) =
      _$LanguageChangedEventCopyWithImpl<$Res, LanguageChangedEvent>;
  @useResult
  $Res call(
      {String? languageFrom, String languageTo, String languageChangeType});
}

/// @nodoc
class _$LanguageChangedEventCopyWithImpl<$Res,
        $Val extends LanguageChangedEvent>
    implements $LanguageChangedEventCopyWith<$Res> {
  _$LanguageChangedEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? languageFrom = freezed,
    Object? languageTo = null,
    Object? languageChangeType = null,
  }) {
    return _then(_value.copyWith(
      languageFrom: freezed == languageFrom
          ? _value.languageFrom
          : languageFrom // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$LanguageChangedEventImplCopyWith<$Res>
    implements $LanguageChangedEventCopyWith<$Res> {
  factory _$$LanguageChangedEventImplCopyWith(_$LanguageChangedEventImpl value,
          $Res Function(_$LanguageChangedEventImpl) then) =
      __$$LanguageChangedEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? languageFrom, String languageTo, String languageChangeType});
}

/// @nodoc
class __$$LanguageChangedEventImplCopyWithImpl<$Res>
    extends _$LanguageChangedEventCopyWithImpl<$Res, _$LanguageChangedEventImpl>
    implements _$$LanguageChangedEventImplCopyWith<$Res> {
  __$$LanguageChangedEventImplCopyWithImpl(_$LanguageChangedEventImpl _value,
      $Res Function(_$LanguageChangedEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? languageFrom = freezed,
    Object? languageTo = null,
    Object? languageChangeType = null,
  }) {
    return _then(_$LanguageChangedEventImpl(
      languageFrom: freezed == languageFrom
          ? _value.languageFrom
          : languageFrom // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _$LanguageChangedEventImpl implements _LanguageChangedEvent {
  const _$LanguageChangedEventImpl(
      {required this.languageFrom,
      required this.languageTo,
      required this.languageChangeType});

  factory _$LanguageChangedEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$LanguageChangedEventImplFromJson(json);

  @override
  final String? languageFrom;
  @override
  final String languageTo;
  @override
  final String languageChangeType;

  @override
  String toString() {
    return 'LanguageChangedEvent(languageFrom: $languageFrom, languageTo: $languageTo, languageChangeType: $languageChangeType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LanguageChangedEventImpl &&
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
  _$$LanguageChangedEventImplCopyWith<_$LanguageChangedEventImpl>
      get copyWith =>
          __$$LanguageChangedEventImplCopyWithImpl<_$LanguageChangedEventImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LanguageChangedEventImplToJson(
      this,
    );
  }
}

abstract class _LanguageChangedEvent implements LanguageChangedEvent {
  const factory _LanguageChangedEvent(
      {required final String? languageFrom,
      required final String languageTo,
      required final String languageChangeType}) = _$LanguageChangedEventImpl;

  factory _LanguageChangedEvent.fromJson(Map<String, dynamic> json) =
      _$LanguageChangedEventImpl.fromJson;

  @override
  String? get languageFrom;
  @override
  String get languageTo;
  @override
  String get languageChangeType;
  @override
  @JsonKey(ignore: true)
  _$$LanguageChangedEventImplCopyWith<_$LanguageChangedEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}
