// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player_state_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PlayerState {
  String get playerId => throw _privateConstructorUsedError;
  MediaItem? get currentMediaItem => throw _privateConstructorUsedError;
  int? get playbackPositionMs => throw _privateConstructorUsedError;
  bool get isFullscreen => throw _privateConstructorUsedError;
  PlaybackState get playbackState => throw _privateConstructorUsedError;
  bool get isInPipMode => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlayerStateCopyWith<PlayerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerStateCopyWith<$Res> {
  factory $PlayerStateCopyWith(
          PlayerState value, $Res Function(PlayerState) then) =
      _$PlayerStateCopyWithImpl<$Res, PlayerState>;
  @useResult
  $Res call(
      {String playerId,
      MediaItem? currentMediaItem,
      int? playbackPositionMs,
      bool isFullscreen,
      PlaybackState playbackState,
      bool isInPipMode});
}

/// @nodoc
class _$PlayerStateCopyWithImpl<$Res, $Val extends PlayerState>
    implements $PlayerStateCopyWith<$Res> {
  _$PlayerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playerId = null,
    Object? currentMediaItem = freezed,
    Object? playbackPositionMs = freezed,
    Object? isFullscreen = null,
    Object? playbackState = null,
    Object? isInPipMode = null,
  }) {
    return _then(_value.copyWith(
      playerId: null == playerId
          ? _value.playerId
          : playerId // ignore: cast_nullable_to_non_nullable
              as String,
      currentMediaItem: freezed == currentMediaItem
          ? _value.currentMediaItem
          : currentMediaItem // ignore: cast_nullable_to_non_nullable
              as MediaItem?,
      playbackPositionMs: freezed == playbackPositionMs
          ? _value.playbackPositionMs
          : playbackPositionMs // ignore: cast_nullable_to_non_nullable
              as int?,
      isFullscreen: null == isFullscreen
          ? _value.isFullscreen
          : isFullscreen // ignore: cast_nullable_to_non_nullable
              as bool,
      playbackState: null == playbackState
          ? _value.playbackState
          : playbackState // ignore: cast_nullable_to_non_nullable
              as PlaybackState,
      isInPipMode: null == isInPipMode
          ? _value.isInPipMode
          : isInPipMode // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PlayerStateCopyWith<$Res>
    implements $PlayerStateCopyWith<$Res> {
  factory _$$_PlayerStateCopyWith(
          _$_PlayerState value, $Res Function(_$_PlayerState) then) =
      __$$_PlayerStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String playerId,
      MediaItem? currentMediaItem,
      int? playbackPositionMs,
      bool isFullscreen,
      PlaybackState playbackState,
      bool isInPipMode});
}

/// @nodoc
class __$$_PlayerStateCopyWithImpl<$Res>
    extends _$PlayerStateCopyWithImpl<$Res, _$_PlayerState>
    implements _$$_PlayerStateCopyWith<$Res> {
  __$$_PlayerStateCopyWithImpl(
      _$_PlayerState _value, $Res Function(_$_PlayerState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playerId = null,
    Object? currentMediaItem = freezed,
    Object? playbackPositionMs = freezed,
    Object? isFullscreen = null,
    Object? playbackState = null,
    Object? isInPipMode = null,
  }) {
    return _then(_$_PlayerState(
      playerId: null == playerId
          ? _value.playerId
          : playerId // ignore: cast_nullable_to_non_nullable
              as String,
      currentMediaItem: freezed == currentMediaItem
          ? _value.currentMediaItem
          : currentMediaItem // ignore: cast_nullable_to_non_nullable
              as MediaItem?,
      playbackPositionMs: freezed == playbackPositionMs
          ? _value.playbackPositionMs
          : playbackPositionMs // ignore: cast_nullable_to_non_nullable
              as int?,
      isFullscreen: null == isFullscreen
          ? _value.isFullscreen
          : isFullscreen // ignore: cast_nullable_to_non_nullable
              as bool,
      playbackState: null == playbackState
          ? _value.playbackState
          : playbackState // ignore: cast_nullable_to_non_nullable
              as PlaybackState,
      isInPipMode: null == isInPipMode
          ? _value.isInPipMode
          : isInPipMode // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_PlayerState implements _PlayerState {
  const _$_PlayerState(
      {required this.playerId,
      this.currentMediaItem,
      this.playbackPositionMs,
      this.isFullscreen = false,
      this.playbackState = PlaybackState.stopped,
      this.isInPipMode = false});

  @override
  final String playerId;
  @override
  final MediaItem? currentMediaItem;
  @override
  final int? playbackPositionMs;
  @override
  @JsonKey()
  final bool isFullscreen;
  @override
  @JsonKey()
  final PlaybackState playbackState;
  @override
  @JsonKey()
  final bool isInPipMode;

  @override
  String toString() {
    return 'PlayerState(playerId: $playerId, currentMediaItem: $currentMediaItem, playbackPositionMs: $playbackPositionMs, isFullscreen: $isFullscreen, playbackState: $playbackState, isInPipMode: $isInPipMode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlayerState &&
            (identical(other.playerId, playerId) ||
                other.playerId == playerId) &&
            (identical(other.currentMediaItem, currentMediaItem) ||
                other.currentMediaItem == currentMediaItem) &&
            (identical(other.playbackPositionMs, playbackPositionMs) ||
                other.playbackPositionMs == playbackPositionMs) &&
            (identical(other.isFullscreen, isFullscreen) ||
                other.isFullscreen == isFullscreen) &&
            (identical(other.playbackState, playbackState) ||
                other.playbackState == playbackState) &&
            (identical(other.isInPipMode, isInPipMode) ||
                other.isInPipMode == isInPipMode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, playerId, currentMediaItem,
      playbackPositionMs, isFullscreen, playbackState, isInPipMode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PlayerStateCopyWith<_$_PlayerState> get copyWith =>
      __$$_PlayerStateCopyWithImpl<_$_PlayerState>(this, _$identity);
}

abstract class _PlayerState implements PlayerState {
  const factory _PlayerState(
      {required final String playerId,
      final MediaItem? currentMediaItem,
      final int? playbackPositionMs,
      final bool isFullscreen,
      final PlaybackState playbackState,
      final bool isInPipMode}) = _$_PlayerState;

  @override
  String get playerId;
  @override
  MediaItem? get currentMediaItem;
  @override
  int? get playbackPositionMs;
  @override
  bool get isFullscreen;
  @override
  PlaybackState get playbackState;
  @override
  bool get isInPipMode;
  @override
  @JsonKey(ignore: true)
  _$$_PlayerStateCopyWith<_$_PlayerState> get copyWith =>
      throw _privateConstructorUsedError;
}
