// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'misc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

InteractionEvent _$InteractionEventFromJson(Map<String, dynamic> json) {
  return _InteractionEvent.fromJson(json);
}

/// @nodoc
mixin _$InteractionEvent {
  String? get interaction =>
      throw _privateConstructorUsedError; // 'play', 'pause', 'share', 'like', 'mute'
  String? get pageCode => throw _privateConstructorUsedError; // 'shorts'
  String? get contextElementType =>
      throw _privateConstructorUsedError; // 'shorts'
  String? get contextElementId =>
      throw _privateConstructorUsedError; // e.g. uuid of the short
  Map<String, dynamic>? get meta => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InteractionEventCopyWith<InteractionEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InteractionEventCopyWith<$Res> {
  factory $InteractionEventCopyWith(
          InteractionEvent value, $Res Function(InteractionEvent) then) =
      _$InteractionEventCopyWithImpl<$Res, InteractionEvent>;
  @useResult
  $Res call(
      {String? interaction,
      String? pageCode,
      String? contextElementType,
      String? contextElementId,
      Map<String, dynamic>? meta});
}

/// @nodoc
class _$InteractionEventCopyWithImpl<$Res, $Val extends InteractionEvent>
    implements $InteractionEventCopyWith<$Res> {
  _$InteractionEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? interaction = freezed,
    Object? pageCode = freezed,
    Object? contextElementType = freezed,
    Object? contextElementId = freezed,
    Object? meta = freezed,
  }) {
    return _then(_value.copyWith(
      interaction: freezed == interaction
          ? _value.interaction
          : interaction // ignore: cast_nullable_to_non_nullable
              as String?,
      pageCode: freezed == pageCode
          ? _value.pageCode
          : pageCode // ignore: cast_nullable_to_non_nullable
              as String?,
      contextElementType: freezed == contextElementType
          ? _value.contextElementType
          : contextElementType // ignore: cast_nullable_to_non_nullable
              as String?,
      contextElementId: freezed == contextElementId
          ? _value.contextElementId
          : contextElementId // ignore: cast_nullable_to_non_nullable
              as String?,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InteractionEventImplCopyWith<$Res>
    implements $InteractionEventCopyWith<$Res> {
  factory _$$InteractionEventImplCopyWith(_$InteractionEventImpl value,
          $Res Function(_$InteractionEventImpl) then) =
      __$$InteractionEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? interaction,
      String? pageCode,
      String? contextElementType,
      String? contextElementId,
      Map<String, dynamic>? meta});
}

/// @nodoc
class __$$InteractionEventImplCopyWithImpl<$Res>
    extends _$InteractionEventCopyWithImpl<$Res, _$InteractionEventImpl>
    implements _$$InteractionEventImplCopyWith<$Res> {
  __$$InteractionEventImplCopyWithImpl(_$InteractionEventImpl _value,
      $Res Function(_$InteractionEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? interaction = freezed,
    Object? pageCode = freezed,
    Object? contextElementType = freezed,
    Object? contextElementId = freezed,
    Object? meta = freezed,
  }) {
    return _then(_$InteractionEventImpl(
      interaction: freezed == interaction
          ? _value.interaction
          : interaction // ignore: cast_nullable_to_non_nullable
              as String?,
      pageCode: freezed == pageCode
          ? _value.pageCode
          : pageCode // ignore: cast_nullable_to_non_nullable
              as String?,
      contextElementType: freezed == contextElementType
          ? _value.contextElementType
          : contextElementType // ignore: cast_nullable_to_non_nullable
              as String?,
      contextElementId: freezed == contextElementId
          ? _value.contextElementId
          : contextElementId // ignore: cast_nullable_to_non_nullable
              as String?,
      meta: freezed == meta
          ? _value._meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InteractionEventImpl implements _InteractionEvent {
  const _$InteractionEventImpl(
      {this.interaction,
      this.pageCode,
      this.contextElementType,
      this.contextElementId,
      final Map<String, dynamic>? meta})
      : _meta = meta;

  factory _$InteractionEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$InteractionEventImplFromJson(json);

  @override
  final String? interaction;
// 'play', 'pause', 'share', 'like', 'mute'
  @override
  final String? pageCode;
// 'shorts'
  @override
  final String? contextElementType;
// 'shorts'
  @override
  final String? contextElementId;
// e.g. uuid of the short
  final Map<String, dynamic>? _meta;
// e.g. uuid of the short
  @override
  Map<String, dynamic>? get meta {
    final value = _meta;
    if (value == null) return null;
    if (_meta is EqualUnmodifiableMapView) return _meta;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'InteractionEvent(interaction: $interaction, pageCode: $pageCode, contextElementType: $contextElementType, contextElementId: $contextElementId, meta: $meta)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InteractionEventImpl &&
            (identical(other.interaction, interaction) ||
                other.interaction == interaction) &&
            (identical(other.pageCode, pageCode) ||
                other.pageCode == pageCode) &&
            (identical(other.contextElementType, contextElementType) ||
                other.contextElementType == contextElementType) &&
            (identical(other.contextElementId, contextElementId) ||
                other.contextElementId == contextElementId) &&
            const DeepCollectionEquality().equals(other._meta, _meta));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      interaction,
      pageCode,
      contextElementType,
      contextElementId,
      const DeepCollectionEquality().hash(_meta));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InteractionEventImplCopyWith<_$InteractionEventImpl> get copyWith =>
      __$$InteractionEventImplCopyWithImpl<_$InteractionEventImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InteractionEventImplToJson(
      this,
    );
  }
}

abstract class _InteractionEvent implements InteractionEvent {
  const factory _InteractionEvent(
      {final String? interaction,
      final String? pageCode,
      final String? contextElementType,
      final String? contextElementId,
      final Map<String, dynamic>? meta}) = _$InteractionEventImpl;

  factory _InteractionEvent.fromJson(Map<String, dynamic> json) =
      _$InteractionEventImpl.fromJson;

  @override
  String? get interaction;
  @override // 'play', 'pause', 'share', 'like', 'mute'
  String? get pageCode;
  @override // 'shorts'
  String? get contextElementType;
  @override // 'shorts'
  String? get contextElementId;
  @override // e.g. uuid of the short
  Map<String, dynamic>? get meta;
  @override
  @JsonKey(ignore: true)
  _$$InteractionEventImplCopyWith<_$InteractionEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
