import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_result_clicked.freezed.dart';
part 'search_result_clicked.g.dart';

@freezed
class SearchResultClickedEvent with _$SearchResultClickedEvent {
  const factory SearchResultClickedEvent({
    required String searchText,
    required int elementPosition,
    required String elementType,
    required String elementId,
    required String group,
  }) = _SectionClickedEvent;

  factory SearchResultClickedEvent.fromJson(Map<String, dynamic> json) => _$SearchResultClickedEventFromJson(json);
}

@freezed
class SearchAnalytics with _$SearchAnalytics {
  const factory SearchAnalytics({
    required String searchText,
  }) = _SearchAnalytics;
}

@freezed
class SearchItemAnalytics with _$SearchItemAnalytics {
  const factory SearchItemAnalytics({
    required int position,
    required String type,
    required String id,
    required String group,
  }) = _SearchItemAnalytics;
}
