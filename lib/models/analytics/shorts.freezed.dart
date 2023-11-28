// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shorts.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ShortStartedEvent _$ShortStartedEventFromJson(Map<String, dynamic> json) {
  return _ShortStartedEvent.fromJson(json);
}

/// @nodoc
mixin _$ShortStartedEvent {
  String get shortId => throw _privateConstructorUsedError;
  String get shortTitle => throw _privateConstructorUsedError;
  int get replayCount => throw _privateConstructorUsedError;
  bool get resumed => throw _privateConstructorUsedError;
  double get positionFraction => throw _privateConstructorUsedError;
  int get positionSeconds => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShortStartedEventCopyWith<ShortStartedEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShortStartedEventCopyWith<$Res> {
  factory $ShortStartedEventCopyWith(
          ShortStartedEvent value, $Res Function(ShortStartedEvent) then) =
      _$ShortStartedEventCopyWithImpl<$Res, ShortStartedEvent>;
  @useResult
  $Res call(
      {String shortId,
      String shortTitle,
      int replayCount,
      bool resumed,
      double positionFraction,
      int positionSeconds});
}

/// @nodoc
class _$ShortStartedEventCopyWithImpl<$Res, $Val extends ShortStartedEvent>
    implements $ShortStartedEventCopyWith<$Res> {
  _$ShortStartedEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shortId = null,
    Object? shortTitle = null,
    Object? replayCount = null,
    Object? resumed = null,
    Object? positionFraction = null,
    Object? positionSeconds = null,
  }) {
    return _then(_value.copyWith(
      shortId: null == shortId
          ? _value.shortId
          : shortId // ignore: cast_nullable_to_non_nullable
              as String,
      shortTitle: null == shortTitle
          ? _value.shortTitle
          : shortTitle // ignore: cast_nullable_to_non_nullable
              as String,
      replayCount: null == replayCount
          ? _value.replayCount
          : replayCount // ignore: cast_nullable_to_non_nullable
              as int,
      resumed: null == resumed
          ? _value.resumed
          : resumed // ignore: cast_nullable_to_non_nullable
              as bool,
      positionFraction: null == positionFraction
          ? _value.positionFraction
          : positionFraction // ignore: cast_nullable_to_non_nullable
              as double,
      positionSeconds: null == positionSeconds
          ? _value.positionSeconds
          : positionSeconds // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShortStartedEventImplCopyWith<$Res>
    implements $ShortStartedEventCopyWith<$Res> {
  factory _$$ShortStartedEventImplCopyWith(_$ShortStartedEventImpl value,
          $Res Function(_$ShortStartedEventImpl) then) =
      __$$ShortStartedEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String shortId,
      String shortTitle,
      int replayCount,
      bool resumed,
      double positionFraction,
      int positionSeconds});
}

/// @nodoc
class __$$ShortStartedEventImplCopyWithImpl<$Res>
    extends _$ShortStartedEventCopyWithImpl<$Res, _$ShortStartedEventImpl>
    implements _$$ShortStartedEventImplCopyWith<$Res> {
  __$$ShortStartedEventImplCopyWithImpl(_$ShortStartedEventImpl _value,
      $Res Function(_$ShortStartedEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shortId = null,
    Object? shortTitle = null,
    Object? replayCount = null,
    Object? resumed = null,
    Object? positionFraction = null,
    Object? positionSeconds = null,
  }) {
    return _then(_$ShortStartedEventImpl(
      shortId: null == shortId
          ? _value.shortId
          : shortId // ignore: cast_nullable_to_non_nullable
              as String,
      shortTitle: null == shortTitle
          ? _value.shortTitle
          : shortTitle // ignore: cast_nullable_to_non_nullable
              as String,
      replayCount: null == replayCount
          ? _value.replayCount
          : replayCount // ignore: cast_nullable_to_non_nullable
              as int,
      resumed: null == resumed
          ? _value.resumed
          : resumed // ignore: cast_nullable_to_non_nullable
              as bool,
      positionFraction: null == positionFraction
          ? _value.positionFraction
          : positionFraction // ignore: cast_nullable_to_non_nullable
              as double,
      positionSeconds: null == positionSeconds
          ? _value.positionSeconds
          : positionSeconds // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ShortStartedEventImpl implements _ShortStartedEvent {
  const _$ShortStartedEventImpl(
      {required this.shortId,
      required this.shortTitle,
      required this.replayCount,
      required this.resumed,
      required this.positionFraction,
      required this.positionSeconds});

  factory _$ShortStartedEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShortStartedEventImplFromJson(json);

  @override
  final String shortId;
  @override
  final String shortTitle;
  @override
  final int replayCount;
  @override
  final bool resumed;
  @override
  final double positionFraction;
  @override
  final int positionSeconds;

  @override
  String toString() {
    return 'ShortStartedEvent(shortId: $shortId, shortTitle: $shortTitle, replayCount: $replayCount, resumed: $resumed, positionFraction: $positionFraction, positionSeconds: $positionSeconds)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShortStartedEventImpl &&
            (identical(other.shortId, shortId) || other.shortId == shortId) &&
            (identical(other.shortTitle, shortTitle) ||
                other.shortTitle == shortTitle) &&
            (identical(other.replayCount, replayCount) ||
                other.replayCount == replayCount) &&
            (identical(other.resumed, resumed) || other.resumed == resumed) &&
            (identical(other.positionFraction, positionFraction) ||
                other.positionFraction == positionFraction) &&
            (identical(other.positionSeconds, positionSeconds) ||
                other.positionSeconds == positionSeconds));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, shortId, shortTitle, replayCount,
      resumed, positionFraction, positionSeconds);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShortStartedEventImplCopyWith<_$ShortStartedEventImpl> get copyWith =>
      __$$ShortStartedEventImplCopyWithImpl<_$ShortStartedEventImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShortStartedEventImplToJson(
      this,
    );
  }
}

abstract class _ShortStartedEvent implements ShortStartedEvent {
  const factory _ShortStartedEvent(
      {required final String shortId,
      required final String shortTitle,
      required final int replayCount,
      required final bool resumed,
      required final double positionFraction,
      required final int positionSeconds}) = _$ShortStartedEventImpl;

  factory _ShortStartedEvent.fromJson(Map<String, dynamic> json) =
      _$ShortStartedEventImpl.fromJson;

  @override
  String get shortId;
  @override
  String get shortTitle;
  @override
  int get replayCount;
  @override
  bool get resumed;
  @override
  double get positionFraction;
  @override
  int get positionSeconds;
  @override
  @JsonKey(ignore: true)
  _$$ShortStartedEventImplCopyWith<_$ShortStartedEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ShortStoppedEvent _$ShortStoppedEventFromJson(Map<String, dynamic> json) {
  return _ShortStoppedEvent.fromJson(json);
}

/// @nodoc
mixin _$ShortStoppedEvent {
  String get shortId => throw _privateConstructorUsedError;
  String? get shortTitle => throw _privateConstructorUsedError;
  double get positionFraction => throw _privateConstructorUsedError;
  int get positionSeconds => throw _privateConstructorUsedError;
  int get replayCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShortStoppedEventCopyWith<ShortStoppedEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShortStoppedEventCopyWith<$Res> {
  factory $ShortStoppedEventCopyWith(
          ShortStoppedEvent value, $Res Function(ShortStoppedEvent) then) =
      _$ShortStoppedEventCopyWithImpl<$Res, ShortStoppedEvent>;
  @useResult
  $Res call(
      {String shortId,
      String? shortTitle,
      double positionFraction,
      int positionSeconds,
      int replayCount});
}

/// @nodoc
class _$ShortStoppedEventCopyWithImpl<$Res, $Val extends ShortStoppedEvent>
    implements $ShortStoppedEventCopyWith<$Res> {
  _$ShortStoppedEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shortId = null,
    Object? shortTitle = freezed,
    Object? positionFraction = null,
    Object? positionSeconds = null,
    Object? replayCount = null,
  }) {
    return _then(_value.copyWith(
      shortId: null == shortId
          ? _value.shortId
          : shortId // ignore: cast_nullable_to_non_nullable
              as String,
      shortTitle: freezed == shortTitle
          ? _value.shortTitle
          : shortTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      positionFraction: null == positionFraction
          ? _value.positionFraction
          : positionFraction // ignore: cast_nullable_to_non_nullable
              as double,
      positionSeconds: null == positionSeconds
          ? _value.positionSeconds
          : positionSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      replayCount: null == replayCount
          ? _value.replayCount
          : replayCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShortStoppedEventImplCopyWith<$Res>
    implements $ShortStoppedEventCopyWith<$Res> {
  factory _$$ShortStoppedEventImplCopyWith(_$ShortStoppedEventImpl value,
          $Res Function(_$ShortStoppedEventImpl) then) =
      __$$ShortStoppedEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String shortId,
      String? shortTitle,
      double positionFraction,
      int positionSeconds,
      int replayCount});
}

/// @nodoc
class __$$ShortStoppedEventImplCopyWithImpl<$Res>
    extends _$ShortStoppedEventCopyWithImpl<$Res, _$ShortStoppedEventImpl>
    implements _$$ShortStoppedEventImplCopyWith<$Res> {
  __$$ShortStoppedEventImplCopyWithImpl(_$ShortStoppedEventImpl _value,
      $Res Function(_$ShortStoppedEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shortId = null,
    Object? shortTitle = freezed,
    Object? positionFraction = null,
    Object? positionSeconds = null,
    Object? replayCount = null,
  }) {
    return _then(_$ShortStoppedEventImpl(
      shortId: null == shortId
          ? _value.shortId
          : shortId // ignore: cast_nullable_to_non_nullable
              as String,
      shortTitle: freezed == shortTitle
          ? _value.shortTitle
          : shortTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      positionFraction: null == positionFraction
          ? _value.positionFraction
          : positionFraction // ignore: cast_nullable_to_non_nullable
              as double,
      positionSeconds: null == positionSeconds
          ? _value.positionSeconds
          : positionSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      replayCount: null == replayCount
          ? _value.replayCount
          : replayCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ShortStoppedEventImpl implements _ShortStoppedEvent {
  const _$ShortStoppedEventImpl(
      {required this.shortId,
      required this.shortTitle,
      required this.positionFraction,
      required this.positionSeconds,
      required this.replayCount});

  factory _$ShortStoppedEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShortStoppedEventImplFromJson(json);

  @override
  final String shortId;
  @override
  final String? shortTitle;
  @override
  final double positionFraction;
  @override
  final int positionSeconds;
  @override
  final int replayCount;

  @override
  String toString() {
    return 'ShortStoppedEvent(shortId: $shortId, shortTitle: $shortTitle, positionFraction: $positionFraction, positionSeconds: $positionSeconds, replayCount: $replayCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShortStoppedEventImpl &&
            (identical(other.shortId, shortId) || other.shortId == shortId) &&
            (identical(other.shortTitle, shortTitle) ||
                other.shortTitle == shortTitle) &&
            (identical(other.positionFraction, positionFraction) ||
                other.positionFraction == positionFraction) &&
            (identical(other.positionSeconds, positionSeconds) ||
                other.positionSeconds == positionSeconds) &&
            (identical(other.replayCount, replayCount) ||
                other.replayCount == replayCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, shortId, shortTitle,
      positionFraction, positionSeconds, replayCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShortStoppedEventImplCopyWith<_$ShortStoppedEventImpl> get copyWith =>
      __$$ShortStoppedEventImplCopyWithImpl<_$ShortStoppedEventImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShortStoppedEventImplToJson(
      this,
    );
  }
}

abstract class _ShortStoppedEvent implements ShortStoppedEvent {
  const factory _ShortStoppedEvent(
      {required final String shortId,
      required final String? shortTitle,
      required final double positionFraction,
      required final int positionSeconds,
      required final int replayCount}) = _$ShortStoppedEventImpl;

  factory _ShortStoppedEvent.fromJson(Map<String, dynamic> json) =
      _$ShortStoppedEventImpl.fromJson;

  @override
  String get shortId;
  @override
  String? get shortTitle;
  @override
  double get positionFraction;
  @override
  int get positionSeconds;
  @override
  int get replayCount;
  @override
  @JsonKey(ignore: true)
  _$$ShortStoppedEventImplCopyWith<_$ShortStoppedEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
