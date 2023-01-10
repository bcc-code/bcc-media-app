import 'package:freezed_annotation/freezed_annotation.dart';

part 'audio_only_clicked.freezed.dart';
part 'audio_only_clicked.g.dart';

@freezed
class AudioOnlyClickedEvent with _$AudioOnlyClickedEvent {
  const factory AudioOnlyClickedEvent({
    required bool audioOnly,
  }) = _AudioOnlyClickedEvent;

  factory AudioOnlyClickedEvent.fromJson(Map<String, dynamic> json) => _$AudioOnlyClickedEventFromJson(json);
}
