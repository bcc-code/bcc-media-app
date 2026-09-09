// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feature_flags.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FeatureFlags {

 List<String> get variants; bool get publicSignup; bool get socialSignup; bool get shorts; bool get shortsHideBeta; bool get shortsGuide; bool get disableNpawShorts; bool get kidsNotificationPrompt; int? get kidsNotificationPromptPosition; bool get kidsNotificationPromptAfterDismissal; int? get kidsNotificationPromptAfterDismissalCount; bool get kidsDonationLink;
/// Create a copy of FeatureFlags
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeatureFlagsCopyWith<FeatureFlags> get copyWith => _$FeatureFlagsCopyWithImpl<FeatureFlags>(this as FeatureFlags, _$identity);

  /// Serializes this FeatureFlags to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as FeatureFlags;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeatureFlags&&const DeepCollectionEquality().equals(other.variants, _this.variants)&&(identical(other.publicSignup, _this.publicSignup) || other.publicSignup == _this.publicSignup)&&(identical(other.socialSignup, _this.socialSignup) || other.socialSignup == _this.socialSignup)&&(identical(other.shorts, _this.shorts) || other.shorts == _this.shorts)&&(identical(other.shortsHideBeta, _this.shortsHideBeta) || other.shortsHideBeta == _this.shortsHideBeta)&&(identical(other.shortsGuide, _this.shortsGuide) || other.shortsGuide == _this.shortsGuide)&&(identical(other.disableNpawShorts, _this.disableNpawShorts) || other.disableNpawShorts == _this.disableNpawShorts)&&(identical(other.kidsNotificationPrompt, _this.kidsNotificationPrompt) || other.kidsNotificationPrompt == _this.kidsNotificationPrompt)&&(identical(other.kidsNotificationPromptPosition, _this.kidsNotificationPromptPosition) || other.kidsNotificationPromptPosition == _this.kidsNotificationPromptPosition)&&(identical(other.kidsNotificationPromptAfterDismissal, _this.kidsNotificationPromptAfterDismissal) || other.kidsNotificationPromptAfterDismissal == _this.kidsNotificationPromptAfterDismissal)&&(identical(other.kidsNotificationPromptAfterDismissalCount, _this.kidsNotificationPromptAfterDismissalCount) || other.kidsNotificationPromptAfterDismissalCount == _this.kidsNotificationPromptAfterDismissalCount)&&(identical(other.kidsDonationLink, _this.kidsDonationLink) || other.kidsDonationLink == _this.kidsDonationLink));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as FeatureFlags;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.variants),_this.publicSignup,_this.socialSignup,_this.shorts,_this.shortsHideBeta,_this.shortsGuide,_this.disableNpawShorts,_this.kidsNotificationPrompt,_this.kidsNotificationPromptPosition,_this.kidsNotificationPromptAfterDismissal,_this.kidsNotificationPromptAfterDismissalCount,_this.kidsDonationLink);
}

@override
String toString() {
  final _this = this as FeatureFlags;
  return 'FeatureFlags(variants: ${_this.variants}, publicSignup: ${_this.publicSignup}, socialSignup: ${_this.socialSignup}, shorts: ${_this.shorts}, shortsHideBeta: ${_this.shortsHideBeta}, shortsGuide: ${_this.shortsGuide}, disableNpawShorts: ${_this.disableNpawShorts}, kidsNotificationPrompt: ${_this.kidsNotificationPrompt}, kidsNotificationPromptPosition: ${_this.kidsNotificationPromptPosition}, kidsNotificationPromptAfterDismissal: ${_this.kidsNotificationPromptAfterDismissal}, kidsNotificationPromptAfterDismissalCount: ${_this.kidsNotificationPromptAfterDismissalCount}, kidsDonationLink: ${_this.kidsDonationLink})';
}


}

