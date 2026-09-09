// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'survey.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CompletedSurveys {

 List<CompletedSurvey> get completedSurveys;
/// Create a copy of CompletedSurveys
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompletedSurveysCopyWith<CompletedSurveys> get copyWith => _$CompletedSurveysCopyWithImpl<CompletedSurveys>(this as CompletedSurveys, _$identity);

  /// Serializes this CompletedSurveys to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CompletedSurveys;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompletedSurveys&&const DeepCollectionEquality().equals(other.completedSurveys, _this.completedSurveys));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CompletedSurveys;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.completedSurveys));
}

@override
String toString() {
  final _this = this as CompletedSurveys;
  return 'CompletedSurveys(completedSurveys: ${_this.completedSurveys})';
}


}

/// @nodoc
abstract mixin class $CompletedSurveysCopyWith<$Res>  {
  factory $CompletedSurveysCopyWith(CompletedSurveys value, $Res Function(CompletedSurveys) _then) = _$CompletedSurveysCopyWithImpl;
@useResult
$Res call({
 List<CompletedSurvey> completedSurveys
});




}
/// @nodoc
class _$CompletedSurveysCopyWithImpl<$Res>
    implements $CompletedSurveysCopyWith<$Res> {
  _$CompletedSurveysCopyWithImpl(this._self, this._then);

  final CompletedSurveys _self;
  final $Res Function(CompletedSurveys) _then;

/// Create a copy of CompletedSurveys
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? completedSurveys = null,}) {
  return _then(CompletedSurveys(
null == completedSurveys ? _self.completedSurveys : completedSurveys // ignore: cast_nullable_to_non_nullable
as List<CompletedSurvey>,
  ));
}

}


/// Adds pattern-matching-related methods to [CompletedSurveys].
extension CompletedSurveysPatterns on CompletedSurveys {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CompletedSurveys value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CompletedSurveys() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CompletedSurveys value)  $default,){
final _that = this;
switch (_that) {
case _CompletedSurveys():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CompletedSurveys value)?  $default,){
final _that = this;
switch (_that) {
case _CompletedSurveys() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<CompletedSurvey> completedSurveys)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CompletedSurveys() when $default != null:
return $default(_that.completedSurveys);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<CompletedSurvey> completedSurveys)  $default,) {final _that = this;
switch (_that) {
case _CompletedSurveys():
return $default(_that.completedSurveys);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<CompletedSurvey> completedSurveys)?  $default,) {final _that = this;
switch (_that) {
case _CompletedSurveys() when $default != null:
return $default(_that.completedSurveys);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CompletedSurveys implements CompletedSurveys {
  const _CompletedSurveys( List<CompletedSurvey> completedSurveys): _completedSurveys = completedSurveys;
  factory _CompletedSurveys.fromJson(Map<String, dynamic> json) => _$CompletedSurveysFromJson(json);

 final  List<CompletedSurvey> _completedSurveys;
@override List<CompletedSurvey> get completedSurveys {
  if (_completedSurveys is EqualUnmodifiableListView) return _completedSurveys;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_completedSurveys);
}


/// Create a copy of CompletedSurveys
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompletedSurveysCopyWith<_CompletedSurveys> get copyWith => __$CompletedSurveysCopyWithImpl<_CompletedSurveys>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CompletedSurveysToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CompletedSurveys&&const DeepCollectionEquality().equals(other.completedSurveys, _completedSurveys));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_completedSurveys));
}

@override
String toString() {
    return 'CompletedSurveys(completedSurveys: $completedSurveys)';
}


}

/// @nodoc
abstract mixin class _$CompletedSurveysCopyWith<$Res> implements $CompletedSurveysCopyWith<$Res> {
  factory _$CompletedSurveysCopyWith(_CompletedSurveys value, $Res Function(_CompletedSurveys) _then) = __$CompletedSurveysCopyWithImpl;
@override @useResult
$Res call({
 List<CompletedSurvey> completedSurveys
});




}
/// @nodoc
class __$CompletedSurveysCopyWithImpl<$Res>
    implements _$CompletedSurveysCopyWith<$Res> {
  __$CompletedSurveysCopyWithImpl(this._self, this._then);

  final _CompletedSurveys _self;
  final $Res Function(_CompletedSurveys) _then;

/// Create a copy of CompletedSurveys
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? completedSurveys = null,}) {
  return _then(_CompletedSurveys(
null == completedSurveys ? _self._completedSurveys : completedSurveys // ignore: cast_nullable_to_non_nullable
as List<CompletedSurvey>,
  ));
}


}


