import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_closed.freezed.dart';
part 'game_closed.g.dart';

@freezed
class GameClosedEvent with _$GameClosedEvent {
  const factory GameClosedEvent({
    required String gameId,
    required int timeSpent,
    int? position,
  }) = _GameClosedEvent;

  factory GameClosedEvent.fromJson(Map<String, dynamic> json) => _$GameClosedEventFromJson(json);
}
