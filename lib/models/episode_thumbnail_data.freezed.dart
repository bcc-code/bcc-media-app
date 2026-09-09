// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'episode_thumbnail_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EpisodeThumbnailData {

 String get title; int? get duration; String? get image; bool get locked; int? get progress; String? get publishDate; int? get number; String? get showTitle; int? get seasonNumber;
/// Create a copy of EpisodeThumbnailData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EpisodeThumbnailDataCopyWith<EpisodeThumbnailData> get copyWith => _$EpisodeThumbnailDataCopyWithImpl<EpisodeThumbnailData>(this as EpisodeThumbnailData, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as EpisodeThumbnailData;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EpisodeThumbnailData&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.duration, _this.duration) || other.duration == _this.duration)&&(identical(other.image, _this.image) || other.image == _this.image)&&(identical(other.locked, _this.locked) || other.locked == _this.locked)&&(identical(other.progress, _this.progress) || other.progress == _this.progress)&&(identical(other.publishDate, _this.publishDate) || other.publishDate == _this.publishDate)&&(identical(other.number, _this.number) || other.number == _this.number)&&(identical(other.showTitle, _this.showTitle) || other.showTitle == _this.showTitle)&&(identical(other.seasonNumber, _this.seasonNumber) || other.seasonNumber == _this.seasonNumber));
}


@override
int get hashCode {
  final _this = this as EpisodeThumbnailData;
  return Object.hash(runtimeType,_this.title,_this.duration,_this.image,_this.locked,_this.progress,_this.publishDate,_this.number,_this.showTitle,_this.seasonNumber);
}

@override
String toString() {
  final _this = this as EpisodeThumbnailData;
  return 'EpisodeThumbnailData(title: ${_this.title}, duration: ${_this.duration}, image: ${_this.image}, locked: ${_this.locked}, progress: ${_this.progress}, publishDate: ${_this.publishDate}, number: ${_this.number}, showTitle: ${_this.showTitle}, seasonNumber: ${_this.seasonNumber})';
}


}

/// @nodoc
abstract mixin class $EpisodeThumbnailDataCopyWith<$Res>  {
  factory $EpisodeThumbnailDataCopyWith(EpisodeThumbnailData value, $Res Function(EpisodeThumbnailData) _then) = _$EpisodeThumbnailDataCopyWithImpl;
@useResult
$Res call({
 String title, int? duration, String? image, bool locked, int? progress, String? publishDate, int? number, String? showTitle, int? seasonNumber
});




}
/// @nodoc
class _$EpisodeThumbnailDataCopyWithImpl<$Res>
    implements $EpisodeThumbnailDataCopyWith<$Res> {
  _$EpisodeThumbnailDataCopyWithImpl(this._self, this._then);

  final EpisodeThumbnailData _self;
  final $Res Function(EpisodeThumbnailData) _then;

/// Create a copy of EpisodeThumbnailData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? duration = freezed,Object? image = freezed,Object? locked = null,Object? progress = freezed,Object? publishDate = freezed,Object? number = freezed,Object? showTitle = freezed,Object? seasonNumber = freezed,}) {
  return _then(EpisodeThumbnailData(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,locked: null == locked ? _self.locked : locked // ignore: cast_nullable_to_non_nullable
as bool,progress: freezed == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as int?,publishDate: freezed == publishDate ? _self.publishDate : publishDate // ignore: cast_nullable_to_non_nullable
as String?,number: freezed == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int?,showTitle: freezed == showTitle ? _self.showTitle : showTitle // ignore: cast_nullable_to_non_nullable
as String?,seasonNumber: freezed == seasonNumber ? _self.seasonNumber : seasonNumber // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [EpisodeThumbnailData].
extension EpisodeThumbnailDataPatterns on EpisodeThumbnailData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EpisodeThumbnailData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EpisodeThumbnailData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EpisodeThumbnailData value)  $default,){
final _that = this;
switch (_that) {
case _EpisodeThumbnailData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EpisodeThumbnailData value)?  $default,){
final _that = this;
switch (_that) {
case _EpisodeThumbnailData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  int? duration,  String? image,  bool locked,  int? progress,  String? publishDate,  int? number,  String? showTitle,  int? seasonNumber)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EpisodeThumbnailData() when $default != null:
return $default(_that.title,_that.duration,_that.image,_that.locked,_that.progress,_that.publishDate,_that.number,_that.showTitle,_that.seasonNumber);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  int? duration,  String? image,  bool locked,  int? progress,  String? publishDate,  int? number,  String? showTitle,  int? seasonNumber)  $default,) {final _that = this;
switch (_that) {
case _EpisodeThumbnailData():
return $default(_that.title,_that.duration,_that.image,_that.locked,_that.progress,_that.publishDate,_that.number,_that.showTitle,_that.seasonNumber);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  int? duration,  String? image,  bool locked,  int? progress,  String? publishDate,  int? number,  String? showTitle,  int? seasonNumber)?  $default,) {final _that = this;
switch (_that) {
case _EpisodeThumbnailData() when $default != null:
return $default(_that.title,_that.duration,_that.image,_that.locked,_that.progress,_that.publishDate,_that.number,_that.showTitle,_that.seasonNumber);case _:
  return null;

}
}

}

