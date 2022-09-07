// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'video_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PlayerListState {
  Map<String, Provider<Player>> get players =>
      throw _privateConstructorUsedError;
  String? get primaryPlayerId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlayerListStateCopyWith<PlayerListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerListStateCopyWith<$Res> {
  factory $PlayerListStateCopyWith(
          PlayerListState value, $Res Function(PlayerListState) then) =
      _$PlayerListStateCopyWithImpl<$Res>;
  $Res call({Map<String, Provider<Player>> players, String? primaryPlayerId});
}

/// @nodoc
class _$PlayerListStateCopyWithImpl<$Res>
    implements $PlayerListStateCopyWith<$Res> {
  _$PlayerListStateCopyWithImpl(this._value, this._then);

  final PlayerListState _value;
  // ignore: unused_field
  final $Res Function(PlayerListState) _then;

  @override
  $Res call({
    Object? players = freezed,
    Object? primaryPlayerId = freezed,
  }) {
    return _then(_value.copyWith(
      players: players == freezed
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as Map<String, Provider<Player>>,
      primaryPlayerId: primaryPlayerId == freezed
          ? _value.primaryPlayerId
          : primaryPlayerId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_PlayerStateCopyWith<$Res>
    implements $PlayerListStateCopyWith<$Res> {
  factory _$$_PlayerStateCopyWith(
          _$_PlayerState value, $Res Function(_$_PlayerState) then) =
      __$$_PlayerStateCopyWithImpl<$Res>;
  @override
  $Res call({Map<String, Provider<Player>> players, String? primaryPlayerId});
}

/// @nodoc
class __$$_PlayerStateCopyWithImpl<$Res>
    extends _$PlayerListStateCopyWithImpl<$Res>
    implements _$$_PlayerStateCopyWith<$Res> {
  __$$_PlayerStateCopyWithImpl(
      _$_PlayerState _value, $Res Function(_$_PlayerState) _then)
      : super(_value, (v) => _then(v as _$_PlayerState));

  @override
  _$_PlayerState get _value => super._value as _$_PlayerState;

  @override
  $Res call({
    Object? players = freezed,
    Object? primaryPlayerId = freezed,
  }) {
    return _then(_$_PlayerState(
      players: players == freezed
          ? _value._players
          : players // ignore: cast_nullable_to_non_nullable
              as Map<String, Provider<Player>>,
      primaryPlayerId: primaryPlayerId == freezed
          ? _value.primaryPlayerId
          : primaryPlayerId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_PlayerState extends _PlayerState {
  const _$_PlayerState(
      {required final Map<String, Provider<Player>> players,
      this.primaryPlayerId})
      : _players = players,
        super._();

  final Map<String, Provider<Player>> _players;
  @override
  Map<String, Provider<Player>> get players {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_players);
  }

  @override
  final String? primaryPlayerId;

  @override
  String toString() {
    return 'PlayerListState(players: $players, primaryPlayerId: $primaryPlayerId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlayerState &&
            const DeepCollectionEquality().equals(other._players, _players) &&
            const DeepCollectionEquality()
                .equals(other.primaryPlayerId, primaryPlayerId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_players),
      const DeepCollectionEquality().hash(primaryPlayerId));

  @JsonKey(ignore: true)
  @override
  _$$_PlayerStateCopyWith<_$_PlayerState> get copyWith =>
      __$$_PlayerStateCopyWithImpl<_$_PlayerState>(this, _$identity);
}

abstract class _PlayerState extends PlayerListState {
  const factory _PlayerState(
      {required final Map<String, Provider<Player>> players,
      final String? primaryPlayerId}) = _$_PlayerState;
  const _PlayerState._() : super._();

  @override
  Map<String, Provider<Player>> get players;
  @override
  String? get primaryPlayerId;
  @override
  @JsonKey(ignore: true)
  _$$_PlayerStateCopyWith<_$_PlayerState> get copyWith =>
      throw _privateConstructorUsedError;
}