/// @nodoc
abstract mixin class $FeatureFlagsCopyWith<$Res>  {
  factory $FeatureFlagsCopyWith(FeatureFlags value, $Res Function(FeatureFlags) _then) = _$FeatureFlagsCopyWithImpl;
@useResult
$Res call({
 List<String> variants, bool publicSignup, bool socialSignup, bool shorts, bool shortsHideBeta, bool shortsGuide, bool disableNpawShorts, bool kidsNotificationPrompt, int? kidsNotificationPromptPosition, bool kidsNotificationPromptAfterDismissal, int? kidsNotificationPromptAfterDismissalCount, bool kidsDonationLink
});




}
/// @nodoc
class _$FeatureFlagsCopyWithImpl<$Res>
    implements $FeatureFlagsCopyWith<$Res> {
  _$FeatureFlagsCopyWithImpl(this._self, this._then);

  final FeatureFlags _self;
  final $Res Function(FeatureFlags) _then;

/// Create a copy of FeatureFlags
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? variants = null,Object? publicSignup = null,Object? socialSignup = null,Object? shorts = null,Object? shortsHideBeta = null,Object? shortsGuide = null,Object? disableNpawShorts = null,Object? kidsNotificationPrompt = null,Object? kidsNotificationPromptPosition = freezed,Object? kidsNotificationPromptAfterDismissal = null,Object? kidsNotificationPromptAfterDismissalCount = freezed,Object? kidsDonationLink = null,}) {
  return _then(FeatureFlags(
variants: null == variants ? _self.variants : variants // ignore: cast_nullable_to_non_nullable
as List<String>,publicSignup: null == publicSignup ? _self.publicSignup : publicSignup // ignore: cast_nullable_to_non_nullable
as bool,socialSignup: null == socialSignup ? _self.socialSignup : socialSignup // ignore: cast_nullable_to_non_nullable
as bool,shorts: null == shorts ? _self.shorts : shorts // ignore: cast_nullable_to_non_nullable
as bool,shortsHideBeta: null == shortsHideBeta ? _self.shortsHideBeta : shortsHideBeta // ignore: cast_nullable_to_non_nullable
as bool,shortsGuide: null == shortsGuide ? _self.shortsGuide : shortsGuide // ignore: cast_nullable_to_non_nullable
as bool,disableNpawShorts: null == disableNpawShorts ? _self.disableNpawShorts : disableNpawShorts // ignore: cast_nullable_to_non_nullable
as bool,kidsNotificationPrompt: null == kidsNotificationPrompt ? _self.kidsNotificationPrompt : kidsNotificationPrompt // ignore: cast_nullable_to_non_nullable
as bool,kidsNotificationPromptPosition: freezed == kidsNotificationPromptPosition ? _self.kidsNotificationPromptPosition : kidsNotificationPromptPosition // ignore: cast_nullable_to_non_nullable
as int?,kidsNotificationPromptAfterDismissal: null == kidsNotificationPromptAfterDismissal ? _self.kidsNotificationPromptAfterDismissal : kidsNotificationPromptAfterDismissal // ignore: cast_nullable_to_non_nullable
as bool,kidsNotificationPromptAfterDismissalCount: freezed == kidsNotificationPromptAfterDismissalCount ? _self.kidsNotificationPromptAfterDismissalCount : kidsNotificationPromptAfterDismissalCount // ignore: cast_nullable_to_non_nullable
as int?,kidsDonationLink: null == kidsDonationLink ? _self.kidsDonationLink : kidsDonationLink // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [FeatureFlags].
extension FeatureFlagsPatterns on FeatureFlags {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FeatureFlags value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FeatureFlags() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FeatureFlags value)  $default,){
final _that = this;
switch (_that) {
case _FeatureFlags():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FeatureFlags value)?  $default,){
final _that = this;
switch (_that) {
case _FeatureFlags() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> variants,  bool publicSignup,  bool socialSignup,  bool shorts,  bool shortsHideBeta,  bool shortsGuide,  bool disableNpawShorts,  bool kidsNotificationPrompt,  int? kidsNotificationPromptPosition,  bool kidsNotificationPromptAfterDismissal,  int? kidsNotificationPromptAfterDismissalCount,  bool kidsDonationLink)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FeatureFlags() when $default != null:
return $default(_that.variants,_that.publicSignup,_that.socialSignup,_that.shorts,_that.shortsHideBeta,_that.shortsGuide,_that.disableNpawShorts,_that.kidsNotificationPrompt,_that.kidsNotificationPromptPosition,_that.kidsNotificationPromptAfterDismissal,_that.kidsNotificationPromptAfterDismissalCount,_that.kidsDonationLink);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> variants,  bool publicSignup,  bool socialSignup,  bool shorts,  bool shortsHideBeta,  bool shortsGuide,  bool disableNpawShorts,  bool kidsNotificationPrompt,  int? kidsNotificationPromptPosition,  bool kidsNotificationPromptAfterDismissal,  int? kidsNotificationPromptAfterDismissalCount,  bool kidsDonationLink)  $default,) {final _that = this;
switch (_that) {
case _FeatureFlags():
return $default(_that.variants,_that.publicSignup,_that.socialSignup,_that.shorts,_that.shortsHideBeta,_that.shortsGuide,_that.disableNpawShorts,_that.kidsNotificationPrompt,_that.kidsNotificationPromptPosition,_that.kidsNotificationPromptAfterDismissal,_that.kidsNotificationPromptAfterDismissalCount,_that.kidsDonationLink);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> variants,  bool publicSignup,  bool socialSignup,  bool shorts,  bool shortsHideBeta,  bool shortsGuide,  bool disableNpawShorts,  bool kidsNotificationPrompt,  int? kidsNotificationPromptPosition,  bool kidsNotificationPromptAfterDismissal,  int? kidsNotificationPromptAfterDismissalCount,  bool kidsDonationLink)?  $default,) {final _that = this;
switch (_that) {
case _FeatureFlags() when $default != null:
return $default(_that.variants,_that.publicSignup,_that.socialSignup,_that.shorts,_that.shortsHideBeta,_that.shortsGuide,_that.disableNpawShorts,_that.kidsNotificationPrompt,_that.kidsNotificationPromptPosition,_that.kidsNotificationPromptAfterDismissal,_that.kidsNotificationPromptAfterDismissalCount,_that.kidsDonationLink);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FeatureFlags extends FeatureFlags {
  const _FeatureFlags({ List<String> variants = const [], this.publicSignup = false, this.socialSignup = false, this.shorts = false, this.shortsHideBeta = false, this.shortsGuide = false, this.disableNpawShorts = false, this.kidsNotificationPrompt = false, this.kidsNotificationPromptPosition, this.kidsNotificationPromptAfterDismissal = false, this.kidsNotificationPromptAfterDismissalCount, this.kidsDonationLink = false}): _variants = variants,super._();
  factory _FeatureFlags.fromJson(Map<String, dynamic> json) => _$FeatureFlagsFromJson(json);

 final  List<String> _variants;
@override@JsonKey() List<String> get variants {
  if (_variants is EqualUnmodifiableListView) return _variants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_variants);
}

@override@JsonKey() final  bool publicSignup;
@override@JsonKey() final  bool socialSignup;
@override@JsonKey() final  bool shorts;
@override@JsonKey() final  bool shortsHideBeta;
@override@JsonKey() final  bool shortsGuide;
@override@JsonKey() final  bool disableNpawShorts;
@override@JsonKey() final  bool kidsNotificationPrompt;
@override final  int? kidsNotificationPromptPosition;
@override@JsonKey() final  bool kidsNotificationPromptAfterDismissal;
@override final  int? kidsNotificationPromptAfterDismissalCount;
@override@JsonKey() final  bool kidsDonationLink;

/// Create a copy of FeatureFlags
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FeatureFlagsCopyWith<_FeatureFlags> get copyWith => __$FeatureFlagsCopyWithImpl<_FeatureFlags>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FeatureFlagsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _FeatureFlags&&const DeepCollectionEquality().equals(other.variants, _variants)&&(identical(other.publicSignup, publicSignup) || other.publicSignup == publicSignup)&&(identical(other.socialSignup, socialSignup) || other.socialSignup == socialSignup)&&(identical(other.shorts, shorts) || other.shorts == shorts)&&(identical(other.shortsHideBeta, shortsHideBeta) || other.shortsHideBeta == shortsHideBeta)&&(identical(other.shortsGuide, shortsGuide) || other.shortsGuide == shortsGuide)&&(identical(other.disableNpawShorts, disableNpawShorts) || other.disableNpawShorts == disableNpawShorts)&&(identical(other.kidsNotificationPrompt, kidsNotificationPrompt) || other.kidsNotificationPrompt == kidsNotificationPrompt)&&(identical(other.kidsNotificationPromptPosition, kidsNotificationPromptPosition) || other.kidsNotificationPromptPosition == kidsNotificationPromptPosition)&&(identical(other.kidsNotificationPromptAfterDismissal, kidsNotificationPromptAfterDismissal) || other.kidsNotificationPromptAfterDismissal == kidsNotificationPromptAfterDismissal)&&(identical(other.kidsNotificationPromptAfterDismissalCount, kidsNotificationPromptAfterDismissalCount) || other.kidsNotificationPromptAfterDismissalCount == kidsNotificationPromptAfterDismissalCount)&&(identical(other.kidsDonationLink, kidsDonationLink) || other.kidsDonationLink == kidsDonationLink));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_variants),publicSignup,socialSignup,shorts,shortsHideBeta,shortsGuide,disableNpawShorts,kidsNotificationPrompt,kidsNotificationPromptPosition,kidsNotificationPromptAfterDismissal,kidsNotificationPromptAfterDismissalCount,kidsDonationLink);
}

