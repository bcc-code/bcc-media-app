// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'share.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Share _$ShareFromJson(Map<String, dynamic> json) {
  return _Share.fromJson(json);
}

/// @nodoc
mixin _$Share {
  String get pageName => throw _privateConstructorUsedError;
  String get elementType => throw _privateConstructorUsedError;
  String get elementId => throw _privateConstructorUsedError;
  int? get position => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShareCopyWith<Share> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShareCopyWith<$Res> {
  factory $ShareCopyWith(Share value, $Res Function(Share) then) =
      _$ShareCopyWithImpl<$Res, Share>;
  @useResult
  $Res call(
      {String pageName, String elementType, String elementId, int? position});
}

/// @nodoc
class _$ShareCopyWithImpl<$Res, $Val extends Share>
    implements $ShareCopyWith<$Res> {
  _$ShareCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageName = null,
    Object? elementType = null,
    Object? elementId = null,
    Object? position = freezed,
  }) {
    return _then(_value.copyWith(
      pageName: null == pageName
          ? _value.pageName
          : pageName // ignore: cast_nullable_to_non_nullable
              as String,
      elementType: null == elementType
          ? _value.elementType
          : elementType // ignore: cast_nullable_to_non_nullable
              as String,
      elementId: null == elementId
          ? _value.elementId
          : elementId // ignore: cast_nullable_to_non_nullable
              as String,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ShareCopyWith<$Res> implements $ShareCopyWith<$Res> {
  factory _$$_ShareCopyWith(_$_Share value, $Res Function(_$_Share) then) =
      __$$_ShareCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String pageName, String elementType, String elementId, int? position});
}

/// @nodoc
class __$$_ShareCopyWithImpl<$Res> extends _$ShareCopyWithImpl<$Res, _$_Share>
    implements _$$_ShareCopyWith<$Res> {
  __$$_ShareCopyWithImpl(_$_Share _value, $Res Function(_$_Share) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageName = null,
    Object? elementType = null,
    Object? elementId = null,
    Object? position = freezed,
  }) {
    return _then(_$_Share(
      pageName: null == pageName
          ? _value.pageName
          : pageName // ignore: cast_nullable_to_non_nullable
              as String,
      elementType: null == elementType
          ? _value.elementType
          : elementType // ignore: cast_nullable_to_non_nullable
              as String,
      elementId: null == elementId
          ? _value.elementId
          : elementId // ignore: cast_nullable_to_non_nullable
              as String,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Share implements _Share {
  const _$_Share(
      {required this.pageName,
      required this.elementType,
      required this.elementId,
      this.position});

  factory _$_Share.fromJson(Map<String, dynamic> json) =>
      _$$_ShareFromJson(json);

  @override
  final String pageName;
  @override
  final String elementType;
  @override
  final String elementId;
  @override
  final int? position;

  @override
  String toString() {
    return 'Share(pageName: $pageName, elementType: $elementType, elementId: $elementId, position: $position)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Share &&
            (identical(other.pageName, pageName) ||
                other.pageName == pageName) &&
            (identical(other.elementType, elementType) ||
                other.elementType == elementType) &&
            (identical(other.elementId, elementId) ||
                other.elementId == elementId) &&
            (identical(other.position, position) ||
                other.position == position));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, pageName, elementType, elementId, position);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ShareCopyWith<_$_Share> get copyWith =>
      __$$_ShareCopyWithImpl<_$_Share>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ShareToJson(
      this,
    );
  }
}

abstract class _Share implements Share {
  const factory _Share(
      {required final String pageName,
      required final String elementType,
      required final String elementId,
      final int? position}) = _$_Share;

  factory _Share.fromJson(Map<String, dynamic> json) = _$_Share.fromJson;

  @override
  String get pageName;
  @override
  String get elementType;
  @override
  String get elementId;
  @override
  int? get position;
  @override
  @JsonKey(ignore: true)
  _$$_ShareCopyWith<_$_Share> get copyWith =>
      throw _privateConstructorUsedError;
}
