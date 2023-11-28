import 'package:freezed_annotation/freezed_annotation.dart';

part 'shorts.freezed.dart';
part 'shorts.g.dart';

@freezed
class ShortStartedEvent with _$ShortStartedEvent {
  const factory ShortStartedEvent({
    required String shortId,
    required String shortTitle,
    required int replayCount,
    required bool resumed,
    required double positionFraction,
    required int positionSeconds,
  }) = _ShortStartedEvent;

  factory ShortStartedEvent.fromJson(Map<String, dynamic> json) => _$ShortStartedEventFromJson(json);
}

@freezed
class ShortStoppedEvent with _$ShortStoppedEvent {
  const factory ShortStoppedEvent({
    required String shortId,
    required String? shortTitle,
    required double positionFraction,
    required int positionSeconds,
    required int replayCount,
  }) = _ShortStoppedEvent;

  factory ShortStoppedEvent.fromJson(Map<String, dynamic> json) => _$ShortStoppedEventFromJson(json);
}
