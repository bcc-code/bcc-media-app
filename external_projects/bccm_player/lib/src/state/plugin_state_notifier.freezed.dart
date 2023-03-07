// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plugin_state_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PlayerPluginState {
  String? get primaryPlayerId => throw _privateConstructorUsedError;
  Map<String, PlayerStateNotifier> get players =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlayerPluginStateCopyWith<PlayerPluginState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerPluginStateCopyWith<$Res> {
  factory $PlayerPluginStateCopyWith(
          PlayerPluginState value, $Res Function(PlayerPluginState) then) =
      _$PlayerPluginStateCopyWithImpl<$Res, PlayerPluginState>;
  @useResult
  $Res call(
      {String? primaryPlayerId, Map<String, PlayerStateNotifier> players});
}

/// @nodoc
class _$PlayerPluginStateCopyWithImpl<$Res, $Val extends PlayerPluginState>
    implements $PlayerPluginStateCopyWith<$Res> {
  _$PlayerPluginStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? primaryPlayerId = freezed,
    Object? players = null,
  }) {
    return _then(_value.copyWith(
      primaryPlayerId: freezed == primaryPlayerId
          ? _value.primaryPlayerId
          : primaryPlayerId // ignore: cast_nullable_to_non_nullable
              as String?,
      players: null == players
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as Map<String, PlayerStateNotifier>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PlayerPluginStateCopyWith<$Res>
    implements $PlayerPluginStateCopyWith<$Res> {
  factory _$$_PlayerPluginStateCopyWith(_$_PlayerPluginState value,
          $Res Function(_$_PlayerPluginState) then) =
      __$$_PlayerPluginStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? primaryPlayerId, Map<String, PlayerStateNotifier> players});
}

/// @nodoc
class __$$_PlayerPluginStateCopyWithImpl<$Res>
    extends _$PlayerPluginStateCopyWithImpl<$Res, _$_PlayerPluginState>
    implements _$$_PlayerPluginStateCopyWith<$Res> {
  __$$_PlayerPluginStateCopyWithImpl(
      _$_PlayerPluginState _value, $Res Function(_$_PlayerPluginState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? primaryPlayerId = freezed,
    Object? players = null,
  }) {
    return _then(_$_PlayerPluginState(
      primaryPlayerId: freezed == primaryPlayerId
          ? _value.primaryPlayerId
          : primaryPlayerId // ignore: cast_nullable_to_non_nullable
              as String?,
      players: null == players
          ? _value._players
          : players // ignore: cast_nullable_to_non_nullable
              as Map<String, PlayerStateNotifier>,
    ));
  }
}

/// @nodoc

class _$_PlayerPluginState implements _PlayerPluginState {
  const _$_PlayerPluginState(
      {required this.primaryPlayerId,
      required final Map<String, PlayerStateNotifier> players})
      : _players = players;

  @override
  final String? primaryPlayerId;
  final Map<String, PlayerStateNotifier> _players;
  @override
  Map<String, PlayerStateNotifier> get players {
    if (_players is EqualUnmodifiableMapView) return _players;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_players);
  }

  @override
  String toString() {
    return 'PlayerPluginState(primaryPlayerId: $primaryPlayerId, players: $players)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlayerPluginState &&
            (identical(other.primaryPlayerId, primaryPlayerId) ||
                other.primaryPlayerId == primaryPlayerId) &&
            const DeepCollectionEquality().equals(other._players, _players));
  }

  @override
  int get hashCode => Object.hash(runtimeType, primaryPlayerId,
      const DeepCollectionEquality().hash(_players));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PlayerPluginStateCopyWith<_$_PlayerPluginState> get copyWith =>
      __$$_PlayerPluginStateCopyWithImpl<_$_PlayerPluginState>(
          this, _$identity);
}

abstract class _PlayerPluginState implements PlayerPluginState {
  const factory _PlayerPluginState(
          {required final String? primaryPlayerId,
          required final Map<String, PlayerStateNotifier> players}) =
      _$_PlayerPluginState;

  @override
  String? get primaryPlayerId;
  @override
  Map<String, PlayerStateNotifier> get players;
  @override
  @JsonKey(ignore: true)
  _$$_PlayerPluginStateCopyWith<_$_PlayerPluginState> get copyWith =>
      throw _privateConstructorUsedError;
}
