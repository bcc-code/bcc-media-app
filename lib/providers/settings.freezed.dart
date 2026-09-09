// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Settings {

 Locale get appLanguage; List<String> get audioLanguages; List<String> get subtitleLanguages; String? get downloadAudioLanguage; DownloadQuality? get downloadQuality; String? get analyticsId; String? get sessionId; String? get searchSessionId; String? get envOverride; bool? get isBetaTester; bool? get useNativePlayer; List<String> get extraUsergroups; bool? get notificationsEnabled; bool? get onlyPreferredLanguagesContentEnabled;
/// Create a copy of Settings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SettingsCopyWith<Settings> get copyWith => _$SettingsCopyWithImpl<Settings>(this as Settings, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Settings;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Settings&&(identical(other.appLanguage, _this.appLanguage) || other.appLanguage == _this.appLanguage)&&const DeepCollectionEquality().equals(other.audioLanguages, _this.audioLanguages)&&const DeepCollectionEquality().equals(other.subtitleLanguages, _this.subtitleLanguages)&&(identical(other.downloadAudioLanguage, _this.downloadAudioLanguage) || other.downloadAudioLanguage == _this.downloadAudioLanguage)&&(identical(other.downloadQuality, _this.downloadQuality) || other.downloadQuality == _this.downloadQuality)&&(identical(other.analyticsId, _this.analyticsId) || other.analyticsId == _this.analyticsId)&&(identical(other.sessionId, _this.sessionId) || other.sessionId == _this.sessionId)&&(identical(other.searchSessionId, _this.searchSessionId) || other.searchSessionId == _this.searchSessionId)&&(identical(other.envOverride, _this.envOverride) || other.envOverride == _this.envOverride)&&(identical(other.isBetaTester, _this.isBetaTester) || other.isBetaTester == _this.isBetaTester)&&(identical(other.useNativePlayer, _this.useNativePlayer) || other.useNativePlayer == _this.useNativePlayer)&&const DeepCollectionEquality().equals(other.extraUsergroups, _this.extraUsergroups)&&(identical(other.notificationsEnabled, _this.notificationsEnabled) || other.notificationsEnabled == _this.notificationsEnabled)&&(identical(other.onlyPreferredLanguagesContentEnabled, _this.onlyPreferredLanguagesContentEnabled) || other.onlyPreferredLanguagesContentEnabled == _this.onlyPreferredLanguagesContentEnabled));
}


@override
int get hashCode {
  final _this = this as Settings;
  return Object.hash(runtimeType,_this.appLanguage,const DeepCollectionEquality().hash(_this.audioLanguages),const DeepCollectionEquality().hash(_this.subtitleLanguages),_this.downloadAudioLanguage,_this.downloadQuality,_this.analyticsId,_this.sessionId,_this.searchSessionId,_this.envOverride,_this.isBetaTester,_this.useNativePlayer,const DeepCollectionEquality().hash(_this.extraUsergroups),_this.notificationsEnabled,_this.onlyPreferredLanguagesContentEnabled);
}

@override
String toString() {
  final _this = this as Settings;
  return 'Settings(appLanguage: ${_this.appLanguage}, audioLanguages: ${_this.audioLanguages}, subtitleLanguages: ${_this.subtitleLanguages}, downloadAudioLanguage: ${_this.downloadAudioLanguage}, downloadQuality: ${_this.downloadQuality}, analyticsId: ${_this.analyticsId}, sessionId: ${_this.sessionId}, searchSessionId: ${_this.searchSessionId}, envOverride: ${_this.envOverride}, isBetaTester: ${_this.isBetaTester}, useNativePlayer: ${_this.useNativePlayer}, extraUsergroups: ${_this.extraUsergroups}, notificationsEnabled: ${_this.notificationsEnabled}, onlyPreferredLanguagesContentEnabled: ${_this.onlyPreferredLanguagesContentEnabled})';
}


}

