// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'episode_thumbnail_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EpisodeThumbnailData {
  int get duration => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  bool get locked => throw _privateConstructorUsedError;
  int? get progress => throw _privateConstructorUsedError;
  String? get publishDate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EpisodeThumbnailDataCopyWith<EpisodeThumbnailData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EpisodeThumbnailDataCopyWith<$Res> {
  factory $EpisodeThumbnailDataCopyWith(EpisodeThumbnailData value,
          $Res Function(EpisodeThumbnailData) then) =
      _$EpisodeThumbnailDataCopyWithImpl<$Res, EpisodeThumbnailData>;
  @useResult
  $Res call(
      {int duration,
      String? image,
      bool locked,
      int? progress,
      String? publishDate});
}

/// @nodoc
class _$EpisodeThumbnailDataCopyWithImpl<$Res,
        $Val extends EpisodeThumbnailData>
    implements $EpisodeThumbnailDataCopyWith<$Res> {
  _$EpisodeThumbnailDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = null,
    Object? image = freezed,
    Object? locked = null,
    Object? progress = freezed,
    Object? publishDate = freezed,
  }) {
    return _then(_value.copyWith(
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      locked: null == locked
          ? _value.locked
          : locked // ignore: cast_nullable_to_non_nullable
              as bool,
      progress: freezed == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as int?,
      publishDate: freezed == publishDate
          ? _value.publishDate
          : publishDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EpisodeThumbnailDataCopyWith<$Res>
    implements $EpisodeThumbnailDataCopyWith<$Res> {
  factory _$$_EpisodeThumbnailDataCopyWith(_$_EpisodeThumbnailData value,
          $Res Function(_$_EpisodeThumbnailData) then) =
      __$$_EpisodeThumbnailDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int duration,
      String? image,
      bool locked,
      int? progress,
      String? publishDate});
}

/// @nodoc
class __$$_EpisodeThumbnailDataCopyWithImpl<$Res>
    extends _$EpisodeThumbnailDataCopyWithImpl<$Res, _$_EpisodeThumbnailData>
    implements _$$_EpisodeThumbnailDataCopyWith<$Res> {
  __$$_EpisodeThumbnailDataCopyWithImpl(_$_EpisodeThumbnailData _value,
      $Res Function(_$_EpisodeThumbnailData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = null,
    Object? image = freezed,
    Object? locked = null,
    Object? progress = freezed,
    Object? publishDate = freezed,
  }) {
    return _then(_$_EpisodeThumbnailData(
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      locked: null == locked
          ? _value.locked
          : locked // ignore: cast_nullable_to_non_nullable
              as bool,
      progress: freezed == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as int?,
      publishDate: freezed == publishDate
          ? _value.publishDate
          : publishDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_EpisodeThumbnailData implements _EpisodeThumbnailData {
  const _$_EpisodeThumbnailData(
      {required this.duration,
      this.image,
      required this.locked,
      this.progress,
      this.publishDate});

  @override
  final int duration;
  @override
  final String? image;
  @override
  final bool locked;
  @override
  final int? progress;
  @override
  final String? publishDate;

  @override
  String toString() {
    return 'EpisodeThumbnailData(duration: $duration, image: $image, locked: $locked, progress: $progress, publishDate: $publishDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EpisodeThumbnailData &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.locked, locked) || other.locked == locked) &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            (identical(other.publishDate, publishDate) ||
                other.publishDate == publishDate));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, duration, image, locked, progress, publishDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EpisodeThumbnailDataCopyWith<_$_EpisodeThumbnailData> get copyWith =>
      __$$_EpisodeThumbnailDataCopyWithImpl<_$_EpisodeThumbnailData>(
          this, _$identity);
}

abstract class _EpisodeThumbnailData implements EpisodeThumbnailData {
  const factory _EpisodeThumbnailData(
      {required final int duration,
      final String? image,
      required final bool locked,
      final int? progress,
      final String? publishDate}) = _$_EpisodeThumbnailData;

  @override
  int get duration;
  @override
  String? get image;
  @override
  bool get locked;
  @override
  int? get progress;
  @override
  String? get publishDate;
  @override
  @JsonKey(ignore: true)
  _$$_EpisodeThumbnailDataCopyWith<_$_EpisodeThumbnailData> get copyWith =>
      throw _privateConstructorUsedError;
}
