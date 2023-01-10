// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
      _$DeepLinkOpenedEventCopyWithImpl<$Res>;
  $Res call({String url, String source, String campaignId});
}

/// @nodoc
class _$DeepLinkOpenedEventCopyWithImpl<$Res>
    implements $DeepLinkOpenedEventCopyWith<$Res> {
  _$DeepLinkOpenedEventCopyWithImpl(this._value, this._then);

  final DeepLinkOpenedEvent _value;
  // ignore: unused_field
  final $Res Function(DeepLinkOpenedEvent) _then;

  @override
  $Res call({
    Object? url = freezed,
    Object? source = freezed,
    Object? campaignId = freezed,
  }) {
    return _then(_value.copyWith(
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      source: source == freezed
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      campaignId: campaignId == freezed
          ? _value.campaignId
          : campaignId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_DeepLinkOpenedEventCopyWith<$Res>
    implements $DeepLinkOpenedEventCopyWith<$Res> {
  factory _$$_DeepLinkOpenedEventCopyWith(_$_DeepLinkOpenedEvent value,
          $Res Function(_$_DeepLinkOpenedEvent) then) =
      __$$_DeepLinkOpenedEventCopyWithImpl<$Res>;
  @override
  $Res call({String url, String source, String campaignId});
}

/// @nodoc
class __$$_DeepLinkOpenedEventCopyWithImpl<$Res>
    extends _$DeepLinkOpenedEventCopyWithImpl<$Res>
    implements _$$_DeepLinkOpenedEventCopyWith<$Res> {
  __$$_DeepLinkOpenedEventCopyWithImpl(_$_DeepLinkOpenedEvent _value,
      $Res Function(_$_DeepLinkOpenedEvent) _then)
      : super(_value, (v) => _then(v as _$_DeepLinkOpenedEvent));

  @override
  _$_DeepLinkOpenedEvent get _value => super._value as _$_DeepLinkOpenedEvent;

  @override
  $Res call({
    Object? url = freezed,
    Object? source = freezed,
    Object? campaignId = freezed,
  }) {
    return _then(_$_DeepLinkOpenedEvent(
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      source: source == freezed
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      campaignId: campaignId == freezed
          ? _value.campaignId
          : campaignId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DeepLinkOpenedEvent implements _DeepLinkOpenedEvent {
  const _$_DeepLinkOpenedEvent(
      {required this.url, required this.source, required this.campaignId});

  factory _$_DeepLinkOpenedEvent.fromJson(Map<String, dynamic> json) =>
      _$$_DeepLinkOpenedEventFromJson(json);

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
            other is _$_DeepLinkOpenedEvent &&
            const DeepCollectionEquality().equals(other.url, url) &&
            const DeepCollectionEquality().equals(other.source, source) &&
            const DeepCollectionEquality()
                .equals(other.campaignId, campaignId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(url),
      const DeepCollectionEquality().hash(source),
      const DeepCollectionEquality().hash(campaignId));

  @JsonKey(ignore: true)
  @override
  _$$_DeepLinkOpenedEventCopyWith<_$_DeepLinkOpenedEvent> get copyWith =>
      __$$_DeepLinkOpenedEventCopyWithImpl<_$_DeepLinkOpenedEvent>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DeepLinkOpenedEventToJson(
      this,
    );
  }
}

abstract class _DeepLinkOpenedEvent implements DeepLinkOpenedEvent {
  const factory _DeepLinkOpenedEvent(
      {required final String url,
      required final String source,
      required final String campaignId}) = _$_DeepLinkOpenedEvent;

  factory _DeepLinkOpenedEvent.fromJson(Map<String, dynamic> json) =
      _$_DeepLinkOpenedEvent.fromJson;

  @override
  String get url;
  @override
  String get source;
  @override
  String get campaignId;
  @override
  @JsonKey(ignore: true)
  _$$_DeepLinkOpenedEventCopyWith<_$_DeepLinkOpenedEvent> get copyWith =>
      throw _privateConstructorUsedError;
}