/// @nodoc


class _EpisodeThumbnailData implements EpisodeThumbnailData {
  const _EpisodeThumbnailData({required this.title, this.duration, this.image, required this.locked, this.progress, this.publishDate, this.number, this.showTitle, this.seasonNumber});
  

@override final  String title;
@override final  int? duration;
@override final  String? image;
@override final  bool locked;
@override final  int? progress;
@override final  String? publishDate;
@override final  int? number;
@override final  String? showTitle;
@override final  int? seasonNumber;

/// Create a copy of EpisodeThumbnailData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EpisodeThumbnailDataCopyWith<_EpisodeThumbnailData> get copyWith => __$EpisodeThumbnailDataCopyWithImpl<_EpisodeThumbnailData>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _EpisodeThumbnailData&&(identical(other.title, title) || other.title == title)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.image, image) || other.image == image)&&(identical(other.locked, locked) || other.locked == locked)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.publishDate, publishDate) || other.publishDate == publishDate)&&(identical(other.number, number) || other.number == number)&&(identical(other.showTitle, showTitle) || other.showTitle == showTitle)&&(identical(other.seasonNumber, seasonNumber) || other.seasonNumber == seasonNumber));
}


@override
int get hashCode {
    return Object.hash(runtimeType,title,duration,image,locked,progress,publishDate,number,showTitle,seasonNumber);
}

@override
String toString() {
    return 'EpisodeThumbnailData(title: $title, duration: $duration, image: $image, locked: $locked, progress: $progress, publishDate: $publishDate, number: $number, showTitle: $showTitle, seasonNumber: $seasonNumber)';
}


}

/// @nodoc
abstract mixin class _$EpisodeThumbnailDataCopyWith<$Res> implements $EpisodeThumbnailDataCopyWith<$Res> {
  factory _$EpisodeThumbnailDataCopyWith(_EpisodeThumbnailData value, $Res Function(_EpisodeThumbnailData) _then) = __$EpisodeThumbnailDataCopyWithImpl;
@override @useResult
$Res call({
 String title, int? duration, String? image, bool locked, int? progress, String? publishDate, int? number, String? showTitle, int? seasonNumber
});




}
/// @nodoc
class __$EpisodeThumbnailDataCopyWithImpl<$Res>
    implements _$EpisodeThumbnailDataCopyWith<$Res> {
  __$EpisodeThumbnailDataCopyWithImpl(this._self, this._then);

  final _EpisodeThumbnailData _self;
  final $Res Function(_EpisodeThumbnailData) _then;

/// Create a copy of EpisodeThumbnailData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? duration = freezed,Object? image = freezed,Object? locked = null,Object? progress = freezed,Object? publishDate = freezed,Object? number = freezed,Object? showTitle = freezed,Object? seasonNumber = freezed,}) {
  return _then(_EpisodeThumbnailData(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,locked: null == locked ? _self.locked : locked // ignore: cast_nullable_to_non_nullable
as bool,progress: freezed == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as int?,publishDate: freezed == publishDate ? _self.publishDate : publishDate // ignore: cast_nullable_to_non_nullable
as String?,number: freezed == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int?,showTitle: freezed == showTitle ? _self.showTitle : showTitle // ignore: cast_nullable_to_non_nullable
as String?,seasonNumber: freezed == seasonNumber ? _self.seasonNumber : seasonNumber // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
