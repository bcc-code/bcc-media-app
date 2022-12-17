import 'package:freezed_annotation/freezed_annotation.dart';

part 'calendar_day_clicked.freezed.dart';
part 'calendar_day_clicked.g.dart';

@freezed
class CalendarDayClickedEvent with _$CalendarDayClickedEvent {
  const factory CalendarDayClickedEvent({
    required String pageCode,
    required String calendarView,
    required String calendarDate,
  }) = _CalendarDayClickedEvent;

  factory CalendarDayClickedEvent.fromJson(Map<String, dynamic> json) => _$CalendarDayClickedEventFromJson(json);
}
