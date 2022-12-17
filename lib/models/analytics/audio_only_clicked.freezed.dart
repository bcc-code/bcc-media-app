// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'audio_only_clicked.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AudioOnlyClickedEvent _$AudioOnlyClickedEventFromJson(
    Map<String, dynamic> json) {
  return _AudioOnlyClickedEvent.fromJson(json);
}

/// @nodoc
mixin _$AudioOnlyClickedEvent {
  bool get audioOnly => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AudioOnlyClickedEventCopyWith<AudioOnlyClickedEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AudioOnlyClickedEventCopyWith<$Res> {
  factory $AudioOnlyClickedEventCopyWith(AudioOnlyClickedEvent value,
          $Res Function(AudioOnlyClickedEvent) then) =
      _$AudioOnlyClickedEventCopyWithImpl<$Res, AudioOnlyClickedEvent>;
  @useResult
  $Res call({bool audioOnly});
}

/// @nodoc
class _$AudioOnlyClickedEventCopyWithImpl<$Res,
        $Val extends AudioOnlyClickedEvent>
    implements $AudioOnlyClickedEventCopyWith<$Res> {
  _$AudioOnlyClickedEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? audioOnly = null,
  }) {
    return _then(_value.copyWith(
      audioOnly: null == audioOnly
          ? _value.audioOnly
          : audioOnly // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AudioOnlyClickedEventCopyWith<$Res>
    implements $AudioOnlyClickedEventCopyWith<$Res> {
  factory _$$_AudioOnlyClickedEventCopyWith(_$_AudioOnlyClickedEvent value,
          $Res Function(_$_AudioOnlyClickedEvent) then) =
      __$$_AudioOnlyClickedEventCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool audioOnly});
}

/// @nodoc
class __$$_AudioOnlyClickedEventCopyWithImpl<$Res>
    extends _$AudioOnlyClickedEventCopyWithImpl<$Res, _$_AudioOnlyClickedEvent>
    implements _$$_AudioOnlyClickedEventCopyWith<$Res> {
  __$$_AudioOnlyClickedEventCopyWithImpl(_$_AudioOnlyClickedEvent _value,
      $Res Function(_$_AudioOnlyClickedEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? audioOnly = null,
  }) {
    return _then(_$_AudioOnlyClickedEvent(
      audioOnly: null == audioOnly
          ? _value.audioOnly
          : audioOnly // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AudioOnlyClickedEvent implements _AudioOnlyClickedEvent {
  const _$_AudioOnlyClickedEvent({required this.audioOnly});

  factory _$_AudioOnlyClickedEvent.fromJson(Map<String, dynamic> json) =>
      _$$_AudioOnlyClickedEventFromJson(json);

  @override
  final bool audioOnly;

  @override
  String toString() {
    return 'AudioOnlyClickedEvent(audioOnly: $audioOnly)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AudioOnlyClickedEvent &&
            (identical(other.audioOnly, audioOnly) ||
                other.audioOnly == audioOnly));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, audioOnly);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AudioOnlyClickedEventCopyWith<_$_AudioOnlyClickedEvent> get copyWith =>
      __$$_AudioOnlyClickedEventCopyWithImpl<_$_AudioOnlyClickedEvent>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AudioOnlyClickedEventToJson(
      this,
    );
  }
}

abstract class _AudioOnlyClickedEvent implements AudioOnlyClickedEvent {
  const factory _AudioOnlyClickedEvent({required final bool audioOnly}) =
      _$_AudioOnlyClickedEvent;

  factory _AudioOnlyClickedEvent.fromJson(Map<String, dynamic> json) =
      _$_AudioOnlyClickedEvent.fromJson;

  @override
  bool get audioOnly;
  @override
  @JsonKey(ignore: true)
  _$$_AudioOnlyClickedEventCopyWith<_$_AudioOnlyClickedEvent> get copyWith =>
      throw _privateConstructorUsedError;
}
