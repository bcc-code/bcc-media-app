// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'downloads.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VideoDownloadStartedEvent _$VideoDownloadStartedEventFromJson(
    Map<String, dynamic> json) {
  return _VideoDownloadStartedEvent.fromJson(json);
}

/// @nodoc
mixin _$VideoDownloadStartedEvent {
  String get downloadId => throw _privateConstructorUsedError;
  String get episodeId => throw _privateConstructorUsedError;
  String? get quality => throw _privateConstructorUsedError;
  String? get audioLanguage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VideoDownloadStartedEventCopyWith<VideoDownloadStartedEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoDownloadStartedEventCopyWith<$Res> {
  factory $VideoDownloadStartedEventCopyWith(VideoDownloadStartedEvent value,
          $Res Function(VideoDownloadStartedEvent) then) =
      _$VideoDownloadStartedEventCopyWithImpl<$Res, VideoDownloadStartedEvent>;
  @useResult
  $Res call(
      {String downloadId,
      String episodeId,
      String? quality,
      String? audioLanguage});
}

/// @nodoc
class _$VideoDownloadStartedEventCopyWithImpl<$Res,
        $Val extends VideoDownloadStartedEvent>
    implements $VideoDownloadStartedEventCopyWith<$Res> {
  _$VideoDownloadStartedEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? downloadId = null,
    Object? episodeId = null,
    Object? quality = freezed,
    Object? audioLanguage = freezed,
  }) {
    return _then(_value.copyWith(
      downloadId: null == downloadId
          ? _value.downloadId
          : downloadId // ignore: cast_nullable_to_non_nullable
              as String,
      episodeId: null == episodeId
          ? _value.episodeId
          : episodeId // ignore: cast_nullable_to_non_nullable
              as String,
      quality: freezed == quality
          ? _value.quality
          : quality // ignore: cast_nullable_to_non_nullable
              as String?,
      audioLanguage: freezed == audioLanguage
          ? _value.audioLanguage
          : audioLanguage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VideoDownloadStartedEventImplCopyWith<$Res>
    implements $VideoDownloadStartedEventCopyWith<$Res> {
  factory _$$VideoDownloadStartedEventImplCopyWith(
          _$VideoDownloadStartedEventImpl value,
          $Res Function(_$VideoDownloadStartedEventImpl) then) =
      __$$VideoDownloadStartedEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String downloadId,
      String episodeId,
      String? quality,
      String? audioLanguage});
}

/// @nodoc
class __$$VideoDownloadStartedEventImplCopyWithImpl<$Res>
    extends _$VideoDownloadStartedEventCopyWithImpl<$Res,
        _$VideoDownloadStartedEventImpl>
    implements _$$VideoDownloadStartedEventImplCopyWith<$Res> {
  __$$VideoDownloadStartedEventImplCopyWithImpl(
      _$VideoDownloadStartedEventImpl _value,
      $Res Function(_$VideoDownloadStartedEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? downloadId = null,
    Object? episodeId = null,
    Object? quality = freezed,
    Object? audioLanguage = freezed,
  }) {
    return _then(_$VideoDownloadStartedEventImpl(
      downloadId: null == downloadId
          ? _value.downloadId
          : downloadId // ignore: cast_nullable_to_non_nullable
              as String,
      episodeId: null == episodeId
          ? _value.episodeId
          : episodeId // ignore: cast_nullable_to_non_nullable
              as String,
      quality: freezed == quality
          ? _value.quality
          : quality // ignore: cast_nullable_to_non_nullable
              as String?,
      audioLanguage: freezed == audioLanguage
          ? _value.audioLanguage
          : audioLanguage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VideoDownloadStartedEventImpl implements _VideoDownloadStartedEvent {
  const _$VideoDownloadStartedEventImpl(
      {required this.downloadId,
      required this.episodeId,
      required this.quality,
      required this.audioLanguage});

  factory _$VideoDownloadStartedEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$VideoDownloadStartedEventImplFromJson(json);

  @override
  final String downloadId;
  @override
  final String episodeId;
  @override
  final String? quality;
  @override
  final String? audioLanguage;

  @override
  String toString() {
    return 'VideoDownloadStartedEvent(downloadId: $downloadId, episodeId: $episodeId, quality: $quality, audioLanguage: $audioLanguage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VideoDownloadStartedEventImpl &&
            (identical(other.downloadId, downloadId) ||
                other.downloadId == downloadId) &&
            (identical(other.episodeId, episodeId) ||
                other.episodeId == episodeId) &&
            (identical(other.quality, quality) || other.quality == quality) &&
            (identical(other.audioLanguage, audioLanguage) ||
                other.audioLanguage == audioLanguage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, downloadId, episodeId, quality, audioLanguage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VideoDownloadStartedEventImplCopyWith<_$VideoDownloadStartedEventImpl>
      get copyWith => __$$VideoDownloadStartedEventImplCopyWithImpl<
          _$VideoDownloadStartedEventImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VideoDownloadStartedEventImplToJson(
      this,
    );
  }
}

abstract class _VideoDownloadStartedEvent implements VideoDownloadStartedEvent {
  const factory _VideoDownloadStartedEvent(
      {required final String downloadId,
      required final String episodeId,
      required final String? quality,
      required final String? audioLanguage}) = _$VideoDownloadStartedEventImpl;

  factory _VideoDownloadStartedEvent.fromJson(Map<String, dynamic> json) =
      _$VideoDownloadStartedEventImpl.fromJson;

  @override
  String get downloadId;
  @override
  String get episodeId;
  @override
  String? get quality;
  @override
  String? get audioLanguage;
  @override
  @JsonKey(ignore: true)
  _$$VideoDownloadStartedEventImplCopyWith<_$VideoDownloadStartedEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

VideoDownloadRemovedEvent _$VideoDownloadRemovedEventFromJson(
    Map<String, dynamic> json) {
  return _VideoDownloadRemovedEvent.fromJson(json);
}

/// @nodoc
mixin _$VideoDownloadRemovedEvent {
  String get downloadId => throw _privateConstructorUsedError;
  String? get episodeId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VideoDownloadRemovedEventCopyWith<VideoDownloadRemovedEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoDownloadRemovedEventCopyWith<$Res> {
  factory $VideoDownloadRemovedEventCopyWith(VideoDownloadRemovedEvent value,
          $Res Function(VideoDownloadRemovedEvent) then) =
      _$VideoDownloadRemovedEventCopyWithImpl<$Res, VideoDownloadRemovedEvent>;
  @useResult
  $Res call({String downloadId, String? episodeId});
}

/// @nodoc
class _$VideoDownloadRemovedEventCopyWithImpl<$Res,
        $Val extends VideoDownloadRemovedEvent>
    implements $VideoDownloadRemovedEventCopyWith<$Res> {
  _$VideoDownloadRemovedEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? downloadId = null,
    Object? episodeId = freezed,
  }) {
    return _then(_value.copyWith(
      downloadId: null == downloadId
          ? _value.downloadId
          : downloadId // ignore: cast_nullable_to_non_nullable
              as String,
      episodeId: freezed == episodeId
          ? _value.episodeId
          : episodeId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VideoDownloadRemovedEventImplCopyWith<$Res>
    implements $VideoDownloadRemovedEventCopyWith<$Res> {
  factory _$$VideoDownloadRemovedEventImplCopyWith(
          _$VideoDownloadRemovedEventImpl value,
          $Res Function(_$VideoDownloadRemovedEventImpl) then) =
      __$$VideoDownloadRemovedEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String downloadId, String? episodeId});
}

/// @nodoc
class __$$VideoDownloadRemovedEventImplCopyWithImpl<$Res>
    extends _$VideoDownloadRemovedEventCopyWithImpl<$Res,
        _$VideoDownloadRemovedEventImpl>
    implements _$$VideoDownloadRemovedEventImplCopyWith<$Res> {
  __$$VideoDownloadRemovedEventImplCopyWithImpl(
      _$VideoDownloadRemovedEventImpl _value,
      $Res Function(_$VideoDownloadRemovedEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? downloadId = null,
    Object? episodeId = freezed,
  }) {
    return _then(_$VideoDownloadRemovedEventImpl(
      downloadId: null == downloadId
          ? _value.downloadId
          : downloadId // ignore: cast_nullable_to_non_nullable
              as String,
      episodeId: freezed == episodeId
          ? _value.episodeId
          : episodeId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VideoDownloadRemovedEventImpl implements _VideoDownloadRemovedEvent {
  const _$VideoDownloadRemovedEventImpl(
      {required this.downloadId, required this.episodeId});

  factory _$VideoDownloadRemovedEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$VideoDownloadRemovedEventImplFromJson(json);

  @override
  final String downloadId;
  @override
  final String? episodeId;

  @override
  String toString() {
    return 'VideoDownloadRemovedEvent(downloadId: $downloadId, episodeId: $episodeId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VideoDownloadRemovedEventImpl &&
            (identical(other.downloadId, downloadId) ||
                other.downloadId == downloadId) &&
            (identical(other.episodeId, episodeId) ||
                other.episodeId == episodeId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, downloadId, episodeId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VideoDownloadRemovedEventImplCopyWith<_$VideoDownloadRemovedEventImpl>
      get copyWith => __$$VideoDownloadRemovedEventImplCopyWithImpl<
          _$VideoDownloadRemovedEventImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VideoDownloadRemovedEventImplToJson(
      this,
    );
  }
}

abstract class _VideoDownloadRemovedEvent implements VideoDownloadRemovedEvent {
  const factory _VideoDownloadRemovedEvent(
      {required final String downloadId,
      required final String? episodeId}) = _$VideoDownloadRemovedEventImpl;

  factory _VideoDownloadRemovedEvent.fromJson(Map<String, dynamic> json) =
      _$VideoDownloadRemovedEventImpl.fromJson;

  @override
  String get downloadId;
  @override
  String? get episodeId;
  @override
  @JsonKey(ignore: true)
  _$$VideoDownloadRemovedEventImplCopyWith<_$VideoDownloadRemovedEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

VideoDownloadPlayedEvent _$VideoDownloadPlayedEventFromJson(
    Map<String, dynamic> json) {
  return _VideoDownloadPlayedEvent.fromJson(json);
}

/// @nodoc
mixin _$VideoDownloadPlayedEvent {
  String get downloadId => throw _privateConstructorUsedError;
  String? get episodeId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VideoDownloadPlayedEventCopyWith<VideoDownloadPlayedEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoDownloadPlayedEventCopyWith<$Res> {
  factory $VideoDownloadPlayedEventCopyWith(VideoDownloadPlayedEvent value,
          $Res Function(VideoDownloadPlayedEvent) then) =
      _$VideoDownloadPlayedEventCopyWithImpl<$Res, VideoDownloadPlayedEvent>;
  @useResult
  $Res call({String downloadId, String? episodeId});
}

/// @nodoc
class _$VideoDownloadPlayedEventCopyWithImpl<$Res,
        $Val extends VideoDownloadPlayedEvent>
    implements $VideoDownloadPlayedEventCopyWith<$Res> {
  _$VideoDownloadPlayedEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? downloadId = null,
    Object? episodeId = freezed,
  }) {
    return _then(_value.copyWith(
      downloadId: null == downloadId
          ? _value.downloadId
          : downloadId // ignore: cast_nullable_to_non_nullable
              as String,
      episodeId: freezed == episodeId
          ? _value.episodeId
          : episodeId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VideoDownloadPlayedEventImplCopyWith<$Res>
    implements $VideoDownloadPlayedEventCopyWith<$Res> {
  factory _$$VideoDownloadPlayedEventImplCopyWith(
          _$VideoDownloadPlayedEventImpl value,
          $Res Function(_$VideoDownloadPlayedEventImpl) then) =
      __$$VideoDownloadPlayedEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String downloadId, String? episodeId});
}

/// @nodoc
class __$$VideoDownloadPlayedEventImplCopyWithImpl<$Res>
    extends _$VideoDownloadPlayedEventCopyWithImpl<$Res,
        _$VideoDownloadPlayedEventImpl>
    implements _$$VideoDownloadPlayedEventImplCopyWith<$Res> {
  __$$VideoDownloadPlayedEventImplCopyWithImpl(
      _$VideoDownloadPlayedEventImpl _value,
      $Res Function(_$VideoDownloadPlayedEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? downloadId = null,
    Object? episodeId = freezed,
  }) {
    return _then(_$VideoDownloadPlayedEventImpl(
      downloadId: null == downloadId
          ? _value.downloadId
          : downloadId // ignore: cast_nullable_to_non_nullable
              as String,
      episodeId: freezed == episodeId
          ? _value.episodeId
          : episodeId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VideoDownloadPlayedEventImpl implements _VideoDownloadPlayedEvent {
  const _$VideoDownloadPlayedEventImpl(
      {required this.downloadId, required this.episodeId});

  factory _$VideoDownloadPlayedEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$VideoDownloadPlayedEventImplFromJson(json);

  @override
  final String downloadId;
  @override
  final String? episodeId;

  @override
  String toString() {
    return 'VideoDownloadPlayedEvent(downloadId: $downloadId, episodeId: $episodeId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VideoDownloadPlayedEventImpl &&
            (identical(other.downloadId, downloadId) ||
                other.downloadId == downloadId) &&
            (identical(other.episodeId, episodeId) ||
                other.episodeId == episodeId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, downloadId, episodeId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VideoDownloadPlayedEventImplCopyWith<_$VideoDownloadPlayedEventImpl>
      get copyWith => __$$VideoDownloadPlayedEventImplCopyWithImpl<
          _$VideoDownloadPlayedEventImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VideoDownloadPlayedEventImplToJson(
      this,
    );
  }
}

abstract class _VideoDownloadPlayedEvent implements VideoDownloadPlayedEvent {
  const factory _VideoDownloadPlayedEvent(
      {required final String downloadId,
      required final String? episodeId}) = _$VideoDownloadPlayedEventImpl;

  factory _VideoDownloadPlayedEvent.fromJson(Map<String, dynamic> json) =
      _$VideoDownloadPlayedEventImpl.fromJson;

  @override
  String get downloadId;
  @override
  String? get episodeId;
  @override
  @JsonKey(ignore: true)
  _$$VideoDownloadPlayedEventImplCopyWith<_$VideoDownloadPlayedEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}
