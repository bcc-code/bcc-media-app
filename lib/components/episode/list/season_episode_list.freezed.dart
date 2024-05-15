// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'season_episode_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SeasonEpisodeListEpisodeData {
  Fragment$SeasonListEpisode get episode => throw _privateConstructorUsedError;
  int? get seasonNumber => throw _privateConstructorUsedError;
  Fragment$LessonProgressOverview? get lessonProgressOverview =>
      throw _privateConstructorUsedError;
  bool? get highlighted => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SeasonEpisodeListEpisodeDataCopyWith<SeasonEpisodeListEpisodeData>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SeasonEpisodeListEpisodeDataCopyWith<$Res> {
  factory $SeasonEpisodeListEpisodeDataCopyWith(
          SeasonEpisodeListEpisodeData value,
          $Res Function(SeasonEpisodeListEpisodeData) then) =
      _$SeasonEpisodeListEpisodeDataCopyWithImpl<$Res,
          SeasonEpisodeListEpisodeData>;
  @useResult
  $Res call(
      {Fragment$SeasonListEpisode episode,
      int? seasonNumber,
      Fragment$LessonProgressOverview? lessonProgressOverview,
      bool? highlighted});
}

/// @nodoc
class _$SeasonEpisodeListEpisodeDataCopyWithImpl<$Res,
        $Val extends SeasonEpisodeListEpisodeData>
    implements $SeasonEpisodeListEpisodeDataCopyWith<$Res> {
  _$SeasonEpisodeListEpisodeDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? episode = null,
    Object? seasonNumber = freezed,
    Object? lessonProgressOverview = freezed,
    Object? highlighted = freezed,
  }) {
    return _then(_value.copyWith(
      episode: null == episode
          ? _value.episode
          : episode // ignore: cast_nullable_to_non_nullable
              as Fragment$SeasonListEpisode,
      seasonNumber: freezed == seasonNumber
          ? _value.seasonNumber
          : seasonNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      lessonProgressOverview: freezed == lessonProgressOverview
          ? _value.lessonProgressOverview
          : lessonProgressOverview // ignore: cast_nullable_to_non_nullable
              as Fragment$LessonProgressOverview?,
      highlighted: freezed == highlighted
          ? _value.highlighted
          : highlighted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SeasonEpisodeListEpisodeDataImplCopyWith<$Res>
    implements $SeasonEpisodeListEpisodeDataCopyWith<$Res> {
  factory _$$SeasonEpisodeListEpisodeDataImplCopyWith(
          _$SeasonEpisodeListEpisodeDataImpl value,
          $Res Function(_$SeasonEpisodeListEpisodeDataImpl) then) =
      __$$SeasonEpisodeListEpisodeDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Fragment$SeasonListEpisode episode,
      int? seasonNumber,
      Fragment$LessonProgressOverview? lessonProgressOverview,
      bool? highlighted});
}

/// @nodoc
class __$$SeasonEpisodeListEpisodeDataImplCopyWithImpl<$Res>
    extends _$SeasonEpisodeListEpisodeDataCopyWithImpl<$Res,
        _$SeasonEpisodeListEpisodeDataImpl>
    implements _$$SeasonEpisodeListEpisodeDataImplCopyWith<$Res> {
  __$$SeasonEpisodeListEpisodeDataImplCopyWithImpl(
      _$SeasonEpisodeListEpisodeDataImpl _value,
      $Res Function(_$SeasonEpisodeListEpisodeDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? episode = null,
    Object? seasonNumber = freezed,
    Object? lessonProgressOverview = freezed,
    Object? highlighted = freezed,
  }) {
    return _then(_$SeasonEpisodeListEpisodeDataImpl(
      episode: null == episode
          ? _value.episode
          : episode // ignore: cast_nullable_to_non_nullable
              as Fragment$SeasonListEpisode,
      seasonNumber: freezed == seasonNumber
          ? _value.seasonNumber
          : seasonNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      lessonProgressOverview: freezed == lessonProgressOverview
          ? _value.lessonProgressOverview
          : lessonProgressOverview // ignore: cast_nullable_to_non_nullable
              as Fragment$LessonProgressOverview?,
      highlighted: freezed == highlighted
          ? _value.highlighted
          : highlighted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$SeasonEpisodeListEpisodeDataImpl
    implements _SeasonEpisodeListEpisodeData {
  const _$SeasonEpisodeListEpisodeDataImpl(
      {required this.episode,
      this.seasonNumber,
      this.lessonProgressOverview,
      this.highlighted});

  @override
  final Fragment$SeasonListEpisode episode;
  @override
  final int? seasonNumber;
  @override
  final Fragment$LessonProgressOverview? lessonProgressOverview;
  @override
  final bool? highlighted;

  @override
  String toString() {
    return 'SeasonEpisodeListEpisodeData(episode: $episode, seasonNumber: $seasonNumber, lessonProgressOverview: $lessonProgressOverview, highlighted: $highlighted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SeasonEpisodeListEpisodeDataImpl &&
            (identical(other.episode, episode) || other.episode == episode) &&
            (identical(other.seasonNumber, seasonNumber) ||
                other.seasonNumber == seasonNumber) &&
            (identical(other.lessonProgressOverview, lessonProgressOverview) ||
                other.lessonProgressOverview == lessonProgressOverview) &&
            (identical(other.highlighted, highlighted) ||
                other.highlighted == highlighted));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, episode, seasonNumber, lessonProgressOverview, highlighted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SeasonEpisodeListEpisodeDataImplCopyWith<
          _$SeasonEpisodeListEpisodeDataImpl>
      get copyWith => __$$SeasonEpisodeListEpisodeDataImplCopyWithImpl<
          _$SeasonEpisodeListEpisodeDataImpl>(this, _$identity);
}

abstract class _SeasonEpisodeListEpisodeData
    implements SeasonEpisodeListEpisodeData {
  const factory _SeasonEpisodeListEpisodeData(
      {required final Fragment$SeasonListEpisode episode,
      final int? seasonNumber,
      final Fragment$LessonProgressOverview? lessonProgressOverview,
      final bool? highlighted}) = _$SeasonEpisodeListEpisodeDataImpl;

  @override
  Fragment$SeasonListEpisode get episode;
  @override
  int? get seasonNumber;
  @override
  Fragment$LessonProgressOverview? get lessonProgressOverview;
  @override
  bool? get highlighted;
  @override
  @JsonKey(ignore: true)
  _$$SeasonEpisodeListEpisodeDataImplCopyWith<
          _$SeasonEpisodeListEpisodeDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
