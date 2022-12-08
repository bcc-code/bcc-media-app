import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_performed.freezed.dart';
part 'search_performed.g.dart';

@freezed
class SearchPerformedEvent with _$SearchPerformedEvent {
  const factory SearchPerformedEvent({
    required String searchText,
    required int searchLatency,
    required int searchResultCount,
  }) = _SearchPerformedEvent;

  factory SearchPerformedEvent.fromJson(Map<String, dynamic> json) => _$SearchPerformedEventFromJson(json);
}
