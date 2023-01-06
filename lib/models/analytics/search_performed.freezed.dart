// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'search_performed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SearchPerformedEvent _$SearchPerformedEventFromJson(Map<String, dynamic> json) {
  return _SearchPerformedEvent.fromJson(json);
}

/// @nodoc
mixin _$SearchPerformedEvent {
  String get searchText => throw _privateConstructorUsedError;
  int get searchLatency => throw _privateConstructorUsedError;
  int get searchResultCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchPerformedEventCopyWith<SearchPerformedEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchPerformedEventCopyWith<$Res> {
  factory $SearchPerformedEventCopyWith(SearchPerformedEvent value,
          $Res Function(SearchPerformedEvent) then) =
      _$SearchPerformedEventCopyWithImpl<$Res>;
  $Res call({String searchText, int searchLatency, int searchResultCount});
}

/// @nodoc
class _$SearchPerformedEventCopyWithImpl<$Res>
    implements $SearchPerformedEventCopyWith<$Res> {
  _$SearchPerformedEventCopyWithImpl(this._value, this._then);

  final SearchPerformedEvent _value;
  // ignore: unused_field
  final $Res Function(SearchPerformedEvent) _then;

  @override
  $Res call({
    Object? searchText = freezed,
    Object? searchLatency = freezed,
    Object? searchResultCount = freezed,
  }) {
    return _then(_value.copyWith(
      searchText: searchText == freezed
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String,
      searchLatency: searchLatency == freezed
          ? _value.searchLatency
          : searchLatency // ignore: cast_nullable_to_non_nullable
              as int,
      searchResultCount: searchResultCount == freezed
          ? _value.searchResultCount
          : searchResultCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_SearchPerformedEventCopyWith<$Res>
    implements $SearchPerformedEventCopyWith<$Res> {
  factory _$$_SearchPerformedEventCopyWith(_$_SearchPerformedEvent value,
          $Res Function(_$_SearchPerformedEvent) then) =
      __$$_SearchPerformedEventCopyWithImpl<$Res>;
  @override
  $Res call({String searchText, int searchLatency, int searchResultCount});
}

/// @nodoc
class __$$_SearchPerformedEventCopyWithImpl<$Res>
    extends _$SearchPerformedEventCopyWithImpl<$Res>
    implements _$$_SearchPerformedEventCopyWith<$Res> {
  __$$_SearchPerformedEventCopyWithImpl(_$_SearchPerformedEvent _value,
      $Res Function(_$_SearchPerformedEvent) _then)
      : super(_value, (v) => _then(v as _$_SearchPerformedEvent));

  @override
  _$_SearchPerformedEvent get _value => super._value as _$_SearchPerformedEvent;

  @override
  $Res call({
    Object? searchText = freezed,
    Object? searchLatency = freezed,
    Object? searchResultCount = freezed,
  }) {
    return _then(_$_SearchPerformedEvent(
      searchText: searchText == freezed
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String,
      searchLatency: searchLatency == freezed
          ? _value.searchLatency
          : searchLatency // ignore: cast_nullable_to_non_nullable
              as int,
      searchResultCount: searchResultCount == freezed
          ? _value.searchResultCount
          : searchResultCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SearchPerformedEvent implements _SearchPerformedEvent {
  const _$_SearchPerformedEvent(
      {required this.searchText,
      required this.searchLatency,
      required this.searchResultCount});

  factory _$_SearchPerformedEvent.fromJson(Map<String, dynamic> json) =>
      _$$_SearchPerformedEventFromJson(json);

  @override
  final String searchText;
  @override
  final int searchLatency;
  @override
  final int searchResultCount;

  @override
  String toString() {
    return 'SearchPerformedEvent(searchText: $searchText, searchLatency: $searchLatency, searchResultCount: $searchResultCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchPerformedEvent &&
            const DeepCollectionEquality()
                .equals(other.searchText, searchText) &&
            const DeepCollectionEquality()
                .equals(other.searchLatency, searchLatency) &&
            const DeepCollectionEquality()
                .equals(other.searchResultCount, searchResultCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(searchText),
      const DeepCollectionEquality().hash(searchLatency),
      const DeepCollectionEquality().hash(searchResultCount));

  @JsonKey(ignore: true)
  @override
  _$$_SearchPerformedEventCopyWith<_$_SearchPerformedEvent> get copyWith =>
      __$$_SearchPerformedEventCopyWithImpl<_$_SearchPerformedEvent>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SearchPerformedEventToJson(
      this,
    );
  }
}

abstract class _SearchPerformedEvent implements SearchPerformedEvent {
  const factory _SearchPerformedEvent(
      {required final String searchText,
      required final int searchLatency,
      required final int searchResultCount}) = _$_SearchPerformedEvent;

  factory _SearchPerformedEvent.fromJson(Map<String, dynamic> json) =
      _$_SearchPerformedEvent.fromJson;

  @override
  String get searchText;
  @override
  int get searchLatency;
  @override
  int get searchResultCount;
  @override
  @JsonKey(ignore: true)
  _$$_SearchPerformedEventCopyWith<_$_SearchPerformedEvent> get copyWith =>
      throw _privateConstructorUsedError;
}
