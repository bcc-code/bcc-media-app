// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'survey.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CompletedSurveys _$CompletedSurveysFromJson(Map<String, dynamic> json) {
  return _CompletedSurveys.fromJson(json);
}

/// @nodoc
mixin _$CompletedSurveys {
  List<CompletedSurvey> get completedSurveys =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CompletedSurveysCopyWith<CompletedSurveys> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompletedSurveysCopyWith<$Res> {
  factory $CompletedSurveysCopyWith(
          CompletedSurveys value, $Res Function(CompletedSurveys) then) =
      _$CompletedSurveysCopyWithImpl<$Res, CompletedSurveys>;
  @useResult
  $Res call({List<CompletedSurvey> completedSurveys});
}

/// @nodoc
class _$CompletedSurveysCopyWithImpl<$Res, $Val extends CompletedSurveys>
    implements $CompletedSurveysCopyWith<$Res> {
  _$CompletedSurveysCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? completedSurveys = null,
  }) {
    return _then(_value.copyWith(
      completedSurveys: null == completedSurveys
          ? _value.completedSurveys
          : completedSurveys // ignore: cast_nullable_to_non_nullable
              as List<CompletedSurvey>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CompletedSurveysCopyWith<$Res>
    implements $CompletedSurveysCopyWith<$Res> {
  factory _$$_CompletedSurveysCopyWith(
          _$_CompletedSurveys value, $Res Function(_$_CompletedSurveys) then) =
      __$$_CompletedSurveysCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CompletedSurvey> completedSurveys});
}

/// @nodoc
class __$$_CompletedSurveysCopyWithImpl<$Res>
    extends _$CompletedSurveysCopyWithImpl<$Res, _$_CompletedSurveys>
    implements _$$_CompletedSurveysCopyWith<$Res> {
  __$$_CompletedSurveysCopyWithImpl(
      _$_CompletedSurveys _value, $Res Function(_$_CompletedSurveys) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? completedSurveys = null,
  }) {
    return _then(_$_CompletedSurveys(
      null == completedSurveys
          ? _value._completedSurveys
          : completedSurveys // ignore: cast_nullable_to_non_nullable
              as List<CompletedSurvey>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CompletedSurveys implements _CompletedSurveys {
  const _$_CompletedSurveys(final List<CompletedSurvey> completedSurveys)
      : _completedSurveys = completedSurveys;

  factory _$_CompletedSurveys.fromJson(Map<String, dynamic> json) =>
      _$$_CompletedSurveysFromJson(json);

  final List<CompletedSurvey> _completedSurveys;
  @override
  List<CompletedSurvey> get completedSurveys {
    if (_completedSurveys is EqualUnmodifiableListView)
      return _completedSurveys;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_completedSurveys);
  }

  @override
  String toString() {
    return 'CompletedSurveys(completedSurveys: $completedSurveys)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CompletedSurveys &&
            const DeepCollectionEquality()
                .equals(other._completedSurveys, _completedSurveys));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_completedSurveys));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CompletedSurveysCopyWith<_$_CompletedSurveys> get copyWith =>
      __$$_CompletedSurveysCopyWithImpl<_$_CompletedSurveys>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CompletedSurveysToJson(
      this,
    );
  }
}

abstract class _CompletedSurveys implements CompletedSurveys {
  const factory _CompletedSurveys(
      final List<CompletedSurvey> completedSurveys) = _$_CompletedSurveys;

  factory _CompletedSurveys.fromJson(Map<String, dynamic> json) =
      _$_CompletedSurveys.fromJson;

  @override
  List<CompletedSurvey> get completedSurveys;
  @override
  @JsonKey(ignore: true)
  _$$_CompletedSurveysCopyWith<_$_CompletedSurveys> get copyWith =>
      throw _privateConstructorUsedError;
}

CompletedSurvey _$CompletedSurveyFromJson(Map<String, dynamic> json) {
  return _CompletedSurvey.fromJson(json);
}

/// @nodoc
mixin _$CompletedSurvey {
  String get id => throw _privateConstructorUsedError;
  DateTime get expiry => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CompletedSurveyCopyWith<CompletedSurvey> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompletedSurveyCopyWith<$Res> {
  factory $CompletedSurveyCopyWith(
          CompletedSurvey value, $Res Function(CompletedSurvey) then) =
      _$CompletedSurveyCopyWithImpl<$Res, CompletedSurvey>;
  @useResult
  $Res call({String id, DateTime expiry});
}

/// @nodoc
class _$CompletedSurveyCopyWithImpl<$Res, $Val extends CompletedSurvey>
    implements $CompletedSurveyCopyWith<$Res> {
  _$CompletedSurveyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? expiry = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      expiry: null == expiry
          ? _value.expiry
          : expiry // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CompletedSurveyCopyWith<$Res>
    implements $CompletedSurveyCopyWith<$Res> {
  factory _$$_CompletedSurveyCopyWith(
          _$_CompletedSurvey value, $Res Function(_$_CompletedSurvey) then) =
      __$$_CompletedSurveyCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, DateTime expiry});
}

/// @nodoc
class __$$_CompletedSurveyCopyWithImpl<$Res>
    extends _$CompletedSurveyCopyWithImpl<$Res, _$_CompletedSurvey>
    implements _$$_CompletedSurveyCopyWith<$Res> {
  __$$_CompletedSurveyCopyWithImpl(
      _$_CompletedSurvey _value, $Res Function(_$_CompletedSurvey) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? expiry = null,
  }) {
    return _then(_$_CompletedSurvey(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      expiry: null == expiry
          ? _value.expiry
          : expiry // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CompletedSurvey implements _CompletedSurvey {
  const _$_CompletedSurvey({required this.id, required this.expiry});

  factory _$_CompletedSurvey.fromJson(Map<String, dynamic> json) =>
      _$$_CompletedSurveyFromJson(json);

  @override
  final String id;
  @override
  final DateTime expiry;

  @override
  String toString() {
    return 'CompletedSurvey(id: $id, expiry: $expiry)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CompletedSurvey &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.expiry, expiry) || other.expiry == expiry));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, expiry);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CompletedSurveyCopyWith<_$_CompletedSurvey> get copyWith =>
      __$$_CompletedSurveyCopyWithImpl<_$_CompletedSurvey>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CompletedSurveyToJson(
      this,
    );
  }
}

abstract class _CompletedSurvey implements CompletedSurvey {
  const factory _CompletedSurvey(
      {required final String id,
      required final DateTime expiry}) = _$_CompletedSurvey;

  factory _CompletedSurvey.fromJson(Map<String, dynamic> json) =
      _$_CompletedSurvey.fromJson;

  @override
  String get id;
  @override
  DateTime get expiry;
  @override
  @JsonKey(ignore: true)
  _$$_CompletedSurveyCopyWith<_$_CompletedSurvey> get copyWith =>
      throw _privateConstructorUsedError;
}
