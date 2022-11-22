// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'search.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SearchResultClickedEvent _$SearchResultClickedEventFromJson(
    Map<String, dynamic> json) {
  return _SectionClickedEvent.fromJson(json);
}

/// @nodoc
mixin _$SearchResultClickedEvent {
  String get searchText => throw _privateConstructorUsedError;
  int get elementPosition => throw _privateConstructorUsedError;
  String get elementType => throw _privateConstructorUsedError;
  String get elementId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchResultClickedEventCopyWith<SearchResultClickedEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchResultClickedEventCopyWith<$Res> {
  factory $SearchResultClickedEventCopyWith(SearchResultClickedEvent value,
          $Res Function(SearchResultClickedEvent) then) =
      _$SearchResultClickedEventCopyWithImpl<$Res, SearchResultClickedEvent>;
  @useResult
  $Res call(
      {String searchText,
      int elementPosition,
      String elementType,
      String elementId});
}

/// @nodoc
class _$SearchResultClickedEventCopyWithImpl<$Res,
        $Val extends SearchResultClickedEvent>
    implements $SearchResultClickedEventCopyWith<$Res> {
  _$SearchResultClickedEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchText = null,
    Object? elementPosition = null,
    Object? elementType = null,
    Object? elementId = null,
  }) {
    return _then(_value.copyWith(
      searchText: null == searchText
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String,
      elementPosition: null == elementPosition
          ? _value.elementPosition
          : elementPosition // ignore: cast_nullable_to_non_nullable
              as int,
      elementType: null == elementType
          ? _value.elementType
          : elementType // ignore: cast_nullable_to_non_nullable
              as String,
      elementId: null == elementId
          ? _value.elementId
          : elementId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SectionClickedEventCopyWith<$Res>
    implements $SearchResultClickedEventCopyWith<$Res> {
  factory _$$_SectionClickedEventCopyWith(_$_SectionClickedEvent value,
          $Res Function(_$_SectionClickedEvent) then) =
      __$$_SectionClickedEventCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String searchText,
      int elementPosition,
      String elementType,
      String elementId});
}

/// @nodoc
class __$$_SectionClickedEventCopyWithImpl<$Res>
    extends _$SearchResultClickedEventCopyWithImpl<$Res, _$_SectionClickedEvent>
    implements _$$_SectionClickedEventCopyWith<$Res> {
  __$$_SectionClickedEventCopyWithImpl(_$_SectionClickedEvent _value,
      $Res Function(_$_SectionClickedEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchText = null,
    Object? elementPosition = null,
    Object? elementType = null,
    Object? elementId = null,
  }) {
    return _then(_$_SectionClickedEvent(
      searchText: null == searchText
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String,
      elementPosition: null == elementPosition
          ? _value.elementPosition
          : elementPosition // ignore: cast_nullable_to_non_nullable
              as int,
      elementType: null == elementType
          ? _value.elementType
          : elementType // ignore: cast_nullable_to_non_nullable
              as String,
      elementId: null == elementId
          ? _value.elementId
          : elementId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SectionClickedEvent implements _SectionClickedEvent {
  const _$_SectionClickedEvent(
      {required this.searchText,
      required this.elementPosition,
      required this.elementType,
      required this.elementId});

  factory _$_SectionClickedEvent.fromJson(Map<String, dynamic> json) =>
      _$$_SectionClickedEventFromJson(json);

  @override
  final String searchText;
  @override
  final int elementPosition;
  @override
  final String elementType;
  @override
  final String elementId;

  @override
  String toString() {
    return 'SearchResultClickedEvent(searchText: $searchText, elementPosition: $elementPosition, elementType: $elementType, elementId: $elementId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SectionClickedEvent &&
            (identical(other.searchText, searchText) ||
                other.searchText == searchText) &&
            (identical(other.elementPosition, elementPosition) ||
                other.elementPosition == elementPosition) &&
            (identical(other.elementType, elementType) ||
                other.elementType == elementType) &&
            (identical(other.elementId, elementId) ||
                other.elementId == elementId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, searchText, elementPosition, elementType, elementId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SectionClickedEventCopyWith<_$_SectionClickedEvent> get copyWith =>
      __$$_SectionClickedEventCopyWithImpl<_$_SectionClickedEvent>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SectionClickedEventToJson(
      this,
    );
  }
}

abstract class _SectionClickedEvent implements SearchResultClickedEvent {
  const factory _SectionClickedEvent(
      {required final String searchText,
      required final int elementPosition,
      required final String elementType,
      required final String elementId}) = _$_SectionClickedEvent;

  factory _SectionClickedEvent.fromJson(Map<String, dynamic> json) =
      _$_SectionClickedEvent.fromJson;

  @override
  String get searchText;
  @override
  int get elementPosition;
  @override
  String get elementType;
  @override
  String get elementId;
  @override
  @JsonKey(ignore: true)
  _$$_SectionClickedEventCopyWith<_$_SectionClickedEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SearchAnalytics {
  String? get searchText => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchAnalyticsCopyWith<SearchAnalytics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchAnalyticsCopyWith<$Res> {
  factory $SearchAnalyticsCopyWith(
          SearchAnalytics value, $Res Function(SearchAnalytics) then) =
      _$SearchAnalyticsCopyWithImpl<$Res, SearchAnalytics>;
  @useResult
  $Res call({String? searchText});
}

/// @nodoc
class _$SearchAnalyticsCopyWithImpl<$Res, $Val extends SearchAnalytics>
    implements $SearchAnalyticsCopyWith<$Res> {
  _$SearchAnalyticsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchText = freezed,
  }) {
    return _then(_value.copyWith(
      searchText: freezed == searchText
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SearchAnalyticsCopyWith<$Res>
    implements $SearchAnalyticsCopyWith<$Res> {
  factory _$$_SearchAnalyticsCopyWith(
          _$_SearchAnalytics value, $Res Function(_$_SearchAnalytics) then) =
      __$$_SearchAnalyticsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? searchText});
}

/// @nodoc
class __$$_SearchAnalyticsCopyWithImpl<$Res>
    extends _$SearchAnalyticsCopyWithImpl<$Res, _$_SearchAnalytics>
    implements _$$_SearchAnalyticsCopyWith<$Res> {
  __$$_SearchAnalyticsCopyWithImpl(
      _$_SearchAnalytics _value, $Res Function(_$_SearchAnalytics) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchText = freezed,
  }) {
    return _then(_$_SearchAnalytics(
      searchText: freezed == searchText
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_SearchAnalytics implements _SearchAnalytics {
  const _$_SearchAnalytics({required this.searchText});

  @override
  final String? searchText;

  @override
  String toString() {
    return 'SearchAnalytics(searchText: $searchText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchAnalytics &&
            (identical(other.searchText, searchText) ||
                other.searchText == searchText));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchAnalyticsCopyWith<_$_SearchAnalytics> get copyWith =>
      __$$_SearchAnalyticsCopyWithImpl<_$_SearchAnalytics>(this, _$identity);
}

abstract class _SearchAnalytics implements SearchAnalytics {
  const factory _SearchAnalytics({required final String? searchText}) =
      _$_SearchAnalytics;

  @override
  String? get searchText;
  @override
  @JsonKey(ignore: true)
  _$$_SearchAnalyticsCopyWith<_$_SearchAnalytics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SearchItemAnalytics {
  int get position => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchItemAnalyticsCopyWith<SearchItemAnalytics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchItemAnalyticsCopyWith<$Res> {
  factory $SearchItemAnalyticsCopyWith(
          SearchItemAnalytics value, $Res Function(SearchItemAnalytics) then) =
      _$SearchItemAnalyticsCopyWithImpl<$Res, SearchItemAnalytics>;
  @useResult
  $Res call({int position, String type, String id});
}

/// @nodoc
class _$SearchItemAnalyticsCopyWithImpl<$Res, $Val extends SearchItemAnalytics>
    implements $SearchItemAnalyticsCopyWith<$Res> {
  _$SearchItemAnalyticsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? position = null,
    Object? type = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SearchItemAnalyticsCopyWith<$Res>
    implements $SearchItemAnalyticsCopyWith<$Res> {
  factory _$$_SearchItemAnalyticsCopyWith(_$_SearchItemAnalytics value,
          $Res Function(_$_SearchItemAnalytics) then) =
      __$$_SearchItemAnalyticsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int position, String type, String id});
}

/// @nodoc
class __$$_SearchItemAnalyticsCopyWithImpl<$Res>
    extends _$SearchItemAnalyticsCopyWithImpl<$Res, _$_SearchItemAnalytics>
    implements _$$_SearchItemAnalyticsCopyWith<$Res> {
  __$$_SearchItemAnalyticsCopyWithImpl(_$_SearchItemAnalytics _value,
      $Res Function(_$_SearchItemAnalytics) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? position = null,
    Object? type = null,
    Object? id = null,
  }) {
    return _then(_$_SearchItemAnalytics(
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SearchItemAnalytics implements _SearchItemAnalytics {
  const _$_SearchItemAnalytics(
      {required this.position, required this.type, required this.id});

  @override
  final int position;
  @override
  final String type;
  @override
  final String id;

  @override
  String toString() {
    return 'SearchItemAnalytics(position: $position, type: $type, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchItemAnalytics &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, position, type, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchItemAnalyticsCopyWith<_$_SearchItemAnalytics> get copyWith =>
      __$$_SearchItemAnalyticsCopyWithImpl<_$_SearchItemAnalytics>(
          this, _$identity);
}

abstract class _SearchItemAnalytics implements SearchItemAnalytics {
  const factory _SearchItemAnalytics(
      {required final int position,
      required final String type,
      required final String id}) = _$_SearchItemAnalytics;

  @override
  int get position;
  @override
  String get type;
  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$_SearchItemAnalyticsCopyWith<_$_SearchItemAnalytics> get copyWith =>
      throw _privateConstructorUsedError;
}
