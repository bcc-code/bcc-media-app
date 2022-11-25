import 'package:freezed_annotation/freezed_annotation.dart';

part 'watch_progress.freezed.dart';

@freezed
class WatchProgressUpdatedEvent with _$WatchProgressUpdatedEvent {
  const factory WatchProgressUpdatedEvent({
    required String episodeId,
    required int? progress,
  }) = _WatchProgressUpdatedEvent;
}
