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
abstract class _$$_VideoDownloadStartedEventCopyWith<$Res>
    implements $VideoDownloadStartedEventCopyWith<$Res> {
  factory _$$_VideoDownloadStartedEventCopyWith(
          _$_VideoDownloadStartedEvent value,
          $Res Function(_$_VideoDownloadStartedEvent) then) =
      __$$_VideoDownloadStartedEventCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String downloadId,
      String episodeId,
      String? quality,
      String? audioLanguage});
}

/// @nodoc
class __$$_VideoDownloadStartedEventCopyWithImpl<$Res>
    extends _$VideoDownloadStartedEventCopyWithImpl<$Res,
        _$_VideoDownloadStartedEvent>
    implements _$$_VideoDownloadStartedEventCopyWith<$Res> {
  __$$_VideoDownloadStartedEventCopyWithImpl(
      _$_VideoDownloadStartedEvent _value,
      $Res Function(_$_VideoDownloadStartedEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? downloadId = null,
    Object? episodeId = null,
    Object? quality = freezed,
    Object? audioLanguage = freezed,
  }) {
    return _then(_$_VideoDownloadStartedEvent(
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
class _$_VideoDownloadStartedEvent implements _VideoDownloadStartedEvent {
  const _$_VideoDownloadStartedEvent(
      {required this.downloadId,
      required this.episodeId,
      required this.quality,
      required this.audioLanguage});

  factory _$_VideoDownloadStartedEvent.fromJson(Map<String, dynamic> json) =>
      _$$_VideoDownloadStartedEventFromJson(json);

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
            other is _$_VideoDownloadStartedEvent &&
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
  _$$_VideoDownloadStartedEventCopyWith<_$_VideoDownloadStartedEvent>
      get copyWith => __$$_VideoDownloadStartedEventCopyWithImpl<
          _$_VideoDownloadStartedEvent>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VideoDownloadStartedEventToJson(
      this,
    );
  }
}

abstract class _VideoDownloadStartedEvent implements VideoDownloadStartedEvent {
  const factory _VideoDownloadStartedEvent(
      {required final String downloadId,
      required final String episodeId,
      required final String? quality,
      required final String? audioLanguage}) = _$_VideoDownloadStartedEvent;

  factory _VideoDownloadStartedEvent.fromJson(Map<String, dynamic> json) =
      _$_VideoDownloadStartedEvent.fromJson;

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
  _$$_VideoDownloadStartedEventCopyWith<_$_VideoDownloadStartedEvent>
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
abstract class _$$_VideoDownloadRemovedEventCopyWith<$Res>
    implements $VideoDownloadRemovedEventCopyWith<$Res> {
  factory _$$_VideoDownloadRemovedEventCopyWith(
          _$_VideoDownloadRemovedEvent value,
          $Res Function(_$_VideoDownloadRemovedEvent) then) =
      __$$_VideoDownloadRemovedEventCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String downloadId, String? episodeId});
}

/// @nodoc
class __$$_VideoDownloadRemovedEventCopyWithImpl<$Res>
    extends _$VideoDownloadRemovedEventCopyWithImpl<$Res,
        _$_VideoDownloadRemovedEvent>
    implements _$$_VideoDownloadRemovedEventCopyWith<$Res> {
  __$$_VideoDownloadRemovedEventCopyWithImpl(
      _$_VideoDownloadRemovedEvent _value,
      $Res Function(_$_VideoDownloadRemovedEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? downloadId = null,
    Object? episodeId = freezed,
  }) {
    return _then(_$_VideoDownloadRemovedEvent(
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
class _$_VideoDownloadRemovedEvent implements _VideoDownloadRemovedEvent {
  const _$_VideoDownloadRemovedEvent(
      {required this.downloadId, required this.episodeId});

  factory _$_VideoDownloadRemovedEvent.fromJson(Map<String, dynamic> json) =>
      _$$_VideoDownloadRemovedEventFromJson(json);

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
            other is _$_VideoDownloadRemovedEvent &&
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
  _$$_VideoDownloadRemovedEventCopyWith<_$_VideoDownloadRemovedEvent>
      get copyWith => __$$_VideoDownloadRemovedEventCopyWithImpl<
          _$_VideoDownloadRemovedEvent>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VideoDownloadRemovedEventToJson(
      this,
    );
  }
}

abstract class _VideoDownloadRemovedEvent implements VideoDownloadRemovedEvent {
  const factory _VideoDownloadRemovedEvent(
      {required final String downloadId,
      required final String? episodeId}) = _$_VideoDownloadRemovedEvent;

  factory _VideoDownloadRemovedEvent.fromJson(Map<String, dynamic> json) =
      _$_VideoDownloadRemovedEvent.fromJson;

  @override
  String get downloadId;
  @override
  String? get episodeId;
  @override
  @JsonKey(ignore: true)
  _$$_VideoDownloadRemovedEventCopyWith<_$_VideoDownloadRemovedEvent>
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
abstract class _$$_VideoDownloadPlayedEventCopyWith<$Res>
    implements $VideoDownloadPlayedEventCopyWith<$Res> {
  factory _$$_VideoDownloadPlayedEventCopyWith(
          _$_VideoDownloadPlayedEvent value,
          $Res Function(_$_VideoDownloadPlayedEvent) then) =
      __$$_VideoDownloadPlayedEventCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String downloadId, String? episodeId});
}

/// @nodoc
class __$$_VideoDownloadPlayedEventCopyWithImpl<$Res>
    extends _$VideoDownloadPlayedEventCopyWithImpl<$Res,
        _$_VideoDownloadPlayedEvent>
    implements _$$_VideoDownloadPlayedEventCopyWith<$Res> {
  __$$_VideoDownloadPlayedEventCopyWithImpl(_$_VideoDownloadPlayedEvent _value,
      $Res Function(_$_VideoDownloadPlayedEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? downloadId = null,
    Object? episodeId = freezed,
  }) {
    return _then(_$_VideoDownloadPlayedEvent(
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
class _$_VideoDownloadPlayedEvent implements _VideoDownloadPlayedEvent {
  const _$_VideoDownloadPlayedEvent(
      {required this.downloadId, required this.episodeId});

  factory _$_VideoDownloadPlayedEvent.fromJson(Map<String, dynamic> json) =>
      _$$_VideoDownloadPlayedEventFromJson(json);

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
            other is _$_VideoDownloadPlayedEvent &&
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
  _$$_VideoDownloadPlayedEventCopyWith<_$_VideoDownloadPlayedEvent>
      get copyWith => __$$_VideoDownloadPlayedEventCopyWithImpl<
          _$_VideoDownloadPlayedEvent>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VideoDownloadPlayedEventToJson(
      this,
    );
  }
}

abstract class _VideoDownloadPlayedEvent implements VideoDownloadPlayedEvent {
  const factory _VideoDownloadPlayedEvent(
      {required final String downloadId,
      required final String? episodeId}) = _$_VideoDownloadPlayedEvent;

  factory _VideoDownloadPlayedEvent.fromJson(Map<String, dynamic> json) =
      _$_VideoDownloadPlayedEvent.fromJson;

  @override
  String get downloadId;
  @override
  String? get episodeId;
  @override
  @JsonKey(ignore: true)
  _$$_VideoDownloadPlayedEventCopyWith<_$_VideoDownloadPlayedEvent>
      get copyWith => throw _privateConstructorUsedError;
}
