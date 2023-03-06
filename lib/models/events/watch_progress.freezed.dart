// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'watch_progress.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WatchProgressUpdatedEvent {
  String get episodeId => throw _privateConstructorUsedError;
  int? get progress => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WatchProgressUpdatedEventCopyWith<WatchProgressUpdatedEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WatchProgressUpdatedEventCopyWith<$Res> {
  factory $WatchProgressUpdatedEventCopyWith(WatchProgressUpdatedEvent value,
          $Res Function(WatchProgressUpdatedEvent) then) =
      _$WatchProgressUpdatedEventCopyWithImpl<$Res, WatchProgressUpdatedEvent>;
  @useResult
  $Res call({String episodeId, int? progress});
}

/// @nodoc
class _$WatchProgressUpdatedEventCopyWithImpl<$Res,
        $Val extends WatchProgressUpdatedEvent>
    implements $WatchProgressUpdatedEventCopyWith<$Res> {
  _$WatchProgressUpdatedEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? episodeId = null,
    Object? progress = freezed,
  }) {
    return _then(_value.copyWith(
      episodeId: null == episodeId
          ? _value.episodeId
          : episodeId // ignore: cast_nullable_to_non_nullable
              as String,
      progress: freezed == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WatchProgressUpdatedEventCopyWith<$Res>
    implements $WatchProgressUpdatedEventCopyWith<$Res> {
  factory _$$_WatchProgressUpdatedEventCopyWith(
          _$_WatchProgressUpdatedEvent value,
          $Res Function(_$_WatchProgressUpdatedEvent) then) =
      __$$_WatchProgressUpdatedEventCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String episodeId, int? progress});
}

/// @nodoc
class __$$_WatchProgressUpdatedEventCopyWithImpl<$Res>
    extends _$WatchProgressUpdatedEventCopyWithImpl<$Res,
        _$_WatchProgressUpdatedEvent>
    implements _$$_WatchProgressUpdatedEventCopyWith<$Res> {
  __$$_WatchProgressUpdatedEventCopyWithImpl(
      _$_WatchProgressUpdatedEvent _value,
      $Res Function(_$_WatchProgressUpdatedEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? episodeId = null,
    Object? progress = freezed,
  }) {
    return _then(_$_WatchProgressUpdatedEvent(
      episodeId: null == episodeId
          ? _value.episodeId
          : episodeId // ignore: cast_nullable_to_non_nullable
              as String,
      progress: freezed == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_WatchProgressUpdatedEvent implements _WatchProgressUpdatedEvent {
  const _$_WatchProgressUpdatedEvent(
      {required this.episodeId, required this.progress});

  @override
  final String episodeId;
  @override
  final int? progress;

  @override
  String toString() {
    return 'WatchProgressUpdatedEvent(episodeId: $episodeId, progress: $progress)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WatchProgressUpdatedEvent &&
            (identical(other.episodeId, episodeId) ||
                other.episodeId == episodeId) &&
            (identical(other.progress, progress) ||
                other.progress == progress));
  }

  @override
  int get hashCode => Object.hash(runtimeType, episodeId, progress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WatchProgressUpdatedEventCopyWith<_$_WatchProgressUpdatedEvent>
      get copyWith => __$$_WatchProgressUpdatedEventCopyWithImpl<
          _$_WatchProgressUpdatedEvent>(this, _$identity);
}

abstract class _WatchProgressUpdatedEvent implements WatchProgressUpdatedEvent {
  const factory _WatchProgressUpdatedEvent(
      {required final String episodeId,
      required final int? progress}) = _$_WatchProgressUpdatedEvent;

  @override
  String get episodeId;
  @override
  int? get progress;
  @override
  @JsonKey(ignore: true)
  _$$_WatchProgressUpdatedEventCopyWith<_$_WatchProgressUpdatedEvent>
      get copyWith => throw _privateConstructorUsedError;
}
