// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_closed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GameClosedEvent _$GameClosedEventFromJson(Map<String, dynamic> json) {
  return _GameClosedEvent.fromJson(json);
}

/// @nodoc
mixin _$GameClosedEvent {
  String get gameId => throw _privateConstructorUsedError;
  int get timeSpent => throw _privateConstructorUsedError;
  int? get position => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameClosedEventCopyWith<GameClosedEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameClosedEventCopyWith<$Res> {
  factory $GameClosedEventCopyWith(
          GameClosedEvent value, $Res Function(GameClosedEvent) then) =
      _$GameClosedEventCopyWithImpl<$Res, GameClosedEvent>;
  @useResult
  $Res call({String gameId, int timeSpent, int? position});
}

/// @nodoc
class _$GameClosedEventCopyWithImpl<$Res, $Val extends GameClosedEvent>
    implements $GameClosedEventCopyWith<$Res> {
  _$GameClosedEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gameId = null,
    Object? timeSpent = null,
    Object? position = freezed,
  }) {
    return _then(_value.copyWith(
      gameId: null == gameId
          ? _value.gameId
          : gameId // ignore: cast_nullable_to_non_nullable
              as String,
      timeSpent: null == timeSpent
          ? _value.timeSpent
          : timeSpent // ignore: cast_nullable_to_non_nullable
              as int,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GameClosedEventCopyWith<$Res>
    implements $GameClosedEventCopyWith<$Res> {
  factory _$$_GameClosedEventCopyWith(
          _$_GameClosedEvent value, $Res Function(_$_GameClosedEvent) then) =
      __$$_GameClosedEventCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String gameId, int timeSpent, int? position});
}

/// @nodoc
class __$$_GameClosedEventCopyWithImpl<$Res>
    extends _$GameClosedEventCopyWithImpl<$Res, _$_GameClosedEvent>
    implements _$$_GameClosedEventCopyWith<$Res> {
  __$$_GameClosedEventCopyWithImpl(
      _$_GameClosedEvent _value, $Res Function(_$_GameClosedEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gameId = null,
    Object? timeSpent = null,
    Object? position = freezed,
  }) {
    return _then(_$_GameClosedEvent(
      gameId: null == gameId
          ? _value.gameId
          : gameId // ignore: cast_nullable_to_non_nullable
              as String,
      timeSpent: null == timeSpent
          ? _value.timeSpent
          : timeSpent // ignore: cast_nullable_to_non_nullable
              as int,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GameClosedEvent implements _GameClosedEvent {
  const _$_GameClosedEvent(
      {required this.gameId, required this.timeSpent, this.position});

  factory _$_GameClosedEvent.fromJson(Map<String, dynamic> json) =>
      _$$_GameClosedEventFromJson(json);

  @override
  final String gameId;
  @override
  final int timeSpent;
  @override
  final int? position;

  @override
  String toString() {
    return 'GameClosedEvent(gameId: $gameId, timeSpent: $timeSpent, position: $position)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GameClosedEvent &&
            (identical(other.gameId, gameId) || other.gameId == gameId) &&
            (identical(other.timeSpent, timeSpent) ||
                other.timeSpent == timeSpent) &&
            (identical(other.position, position) ||
                other.position == position));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, gameId, timeSpent, position);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GameClosedEventCopyWith<_$_GameClosedEvent> get copyWith =>
      __$$_GameClosedEventCopyWithImpl<_$_GameClosedEvent>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GameClosedEventToJson(
      this,
    );
  }
}

abstract class _GameClosedEvent implements GameClosedEvent {
  const factory _GameClosedEvent(
      {required final String gameId,
      required final int timeSpent,
      final int? position}) = _$_GameClosedEvent;

  factory _GameClosedEvent.fromJson(Map<String, dynamic> json) =
      _$_GameClosedEvent.fromJson;

  @override
  String get gameId;
  @override
  int get timeSpent;
  @override
  int? get position;
  @override
  @JsonKey(ignore: true)
  _$$_GameClosedEventCopyWith<_$_GameClosedEvent> get copyWith =>
      throw _privateConstructorUsedError;
}