/// @nodoc
abstract mixin class $SettingsCopyWith<$Res>  {
  factory $SettingsCopyWith(Settings value, $Res Function(Settings) _then) = _$SettingsCopyWithImpl;
@useResult
$Res call({
 Locale appLanguage, List<String> audioLanguages, List<String> subtitleLanguages, String? downloadAudioLanguage, DownloadQuality? downloadQuality, String? analyticsId, String? sessionId, String? searchSessionId, String? envOverride, bool? isBetaTester, bool? useNativePlayer, List<String> extraUsergroups, bool? notificationsEnabled, bool? onlyPreferredLanguagesContentEnabled
});




}
/// @nodoc
class _$SettingsCopyWithImpl<$Res>
    implements $SettingsCopyWith<$Res> {
  _$SettingsCopyWithImpl(this._self, this._then);

  final Settings _self;
  final $Res Function(Settings) _then;

/// Create a copy of Settings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? appLanguage = null,Object? audioLanguages = null,Object? subtitleLanguages = null,Object? downloadAudioLanguage = freezed,Object? downloadQuality = freezed,Object? analyticsId = freezed,Object? sessionId = freezed,Object? searchSessionId = freezed,Object? envOverride = freezed,Object? isBetaTester = freezed,Object? useNativePlayer = freezed,Object? extraUsergroups = null,Object? notificationsEnabled = freezed,Object? onlyPreferredLanguagesContentEnabled = freezed,}) {
  return _then(Settings(
appLanguage: null == appLanguage ? _self.appLanguage : appLanguage // ignore: cast_nullable_to_non_nullable
as Locale,audioLanguages: null == audioLanguages ? _self.audioLanguages : audioLanguages // ignore: cast_nullable_to_non_nullable
as List<String>,subtitleLanguages: null == subtitleLanguages ? _self.subtitleLanguages : subtitleLanguages // ignore: cast_nullable_to_non_nullable
as List<String>,downloadAudioLanguage: freezed == downloadAudioLanguage ? _self.downloadAudioLanguage : downloadAudioLanguage // ignore: cast_nullable_to_non_nullable
as String?,downloadQuality: freezed == downloadQuality ? _self.downloadQuality : downloadQuality // ignore: cast_nullable_to_non_nullable
as DownloadQuality?,analyticsId: freezed == analyticsId ? _self.analyticsId : analyticsId // ignore: cast_nullable_to_non_nullable
as String?,sessionId: freezed == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String?,searchSessionId: freezed == searchSessionId ? _self.searchSessionId : searchSessionId // ignore: cast_nullable_to_non_nullable
as String?,envOverride: freezed == envOverride ? _self.envOverride : envOverride // ignore: cast_nullable_to_non_nullable
as String?,isBetaTester: freezed == isBetaTester ? _self.isBetaTester : isBetaTester // ignore: cast_nullable_to_non_nullable
as bool?,useNativePlayer: freezed == useNativePlayer ? _self.useNativePlayer : useNativePlayer // ignore: cast_nullable_to_non_nullable
as bool?,extraUsergroups: null == extraUsergroups ? _self.extraUsergroups : extraUsergroups // ignore: cast_nullable_to_non_nullable
as List<String>,notificationsEnabled: freezed == notificationsEnabled ? _self.notificationsEnabled : notificationsEnabled // ignore: cast_nullable_to_non_nullable
as bool?,onlyPreferredLanguagesContentEnabled: freezed == onlyPreferredLanguagesContentEnabled ? _self.onlyPreferredLanguagesContentEnabled : onlyPreferredLanguagesContentEnabled // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [Settings].
extension SettingsPatterns on Settings {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Settings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Settings() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Settings value)  $default,){
final _that = this;
switch (_that) {
case _Settings():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Settings value)?  $default,){
final _that = this;
switch (_that) {
case _Settings() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Locale appLanguage,  List<String> audioLanguages,  List<String> subtitleLanguages,  String? downloadAudioLanguage,  DownloadQuality? downloadQuality,  String? analyticsId,  String? sessionId,  String? searchSessionId,  String? envOverride,  bool? isBetaTester,  bool? useNativePlayer,  List<String> extraUsergroups,  bool? notificationsEnabled,  bool? onlyPreferredLanguagesContentEnabled)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Settings() when $default != null:
return $default(_that.appLanguage,_that.audioLanguages,_that.subtitleLanguages,_that.downloadAudioLanguage,_that.downloadQuality,_that.analyticsId,_that.sessionId,_that.searchSessionId,_that.envOverride,_that.isBetaTester,_that.useNativePlayer,_that.extraUsergroups,_that.notificationsEnabled,_that.onlyPreferredLanguagesContentEnabled);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Locale appLanguage,  List<String> audioLanguages,  List<String> subtitleLanguages,  String? downloadAudioLanguage,  DownloadQuality? downloadQuality,  String? analyticsId,  String? sessionId,  String? searchSessionId,  String? envOverride,  bool? isBetaTester,  bool? useNativePlayer,  List<String> extraUsergroups,  bool? notificationsEnabled,  bool? onlyPreferredLanguagesContentEnabled)  $default,) {final _that = this;
switch (_that) {
case _Settings():
return $default(_that.appLanguage,_that.audioLanguages,_that.subtitleLanguages,_that.downloadAudioLanguage,_that.downloadQuality,_that.analyticsId,_that.sessionId,_that.searchSessionId,_that.envOverride,_that.isBetaTester,_that.useNativePlayer,_that.extraUsergroups,_that.notificationsEnabled,_that.onlyPreferredLanguagesContentEnabled);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Locale appLanguage,  List<String> audioLanguages,  List<String> subtitleLanguages,  String? downloadAudioLanguage,  DownloadQuality? downloadQuality,  String? analyticsId,  String? sessionId,  String? searchSessionId,  String? envOverride,  bool? isBetaTester,  bool? useNativePlayer,  List<String> extraUsergroups,  bool? notificationsEnabled,  bool? onlyPreferredLanguagesContentEnabled)?  $default,) {final _that = this;
switch (_that) {
case _Settings() when $default != null:
return $default(_that.appLanguage,_that.audioLanguages,_that.subtitleLanguages,_that.downloadAudioLanguage,_that.downloadQuality,_that.analyticsId,_that.sessionId,_that.searchSessionId,_that.envOverride,_that.isBetaTester,_that.useNativePlayer,_that.extraUsergroups,_that.notificationsEnabled,_that.onlyPreferredLanguagesContentEnabled);case _:
  return null;

}
}

}

