// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'season_episode_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SeasonEpisodeListEpisodeData {

 Fragment$SeasonListEpisode get episode; int? get seasonNumber; Fragment$LessonProgressOverview? get lessonProgressOverview; bool? get highlighted;
/// Create a copy of SeasonEpisodeListEpisodeData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeasonEpisodeListEpisodeDataCopyWith<SeasonEpisodeListEpisodeData> get copyWith => _$SeasonEpisodeListEpisodeDataCopyWithImpl<SeasonEpisodeListEpisodeData>(this as SeasonEpisodeListEpisodeData, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as SeasonEpisodeListEpisodeData;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeasonEpisodeListEpisodeData&&(identical(other.episode, _this.episode) || other.episode == _this.episode)&&(identical(other.seasonNumber, _this.seasonNumber) || other.seasonNumber == _this.seasonNumber)&&(identical(other.lessonProgressOverview, _this.lessonProgressOverview) || other.lessonProgressOverview == _this.lessonProgressOverview)&&(identical(other.highlighted, _this.highlighted) || other.highlighted == _this.highlighted));
}


@override
int get hashCode {
  final _this = this as SeasonEpisodeListEpisodeData;
  return Object.hash(runtimeType,_this.episode,_this.seasonNumber,_this.lessonProgressOverview,_this.highlighted);
}

@override
String toString() {
  final _this = this as SeasonEpisodeListEpisodeData;
  return 'SeasonEpisodeListEpisodeData(episode: ${_this.episode}, seasonNumber: ${_this.seasonNumber}, lessonProgressOverview: ${_this.lessonProgressOverview}, highlighted: ${_this.highlighted})';
}


}

/// @nodoc
abstract mixin class $SeasonEpisodeListEpisodeDataCopyWith<$Res>  {
  factory $SeasonEpisodeListEpisodeDataCopyWith(SeasonEpisodeListEpisodeData value, $Res Function(SeasonEpisodeListEpisodeData) _then) = _$SeasonEpisodeListEpisodeDataCopyWithImpl;
@useResult
$Res call({
 Fragment$SeasonListEpisode episode, int? seasonNumber, Fragment$LessonProgressOverview? lessonProgressOverview, bool? highlighted
});




}
/// @nodoc
class _$SeasonEpisodeListEpisodeDataCopyWithImpl<$Res>
    implements $SeasonEpisodeListEpisodeDataCopyWith<$Res> {
  _$SeasonEpisodeListEpisodeDataCopyWithImpl(this._self, this._then);

  final SeasonEpisodeListEpisodeData _self;
  final $Res Function(SeasonEpisodeListEpisodeData) _then;

/// Create a copy of SeasonEpisodeListEpisodeData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? episode = null,Object? seasonNumber = freezed,Object? lessonProgressOverview = freezed,Object? highlighted = freezed,}) {
  return _then(SeasonEpisodeListEpisodeData(
episode: null == episode ? _self.episode : episode // ignore: cast_nullable_to_non_nullable
as Fragment$SeasonListEpisode,seasonNumber: freezed == seasonNumber ? _self.seasonNumber : seasonNumber // ignore: cast_nullable_to_non_nullable
as int?,lessonProgressOverview: freezed == lessonProgressOverview ? _self.lessonProgressOverview : lessonProgressOverview // ignore: cast_nullable_to_non_nullable
as Fragment$LessonProgressOverview?,highlighted: freezed == highlighted ? _self.highlighted : highlighted // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [SeasonEpisodeListEpisodeData].
extension SeasonEpisodeListEpisodeDataPatterns on SeasonEpisodeListEpisodeData {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SeasonEpisodeListEpisodeData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SeasonEpisodeListEpisodeData() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SeasonEpisodeListEpisodeData value)  $default,){
final _that = this;
switch (_that) {
case _SeasonEpisodeListEpisodeData():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SeasonEpisodeListEpisodeData value)?  $default,){
final _that = this;
switch (_that) {
case _SeasonEpisodeListEpisodeData() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Fragment$SeasonListEpisode episode,  int? seasonNumber,  Fragment$LessonProgressOverview? lessonProgressOverview,  bool? highlighted)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SeasonEpisodeListEpisodeData() when $default != null:
return $default(_that.episode,_that.seasonNumber,_that.lessonProgressOverview,_that.highlighted);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Fragment$SeasonListEpisode episode,  int? seasonNumber,  Fragment$LessonProgressOverview? lessonProgressOverview,  bool? highlighted)  $default,) {final _that = this;
switch (_that) {
case _SeasonEpisodeListEpisodeData():
return $default(_that.episode,_that.seasonNumber,_that.lessonProgressOverview,_that.highlighted);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Fragment$SeasonListEpisode episode,  int? seasonNumber,  Fragment$LessonProgressOverview? lessonProgressOverview,  bool? highlighted)?  $default,) {final _that = this;
switch (_that) {
case _SeasonEpisodeListEpisodeData() when $default != null:
return $default(_that.episode,_that.seasonNumber,_that.lessonProgressOverview,_that.highlighted);case _:
  return null;

}
}

}

