// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deep_link_opened.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DeepLinkOpenedEvent _$DeepLinkOpenedEventFromJson(Map<String, dynamic> json) {
  return _DeepLinkOpenedEvent.fromJson(json);
}

/// @nodoc
mixin _$DeepLinkOpenedEvent {
  String get url => throw _privateConstructorUsedError;
  String get source => throw _privateConstructorUsedError;
  String get campaignId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeepLinkOpenedEventCopyWith<DeepLinkOpenedEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeepLinkOpenedEventCopyWith<$Res> {
  factory $DeepLinkOpenedEventCopyWith(
          DeepLinkOpenedEvent value, $Res Function(DeepLinkOpenedEvent) then) =
      _$DeepLinkOpenedEventCopyWithImpl<$Res, DeepLinkOpenedEvent>;
  @useResult
  $Res call({String url, String source, String campaignId});
}

/// @nodoc
class _$DeepLinkOpenedEventCopyWithImpl<$Res, $Val extends DeepLinkOpenedEvent>
    implements $DeepLinkOpenedEventCopyWith<$Res> {
  _$DeepLinkOpenedEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? source = null,
    Object? campaignId = null,
  }) {
    return _then(_value.copyWith(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      campaignId: null == campaignId
          ? _value.campaignId
          : campaignId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeepLinkOpenedEventImplCopyWith<$Res>
    implements $DeepLinkOpenedEventCopyWith<$Res> {
  factory _$$DeepLinkOpenedEventImplCopyWith(_$DeepLinkOpenedEventImpl value,
          $Res Function(_$DeepLinkOpenedEventImpl) then) =
      __$$DeepLinkOpenedEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String url, String source, String campaignId});
}

/// @nodoc
class __$$DeepLinkOpenedEventImplCopyWithImpl<$Res>
    extends _$DeepLinkOpenedEventCopyWithImpl<$Res, _$DeepLinkOpenedEventImpl>
    implements _$$DeepLinkOpenedEventImplCopyWith<$Res> {
  __$$DeepLinkOpenedEventImplCopyWithImpl(_$DeepLinkOpenedEventImpl _value,
      $Res Function(_$DeepLinkOpenedEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? source = null,
    Object? campaignId = null,
  }) {
    return _then(_$DeepLinkOpenedEventImpl(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      campaignId: null == campaignId
          ? _value.campaignId
          : campaignId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeepLinkOpenedEventImpl implements _DeepLinkOpenedEvent {
  const _$DeepLinkOpenedEventImpl(
      {required this.url, required this.source, required this.campaignId});

  factory _$DeepLinkOpenedEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeepLinkOpenedEventImplFromJson(json);

  @override
  final String url;
  @override
  final String source;
  @override
  final String campaignId;

  @override
  String toString() {
    return 'DeepLinkOpenedEvent(url: $url, source: $source, campaignId: $campaignId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeepLinkOpenedEventImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.campaignId, campaignId) ||
                other.campaignId == campaignId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, url, source, campaignId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeepLinkOpenedEventImplCopyWith<_$DeepLinkOpenedEventImpl> get copyWith =>
      __$$DeepLinkOpenedEventImplCopyWithImpl<_$DeepLinkOpenedEventImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeepLinkOpenedEventImplToJson(
      this,
    );
  }
}

abstract class _DeepLinkOpenedEvent implements DeepLinkOpenedEvent {
  const factory _DeepLinkOpenedEvent(
      {required final String url,
      required final String source,
      required final String campaignId}) = _$DeepLinkOpenedEventImpl;

  factory _DeepLinkOpenedEvent.fromJson(Map<String, dynamic> json) =
      _$DeepLinkOpenedEventImpl.fromJson;

  @override
  String get url;
  @override
  String get source;
  @override
  String get campaignId;
  @override
  @JsonKey(ignore: true)
  _$$DeepLinkOpenedEventImplCopyWith<_$DeepLinkOpenedEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
