// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
      _$AchievementClickedEventCopyWithImpl<$Res, AchievementClickedEvent>;
  @useResult
  $Res call({int elementPosition, String elementTitle});
}

/// @nodoc
class _$AchievementClickedEventCopyWithImpl<$Res,
        $Val extends AchievementClickedEvent>
    implements $AchievementClickedEventCopyWith<$Res> {
  _$AchievementClickedEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? elementPosition = null,
    Object? elementTitle = null,
  }) {
    return _then(_value.copyWith(
      elementPosition: null == elementPosition
          ? _value.elementPosition
          : elementPosition // ignore: cast_nullable_to_non_nullable
              as int,
      elementTitle: null == elementTitle
          ? _value.elementTitle
          : elementTitle // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AchievementClickedEventImplCopyWith<$Res>
    implements $AchievementClickedEventCopyWith<$Res> {
  factory _$$AchievementClickedEventImplCopyWith(
          _$AchievementClickedEventImpl value,
          $Res Function(_$AchievementClickedEventImpl) then) =
      __$$AchievementClickedEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int elementPosition, String elementTitle});
}

/// @nodoc
class __$$AchievementClickedEventImplCopyWithImpl<$Res>
    extends _$AchievementClickedEventCopyWithImpl<$Res,
        _$AchievementClickedEventImpl>
    implements _$$AchievementClickedEventImplCopyWith<$Res> {
  __$$AchievementClickedEventImplCopyWithImpl(
      _$AchievementClickedEventImpl _value,
      $Res Function(_$AchievementClickedEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? elementPosition = null,
    Object? elementTitle = null,
  }) {
    return _then(_$AchievementClickedEventImpl(
      elementPosition: null == elementPosition
          ? _value.elementPosition
          : elementPosition // ignore: cast_nullable_to_non_nullable
              as int,
      elementTitle: null == elementTitle
          ? _value.elementTitle
          : elementTitle // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AchievementClickedEventImpl implements _AchievementClickedEvent {
  const _$AchievementClickedEventImpl(
      {required this.elementPosition, required this.elementTitle});

  factory _$AchievementClickedEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$AchievementClickedEventImplFromJson(json);

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
            other is _$AchievementClickedEventImpl &&
            (identical(other.elementPosition, elementPosition) ||
                other.elementPosition == elementPosition) &&
            (identical(other.elementTitle, elementTitle) ||
                other.elementTitle == elementTitle));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, elementPosition, elementTitle);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AchievementClickedEventImplCopyWith<_$AchievementClickedEventImpl>
      get copyWith => __$$AchievementClickedEventImplCopyWithImpl<
          _$AchievementClickedEventImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AchievementClickedEventImplToJson(
      this,
    );
  }
}

abstract class _AchievementClickedEvent implements AchievementClickedEvent {
  const factory _AchievementClickedEvent(
      {required final int elementPosition,
      required final String elementTitle}) = _$AchievementClickedEventImpl;

  factory _AchievementClickedEvent.fromJson(Map<String, dynamic> json) =
      _$AchievementClickedEventImpl.fromJson;

  @override
  int get elementPosition;
  @override
  String get elementTitle;
  @override
  @JsonKey(ignore: true)
  _$$AchievementClickedEventImplCopyWith<_$AchievementClickedEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}