/// @nodoc


class _SeasonEpisodeListEpisodeData implements SeasonEpisodeListEpisodeData {
  const _SeasonEpisodeListEpisodeData({required this.episode, this.seasonNumber, this.lessonProgressOverview, this.highlighted});
  

@override final  Fragment$SeasonListEpisode episode;
@override final  int? seasonNumber;
@override final  Fragment$LessonProgressOverview? lessonProgressOverview;
@override final  bool? highlighted;

/// Create a copy of SeasonEpisodeListEpisodeData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeasonEpisodeListEpisodeDataCopyWith<_SeasonEpisodeListEpisodeData> get copyWith => __$SeasonEpisodeListEpisodeDataCopyWithImpl<_SeasonEpisodeListEpisodeData>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SeasonEpisodeListEpisodeData&&(identical(other.episode, episode) || other.episode == episode)&&(identical(other.seasonNumber, seasonNumber) || other.seasonNumber == seasonNumber)&&(identical(other.lessonProgressOverview, lessonProgressOverview) || other.lessonProgressOverview == lessonProgressOverview)&&(identical(other.highlighted, highlighted) || other.highlighted == highlighted));
}


@override
int get hashCode {
    return Object.hash(runtimeType,episode,seasonNumber,lessonProgressOverview,highlighted);
}

@override
String toString() {
    return 'SeasonEpisodeListEpisodeData(episode: $episode, seasonNumber: $seasonNumber, lessonProgressOverview: $lessonProgressOverview, highlighted: $highlighted)';
}


}

/// @nodoc
abstract mixin class _$SeasonEpisodeListEpisodeDataCopyWith<$Res> implements $SeasonEpisodeListEpisodeDataCopyWith<$Res> {
  factory _$SeasonEpisodeListEpisodeDataCopyWith(_SeasonEpisodeListEpisodeData value, $Res Function(_SeasonEpisodeListEpisodeData) _then) = __$SeasonEpisodeListEpisodeDataCopyWithImpl;
@override @useResult
$Res call({
 Fragment$SeasonListEpisode episode, int? seasonNumber, Fragment$LessonProgressOverview? lessonProgressOverview, bool? highlighted
});




}
/// @nodoc
class __$SeasonEpisodeListEpisodeDataCopyWithImpl<$Res>
    implements _$SeasonEpisodeListEpisodeDataCopyWith<$Res> {
  __$SeasonEpisodeListEpisodeDataCopyWithImpl(this._self, this._then);

  final _SeasonEpisodeListEpisodeData _self;
  final $Res Function(_SeasonEpisodeListEpisodeData) _then;

/// Create a copy of SeasonEpisodeListEpisodeData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? episode = null,Object? seasonNumber = freezed,Object? lessonProgressOverview = freezed,Object? highlighted = freezed,}) {
  return _then(_SeasonEpisodeListEpisodeData(
episode: null == episode ? _self.episode : episode // ignore: cast_nullable_to_non_nullable
as Fragment$SeasonListEpisode,seasonNumber: freezed == seasonNumber ? _self.seasonNumber : seasonNumber // ignore: cast_nullable_to_non_nullable
as int?,lessonProgressOverview: freezed == lessonProgressOverview ? _self.lessonProgressOverview : lessonProgressOverview // ignore: cast_nullable_to_non_nullable
as Fragment$LessonProgressOverview?,highlighted: freezed == highlighted ? _self.highlighted : highlighted // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
