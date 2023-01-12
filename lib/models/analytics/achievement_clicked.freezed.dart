// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'achievement_clicked.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AchievementClickedEvent _$AchievementClickedEventFromJson(
    Map<String, dynamic> json) {
  return _AchievementClickedEvent.fromJson(json);
}

/// @nodoc
mixin _$AchievementClickedEvent {
  int get elementPosition => throw _privateConstructorUsedError;
  String get elementTitle => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AchievementClickedEventCopyWith<AchievementClickedEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AchievementClickedEventCopyWith<$Res> {
  factory $AchievementClickedEventCopyWith(AchievementClickedEvent value,
          $Res Function(AchievementClickedEvent) then) =
      _$AchievementClickedEventCopyWithImpl<$Res>;
  $Res call({int elementPosition, String elementTitle});
}

/// @nodoc
class _$AchievementClickedEventCopyWithImpl<$Res>
    implements $AchievementClickedEventCopyWith<$Res> {
  _$AchievementClickedEventCopyWithImpl(this._value, this._then);

  final AchievementClickedEvent _value;
  // ignore: unused_field
  final $Res Function(AchievementClickedEvent) _then;

  @override
  $Res call({
    Object? elementPosition = freezed,
    Object? elementTitle = freezed,
  }) {
    return _then(_value.copyWith(
      elementPosition: elementPosition == freezed
          ? _value.elementPosition
          : elementPosition // ignore: cast_nullable_to_non_nullable
              as int,
      elementTitle: elementTitle == freezed
          ? _value.elementTitle
          : elementTitle // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_AchievementClickedEventCopyWith<$Res>
    implements $AchievementClickedEventCopyWith<$Res> {
  factory _$$_AchievementClickedEventCopyWith(_$_AchievementClickedEvent value,
          $Res Function(_$_AchievementClickedEvent) then) =
      __$$_AchievementClickedEventCopyWithImpl<$Res>;
  @override
  $Res call({int elementPosition, String elementTitle});
}

/// @nodoc
class __$$_AchievementClickedEventCopyWithImpl<$Res>
    extends _$AchievementClickedEventCopyWithImpl<$Res>
    implements _$$_AchievementClickedEventCopyWith<$Res> {
  __$$_AchievementClickedEventCopyWithImpl(_$_AchievementClickedEvent _value,
      $Res Function(_$_AchievementClickedEvent) _then)
      : super(_value, (v) => _then(v as _$_AchievementClickedEvent));

  @override
  _$_AchievementClickedEvent get _value =>
      super._value as _$_AchievementClickedEvent;

  @override
  $Res call({
    Object? elementPosition = freezed,
    Object? elementTitle = freezed,
  }) {
    return _then(_$_AchievementClickedEvent(
      elementPosition: elementPosition == freezed
          ? _value.elementPosition
          : elementPosition // ignore: cast_nullable_to_non_nullable
              as int,
      elementTitle: elementTitle == freezed
          ? _value.elementTitle
          : elementTitle // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AchievementClickedEvent implements _AchievementClickedEvent {
  const _$_AchievementClickedEvent(
      {required this.elementPosition, required this.elementTitle});

  factory _$_AchievementClickedEvent.fromJson(Map<String, dynamic> json) =>
      _$$_AchievementClickedEventFromJson(json);

  @override
  final int elementPosition;
  @override
  final String elementTitle;

  @override
  String toString() {
    return 'AchievementClickedEvent(elementPosition: $elementPosition, elementTitle: $elementTitle)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AchievementClickedEvent &&
            const DeepCollectionEquality()
                .equals(other.elementPosition, elementPosition) &&
            const DeepCollectionEquality()
                .equals(other.elementTitle, elementTitle));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(elementPosition),
      const DeepCollectionEquality().hash(elementTitle));

  @JsonKey(ignore: true)
  @override
  _$$_AchievementClickedEventCopyWith<_$_AchievementClickedEvent>
      get copyWith =>
          __$$_AchievementClickedEventCopyWithImpl<_$_AchievementClickedEvent>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AchievementClickedEventToJson(
      this,
    );
  }
}

abstract class _AchievementClickedEvent implements AchievementClickedEvent {
  const factory _AchievementClickedEvent(
      {required final int elementPosition,
      required final String elementTitle}) = _$_AchievementClickedEvent;

  factory _AchievementClickedEvent.fromJson(Map<String, dynamic> json) =
      _$_AchievementClickedEvent.fromJson;

  @override
  int get elementPosition;
  @override
  String get elementTitle;
  @override
  @JsonKey(ignore: true)
  _$$_AchievementClickedEventCopyWith<_$_AchievementClickedEvent>
      get copyWith => throw _privateConstructorUsedError;
}
