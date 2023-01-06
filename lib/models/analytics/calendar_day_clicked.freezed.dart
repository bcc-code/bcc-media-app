// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'calendar_day_clicked.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CalendarDayClickedEvent _$CalendarDayClickedEventFromJson(
    Map<String, dynamic> json) {
  return _CalendarDayClickedEvent.fromJson(json);
}

/// @nodoc
mixin _$CalendarDayClickedEvent {
  String get pageCode => throw _privateConstructorUsedError;
  String get calendarView => throw _privateConstructorUsedError;
  String get calendarDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CalendarDayClickedEventCopyWith<CalendarDayClickedEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarDayClickedEventCopyWith<$Res> {
  factory $CalendarDayClickedEventCopyWith(CalendarDayClickedEvent value,
          $Res Function(CalendarDayClickedEvent) then) =
      _$CalendarDayClickedEventCopyWithImpl<$Res>;
  $Res call({String pageCode, String calendarView, String calendarDate});
}

/// @nodoc
class _$CalendarDayClickedEventCopyWithImpl<$Res>
    implements $CalendarDayClickedEventCopyWith<$Res> {
  _$CalendarDayClickedEventCopyWithImpl(this._value, this._then);

  final CalendarDayClickedEvent _value;
  // ignore: unused_field
  final $Res Function(CalendarDayClickedEvent) _then;

  @override
  $Res call({
    Object? pageCode = freezed,
    Object? calendarView = freezed,
    Object? calendarDate = freezed,
  }) {
    return _then(_value.copyWith(
      pageCode: pageCode == freezed
          ? _value.pageCode
          : pageCode // ignore: cast_nullable_to_non_nullable
              as String,
      calendarView: calendarView == freezed
          ? _value.calendarView
          : calendarView // ignore: cast_nullable_to_non_nullable
              as String,
      calendarDate: calendarDate == freezed
          ? _value.calendarDate
          : calendarDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_CalendarDayClickedEventCopyWith<$Res>
    implements $CalendarDayClickedEventCopyWith<$Res> {
  factory _$$_CalendarDayClickedEventCopyWith(_$_CalendarDayClickedEvent value,
          $Res Function(_$_CalendarDayClickedEvent) then) =
      __$$_CalendarDayClickedEventCopyWithImpl<$Res>;
  @override
  $Res call({String pageCode, String calendarView, String calendarDate});
}

/// @nodoc
class __$$_CalendarDayClickedEventCopyWithImpl<$Res>
    extends _$CalendarDayClickedEventCopyWithImpl<$Res>
    implements _$$_CalendarDayClickedEventCopyWith<$Res> {
  __$$_CalendarDayClickedEventCopyWithImpl(_$_CalendarDayClickedEvent _value,
      $Res Function(_$_CalendarDayClickedEvent) _then)
      : super(_value, (v) => _then(v as _$_CalendarDayClickedEvent));

  @override
  _$_CalendarDayClickedEvent get _value =>
      super._value as _$_CalendarDayClickedEvent;

  @override
  $Res call({
    Object? pageCode = freezed,
    Object? calendarView = freezed,
    Object? calendarDate = freezed,
  }) {
    return _then(_$_CalendarDayClickedEvent(
      pageCode: pageCode == freezed
          ? _value.pageCode
          : pageCode // ignore: cast_nullable_to_non_nullable
              as String,
      calendarView: calendarView == freezed
          ? _value.calendarView
          : calendarView // ignore: cast_nullable_to_non_nullable
              as String,
      calendarDate: calendarDate == freezed
          ? _value.calendarDate
          : calendarDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CalendarDayClickedEvent implements _CalendarDayClickedEvent {
  const _$_CalendarDayClickedEvent(
      {required this.pageCode,
      required this.calendarView,
      required this.calendarDate});

  factory _$_CalendarDayClickedEvent.fromJson(Map<String, dynamic> json) =>
      _$$_CalendarDayClickedEventFromJson(json);

  @override
  final String pageCode;
  @override
  final String calendarView;
  @override
  final String calendarDate;

  @override
  String toString() {
    return 'CalendarDayClickedEvent(pageCode: $pageCode, calendarView: $calendarView, calendarDate: $calendarDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CalendarDayClickedEvent &&
            const DeepCollectionEquality().equals(other.pageCode, pageCode) &&
            const DeepCollectionEquality()
                .equals(other.calendarView, calendarView) &&
            const DeepCollectionEquality()
                .equals(other.calendarDate, calendarDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(pageCode),
      const DeepCollectionEquality().hash(calendarView),
      const DeepCollectionEquality().hash(calendarDate));

  @JsonKey(ignore: true)
  @override
  _$$_CalendarDayClickedEventCopyWith<_$_CalendarDayClickedEvent>
      get copyWith =>
          __$$_CalendarDayClickedEventCopyWithImpl<_$_CalendarDayClickedEvent>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CalendarDayClickedEventToJson(
      this,
    );
  }
}

abstract class _CalendarDayClickedEvent implements CalendarDayClickedEvent {
  const factory _CalendarDayClickedEvent(
      {required final String pageCode,
      required final String calendarView,
      required final String calendarDate}) = _$_CalendarDayClickedEvent;

  factory _CalendarDayClickedEvent.fromJson(Map<String, dynamic> json) =
      _$_CalendarDayClickedEvent.fromJson;

  @override
  String get pageCode;
  @override
  String get calendarView;
  @override
  String get calendarDate;
  @override
  @JsonKey(ignore: true)
  _$$_CalendarDayClickedEventCopyWith<_$_CalendarDayClickedEvent>
      get copyWith => throw _privateConstructorUsedError;
}