@override
String toString() {
    return 'FeatureFlags(variants: $variants, publicSignup: $publicSignup, socialSignup: $socialSignup, shorts: $shorts, shortsHideBeta: $shortsHideBeta, shortsGuide: $shortsGuide, disableNpawShorts: $disableNpawShorts, kidsNotificationPrompt: $kidsNotificationPrompt, kidsNotificationPromptPosition: $kidsNotificationPromptPosition, kidsNotificationPromptAfterDismissal: $kidsNotificationPromptAfterDismissal, kidsNotificationPromptAfterDismissalCount: $kidsNotificationPromptAfterDismissalCount, kidsDonationLink: $kidsDonationLink)';
}


}

/// @nodoc
abstract mixin class _$FeatureFlagsCopyWith<$Res> implements $FeatureFlagsCopyWith<$Res> {
  factory _$FeatureFlagsCopyWith(_FeatureFlags value, $Res Function(_FeatureFlags) _then) = __$FeatureFlagsCopyWithImpl;
@override @useResult
$Res call({
 List<String> variants, bool publicSignup, bool socialSignup, bool shorts, bool shortsHideBeta, bool shortsGuide, bool disableNpawShorts, bool kidsNotificationPrompt, int? kidsNotificationPromptPosition, bool kidsNotificationPromptAfterDismissal, int? kidsNotificationPromptAfterDismissalCount, bool kidsDonationLink
});




}
/// @nodoc
class __$FeatureFlagsCopyWithImpl<$Res>
    implements _$FeatureFlagsCopyWith<$Res> {
  __$FeatureFlagsCopyWithImpl(this._self, this._then);

  final _FeatureFlags _self;
  final $Res Function(_FeatureFlags) _then;

/// Create a copy of FeatureFlags
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? variants = null,Object? publicSignup = null,Object? socialSignup = null,Object? shorts = null,Object? shortsHideBeta = null,Object? shortsGuide = null,Object? disableNpawShorts = null,Object? kidsNotificationPrompt = null,Object? kidsNotificationPromptPosition = freezed,Object? kidsNotificationPromptAfterDismissal = null,Object? kidsNotificationPromptAfterDismissalCount = freezed,Object? kidsDonationLink = null,}) {
  return _then(_FeatureFlags(
variants: null == variants ? _self._variants : variants // ignore: cast_nullable_to_non_nullable
as List<String>,publicSignup: null == publicSignup ? _self.publicSignup : publicSignup // ignore: cast_nullable_to_non_nullable
as bool,socialSignup: null == socialSignup ? _self.socialSignup : socialSignup // ignore: cast_nullable_to_non_nullable
as bool,shorts: null == shorts ? _self.shorts : shorts // ignore: cast_nullable_to_non_nullable
as bool,shortsHideBeta: null == shortsHideBeta ? _self.shortsHideBeta : shortsHideBeta // ignore: cast_nullable_to_non_nullable
as bool,shortsGuide: null == shortsGuide ? _self.shortsGuide : shortsGuide // ignore: cast_nullable_to_non_nullable
as bool,disableNpawShorts: null == disableNpawShorts ? _self.disableNpawShorts : disableNpawShorts // ignore: cast_nullable_to_non_nullable
as bool,kidsNotificationPrompt: null == kidsNotificationPrompt ? _self.kidsNotificationPrompt : kidsNotificationPrompt // ignore: cast_nullable_to_non_nullable
as bool,kidsNotificationPromptPosition: freezed == kidsNotificationPromptPosition ? _self.kidsNotificationPromptPosition : kidsNotificationPromptPosition // ignore: cast_nullable_to_non_nullable
as int?,kidsNotificationPromptAfterDismissal: null == kidsNotificationPromptAfterDismissal ? _self.kidsNotificationPromptAfterDismissal : kidsNotificationPromptAfterDismissal // ignore: cast_nullable_to_non_nullable
as bool,kidsNotificationPromptAfterDismissalCount: freezed == kidsNotificationPromptAfterDismissalCount ? _self.kidsNotificationPromptAfterDismissalCount : kidsNotificationPromptAfterDismissalCount // ignore: cast_nullable_to_non_nullable
as int?,kidsDonationLink: null == kidsDonationLink ? _self.kidsDonationLink : kidsDonationLink // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
