// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'achievement_shared.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AchievementSharedEvent _$AchievementSharedEventFromJson(
    Map<String, dynamic> json) {
  return _AchievementSharedEvent.fromJson(json);
}

/// @nodoc
mixin _$AchievementSharedEvent {
  String get elementTitle => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AchievementSharedEventCopyWith<AchievementSharedEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AchievementSharedEventCopyWith<$Res> {
  factory $AchievementSharedEventCopyWith(AchievementSharedEvent value,
          $Res Function(AchievementSharedEvent) then) =
      _$AchievementSharedEventCopyWithImpl<$Res>;
  $Res call({String elementTitle});
}

/// @nodoc
class _$AchievementSharedEventCopyWithImpl<$Res>
    implements $AchievementSharedEventCopyWith<$Res> {
  _$AchievementSharedEventCopyWithImpl(this._value, this._then);

  final AchievementSharedEvent _value;
  // ignore: unused_field
  final $Res Function(AchievementSharedEvent) _then;

  @override
  $Res call({
    Object? elementTitle = freezed,
  }) {
    return _then(_value.copyWith(
      elementTitle: elementTitle == freezed
          ? _value.elementTitle
          : elementTitle // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_AchievementSharedEventCopyWith<$Res>
    implements $AchievementSharedEventCopyWith<$Res> {
  factory _$$_AchievementSharedEventCopyWith(_$_AchievementSharedEvent value,
          $Res Function(_$_AchievementSharedEvent) then) =
      __$$_AchievementSharedEventCopyWithImpl<$Res>;
  @override
  $Res call({String elementTitle});
}

/// @nodoc
class __$$_AchievementSharedEventCopyWithImpl<$Res>
    extends _$AchievementSharedEventCopyWithImpl<$Res>
    implements _$$_AchievementSharedEventCopyWith<$Res> {
  __$$_AchievementSharedEventCopyWithImpl(_$_AchievementSharedEvent _value,
      $Res Function(_$_AchievementSharedEvent) _then)
      : super(_value, (v) => _then(v as _$_AchievementSharedEvent));

  @override
  _$_AchievementSharedEvent get _value =>
      super._value as _$_AchievementSharedEvent;

  @override
  $Res call({
    Object? elementTitle = freezed,
  }) {
    return _then(_$_AchievementSharedEvent(
      elementTitle: elementTitle == freezed
          ? _value.elementTitle
          : elementTitle // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AchievementSharedEvent implements _AchievementSharedEvent {
  const _$_AchievementSharedEvent({required this.elementTitle});

  factory _$_AchievementSharedEvent.fromJson(Map<String, dynamic> json) =>
      _$$_AchievementSharedEventFromJson(json);

  @override
  final String elementTitle;

  @override
  String toString() {
    return 'AchievementSharedEvent(elementTitle: $elementTitle)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AchievementSharedEvent &&
            const DeepCollectionEquality()
                .equals(other.elementTitle, elementTitle));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(elementTitle));

  @JsonKey(ignore: true)
  @override
  _$$_AchievementSharedEventCopyWith<_$_AchievementSharedEvent> get copyWith =>
      __$$_AchievementSharedEventCopyWithImpl<_$_AchievementSharedEvent>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AchievementSharedEventToJson(
      this,
    );
  }
}

abstract class _AchievementSharedEvent implements AchievementSharedEvent {
  const factory _AchievementSharedEvent({required final String elementTitle}) =
      _$_AchievementSharedEvent;

  factory _AchievementSharedEvent.fromJson(Map<String, dynamic> json) =
      _$_AchievementSharedEvent.fromJson;

  @override
  String get elementTitle;
  @override
  @JsonKey(ignore: true)
  _$$_AchievementSharedEventCopyWith<_$_AchievementSharedEvent> get copyWith =>
      throw _privateConstructorUsedError;
}