/// @nodoc


class _Settings implements Settings {
  const _Settings({required this.appLanguage,  List<String> audioLanguages = const [],  List<String> subtitleLanguages = const [], this.downloadAudioLanguage, this.downloadQuality, this.analyticsId, this.sessionId, this.searchSessionId, this.envOverride, this.isBetaTester, this.useNativePlayer,  List<String> extraUsergroups = const [], this.notificationsEnabled, this.onlyPreferredLanguagesContentEnabled}): _audioLanguages = audioLanguages,_subtitleLanguages = subtitleLanguages,_extraUsergroups = extraUsergroups;
  

@override final  Locale appLanguage;
 final  List<String> _audioLanguages;
@override@JsonKey() List<String> get audioLanguages {
  if (_audioLanguages is EqualUnmodifiableListView) return _audioLanguages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_audioLanguages);
}

 final  List<String> _subtitleLanguages;
@override@JsonKey() List<String> get subtitleLanguages {
  if (_subtitleLanguages is EqualUnmodifiableListView) return _subtitleLanguages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_subtitleLanguages);
}

@override final  String? downloadAudioLanguage;
@override final  DownloadQuality? downloadQuality;
@override final  String? analyticsId;
@override final  String? sessionId;
@override final  String? searchSessionId;
@override final  String? envOverride;
@override final  bool? isBetaTester;
@override final  bool? useNativePlayer;
 final  List<String> _extraUsergroups;
@override@JsonKey() List<String> get extraUsergroups {
  if (_extraUsergroups is EqualUnmodifiableListView) return _extraUsergroups;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_extraUsergroups);
}

@override final  bool? notificationsEnabled;
@override final  bool? onlyPreferredLanguagesContentEnabled;

/// Create a copy of Settings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SettingsCopyWith<_Settings> get copyWith => __$SettingsCopyWithImpl<_Settings>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Settings&&(identical(other.appLanguage, appLanguage) || other.appLanguage == appLanguage)&&const DeepCollectionEquality().equals(other.audioLanguages, _audioLanguages)&&const DeepCollectionEquality().equals(other.subtitleLanguages, _subtitleLanguages)&&(identical(other.downloadAudioLanguage, downloadAudioLanguage) || other.downloadAudioLanguage == downloadAudioLanguage)&&(identical(other.downloadQuality, downloadQuality) || other.downloadQuality == downloadQuality)&&(identical(other.analyticsId, analyticsId) || other.analyticsId == analyticsId)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.searchSessionId, searchSessionId) || other.searchSessionId == searchSessionId)&&(identical(other.envOverride, envOverride) || other.envOverride == envOverride)&&(identical(other.isBetaTester, isBetaTester) || other.isBetaTester == isBetaTester)&&(identical(other.useNativePlayer, useNativePlayer) || other.useNativePlayer == useNativePlayer)&&const DeepCollectionEquality().equals(other.extraUsergroups, _extraUsergroups)&&(identical(other.notificationsEnabled, notificationsEnabled) || other.notificationsEnabled == notificationsEnabled)&&(identical(other.onlyPreferredLanguagesContentEnabled, onlyPreferredLanguagesContentEnabled) || other.onlyPreferredLanguagesContentEnabled == onlyPreferredLanguagesContentEnabled));
}


