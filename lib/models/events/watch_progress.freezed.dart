// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
      _$WatchProgressUpdatedEventCopyWithImpl<$Res>;
  $Res call({String episodeId, int? progress});
}

/// @nodoc
class _$WatchProgressUpdatedEventCopyWithImpl<$Res>
    implements $WatchProgressUpdatedEventCopyWith<$Res> {
  _$WatchProgressUpdatedEventCopyWithImpl(this._value, this._then);

  final WatchProgressUpdatedEvent _value;
  // ignore: unused_field
  final $Res Function(WatchProgressUpdatedEvent) _then;

  @override
  $Res call({
    Object? episodeId = freezed,
    Object? progress = freezed,
  }) {
    return _then(_value.copyWith(
      episodeId: episodeId == freezed
          ? _value.episodeId
          : episodeId // ignore: cast_nullable_to_non_nullable
              as String,
      progress: progress == freezed
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
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
  $Res call({String episodeId, int? progress});
}

/// @nodoc
class __$$_WatchProgressUpdatedEventCopyWithImpl<$Res>
    extends _$WatchProgressUpdatedEventCopyWithImpl<$Res>
    implements _$$_WatchProgressUpdatedEventCopyWith<$Res> {
  __$$_WatchProgressUpdatedEventCopyWithImpl(
      _$_WatchProgressUpdatedEvent _value,
      $Res Function(_$_WatchProgressUpdatedEvent) _then)
      : super(_value, (v) => _then(v as _$_WatchProgressUpdatedEvent));

  @override
  _$_WatchProgressUpdatedEvent get _value =>
      super._value as _$_WatchProgressUpdatedEvent;

  @override
  $Res call({
    Object? episodeId = freezed,
    Object? progress = freezed,
  }) {
    return _then(_$_WatchProgressUpdatedEvent(
      episodeId: episodeId == freezed
          ? _value.episodeId
          : episodeId // ignore: cast_nullable_to_non_nullable
              as String,
      progress: progress == freezed
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
            const DeepCollectionEquality().equals(other.episodeId, episodeId) &&
            const DeepCollectionEquality().equals(other.progress, progress));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(episodeId),
      const DeepCollectionEquality().hash(progress));

  @JsonKey(ignore: true)
  @override
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
