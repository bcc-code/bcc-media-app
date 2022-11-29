import 'package:freezed_annotation/freezed_annotation.dart';

part 'language_changed.freezed.dart';
part 'language_changed.g.dart';

@freezed
class LanguageChangedEvent with _$LanguageChangedEvent {
  const factory LanguageChangedEvent({
    required String languageFrom,
    required String languageTo,
    required String languageChangeType,
  }) = _LanguageChangedEvent;

  factory LanguageChangedEvent.fromJson(Map<String, dynamic> json) => _$LanguageChangedEventFromJson(json);
}