@override
int get hashCode {
    return Object.hash(runtimeType,appLanguage,const DeepCollectionEquality().hash(_audioLanguages),const DeepCollectionEquality().hash(_subtitleLanguages),downloadAudioLanguage,downloadQuality,analyticsId,sessionId,searchSessionId,envOverride,isBetaTester,useNativePlayer,const DeepCollectionEquality().hash(_extraUsergroups),notificationsEnabled,onlyPreferredLanguagesContentEnabled);
}

@override
String toString() {
    return 'Settings(appLanguage: $appLanguage, audioLanguages: $audioLanguages, subtitleLanguages: $subtitleLanguages, downloadAudioLanguage: $downloadAudioLanguage, downloadQuality: $downloadQuality, analyticsId: $analyticsId, sessionId: $sessionId, searchSessionId: $searchSessionId, envOverride: $envOverride, isBetaTester: $isBetaTester, useNativePlayer: $useNativePlayer, extraUsergroups: $extraUsergroups, notificationsEnabled: $notificationsEnabled, onlyPreferredLanguagesContentEnabled: $onlyPreferredLanguagesContentEnabled)';
}


}

/// @nodoc
abstract mixin class _$SettingsCopyWith<$Res> implements $SettingsCopyWith<$Res> {
  factory _$SettingsCopyWith(_Settings value, $Res Function(_Settings) _then) = __$SettingsCopyWithImpl;
@override @useResult
$Res call({
 Locale appLanguage, List<String> audioLanguages, List<String> subtitleLanguages, String? downloadAudioLanguage, DownloadQuality? downloadQuality, String? analyticsId, String? sessionId, String? searchSessionId, String? envOverride, bool? isBetaTester, bool? useNativePlayer, List<String> extraUsergroups, bool? notificationsEnabled, bool? onlyPreferredLanguagesContentEnabled
});




}
/// @nodoc
class __$SettingsCopyWithImpl<$Res>
    implements _$SettingsCopyWith<$Res> {
  __$SettingsCopyWithImpl(this._self, this._then);

  final _Settings _self;
  final $Res Function(_Settings) _then;

/// Create a copy of Settings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? appLanguage = null,Object? audioLanguages = null,Object? subtitleLanguages = null,Object? downloadAudioLanguage = freezed,Object? downloadQuality = freezed,Object? analyticsId = freezed,Object? sessionId = freezed,Object? searchSessionId = freezed,Object? envOverride = freezed,Object? isBetaTester = freezed,Object? useNativePlayer = freezed,Object? extraUsergroups = null,Object? notificationsEnabled = freezed,Object? onlyPreferredLanguagesContentEnabled = freezed,}) {
  return _then(_Settings(
appLanguage: null == appLanguage ? _self.appLanguage : appLanguage // ignore: cast_nullable_to_non_nullable
as Locale,audioLanguages: null == audioLanguages ? _self._audioLanguages : audioLanguages // ignore: cast_nullable_to_non_nullable
as List<String>,subtitleLanguages: null == subtitleLanguages ? _self._subtitleLanguages : subtitleLanguages // ignore: cast_nullable_to_non_nullable
as List<String>,downloadAudioLanguage: freezed == downloadAudioLanguage ? _self.downloadAudioLanguage : downloadAudioLanguage // ignore: cast_nullable_to_non_nullable
as String?,downloadQuality: freezed == downloadQuality ? _self.downloadQuality : downloadQuality // ignore: cast_nullable_to_non_nullable
as DownloadQuality?,analyticsId: freezed == analyticsId ? _self.analyticsId : analyticsId // ignore: cast_nullable_to_non_nullable
as String?,sessionId: freezed == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String?,searchSessionId: freezed == searchSessionId ? _self.searchSessionId : searchSessionId // ignore: cast_nullable_to_non_nullable
as String?,envOverride: freezed == envOverride ? _self.envOverride : envOverride // ignore: cast_nullable_to_non_nullable
as String?,isBetaTester: freezed == isBetaTester ? _self.isBetaTester : isBetaTester // ignore: cast_nullable_to_non_nullable
as bool?,useNativePlayer: freezed == useNativePlayer ? _self.useNativePlayer : useNativePlayer // ignore: cast_nullable_to_non_nullable
as bool?,extraUsergroups: null == extraUsergroups ? _self._extraUsergroups : extraUsergroups // ignore: cast_nullable_to_non_nullable
as List<String>,notificationsEnabled: freezed == notificationsEnabled ? _self.notificationsEnabled : notificationsEnabled // ignore: cast_nullable_to_non_nullable
as bool?,onlyPreferredLanguagesContentEnabled: freezed == onlyPreferredLanguagesContentEnabled ? _self.onlyPreferredLanguagesContentEnabled : onlyPreferredLanguagesContentEnabled // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
