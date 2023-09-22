import 'package:freezed_annotation/freezed_annotation.dart';

part 'downloads.freezed.dart';
part 'downloads.g.dart';

@freezed
class VideoDownloadStartedEvent with _$VideoDownloadStartedEvent {
  const factory VideoDownloadStartedEvent({
    required String downloadId,
    required String episodeId,
    required String? quality,
    required String? audioLanguage,
  }) = _VideoDownloadStartedEvent;

  factory VideoDownloadStartedEvent.fromJson(Map<String, dynamic> json) => _$VideoDownloadStartedEventFromJson(json);
}

@freezed
class VideoDownloadRemovedEvent with _$VideoDownloadRemovedEvent {
  const factory VideoDownloadRemovedEvent({
    required String downloadId,
    required String? episodeId,
  }) = _VideoDownloadRemovedEvent;

  factory VideoDownloadRemovedEvent.fromJson(Map<String, dynamic> json) => _$VideoDownloadRemovedEventFromJson(json);
}

@freezed
class VideoDownloadPlayedEvent with _$VideoDownloadPlayedEvent {
  const factory VideoDownloadPlayedEvent({
    required String downloadId,
    required String? episodeId,
  }) = _VideoDownloadPlayedEvent;

  factory VideoDownloadPlayedEvent.fromJson(Map<String, dynamic> json) => _$VideoDownloadPlayedEventFromJson(json);
}