/// @nodoc
mixin _$CompletedSurvey {

 String get id; DateTime get expiry;
/// Create a copy of CompletedSurvey
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompletedSurveyCopyWith<CompletedSurvey> get copyWith => _$CompletedSurveyCopyWithImpl<CompletedSurvey>(this as CompletedSurvey, _$identity);

  /// Serializes this CompletedSurvey to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CompletedSurvey;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompletedSurvey&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.expiry, _this.expiry) || other.expiry == _this.expiry));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CompletedSurvey;
  return Object.hash(runtimeType,_this.id,_this.expiry);
}

@override
String toString() {
  final _this = this as CompletedSurvey;
  return 'CompletedSurvey(id: ${_this.id}, expiry: ${_this.expiry})';
}


}

/// @nodoc
abstract mixin class $CompletedSurveyCopyWith<$Res>  {
  factory $CompletedSurveyCopyWith(CompletedSurvey value, $Res Function(CompletedSurvey) _then) = _$CompletedSurveyCopyWithImpl;
@useResult
$Res call({
 String id, DateTime expiry
});




}
/// @nodoc
class _$CompletedSurveyCopyWithImpl<$Res>
    implements $CompletedSurveyCopyWith<$Res> {
  _$CompletedSurveyCopyWithImpl(this._self, this._then);

  final CompletedSurvey _self;
  final $Res Function(CompletedSurvey) _then;

/// Create a copy of CompletedSurvey
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? expiry = null,}) {
  return _then(CompletedSurvey(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,expiry: null == expiry ? _self.expiry : expiry // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [CompletedSurvey].
extension CompletedSurveyPatterns on CompletedSurvey {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CompletedSurvey value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CompletedSurvey() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CompletedSurvey value)  $default,){
final _that = this;
switch (_that) {
case _CompletedSurvey():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CompletedSurvey value)?  $default,){
final _that = this;
switch (_that) {
case _CompletedSurvey() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  DateTime expiry)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CompletedSurvey() when $default != null:
return $default(_that.id,_that.expiry);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  DateTime expiry)  $default,) {final _that = this;
switch (_that) {
case _CompletedSurvey():
return $default(_that.id,_that.expiry);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  DateTime expiry)?  $default,) {final _that = this;
switch (_that) {
case _CompletedSurvey() when $default != null:
return $default(_that.id,_that.expiry);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CompletedSurvey implements CompletedSurvey {
  const _CompletedSurvey({required this.id, required this.expiry});
  factory _CompletedSurvey.fromJson(Map<String, dynamic> json) => _$CompletedSurveyFromJson(json);

@override final  String id;
@override final  DateTime expiry;

/// Create a copy of CompletedSurvey
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompletedSurveyCopyWith<_CompletedSurvey> get copyWith => __$CompletedSurveyCopyWithImpl<_CompletedSurvey>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CompletedSurveyToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CompletedSurvey&&(identical(other.id, id) || other.id == id)&&(identical(other.expiry, expiry) || other.expiry == expiry));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,expiry);
}

@override
String toString() {
    return 'CompletedSurvey(id: $id, expiry: $expiry)';
}


}

/// @nodoc
abstract mixin class _$CompletedSurveyCopyWith<$Res> implements $CompletedSurveyCopyWith<$Res> {
  factory _$CompletedSurveyCopyWith(_CompletedSurvey value, $Res Function(_CompletedSurvey) _then) = __$CompletedSurveyCopyWithImpl;
@override @useResult
$Res call({
 String id, DateTime expiry
});




}
/// @nodoc
class __$CompletedSurveyCopyWithImpl<$Res>
    implements _$CompletedSurveyCopyWith<$Res> {
  __$CompletedSurveyCopyWithImpl(this._self, this._then);

  final _CompletedSurvey _self;
  final $Res Function(_CompletedSurvey) _then;

/// Create a copy of CompletedSurvey
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? expiry = null,}) {
  return _then(_CompletedSurvey(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,expiry: null == expiry ? _self.expiry : expiry // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
