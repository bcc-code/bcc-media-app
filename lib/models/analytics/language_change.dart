import 'package:freezed_annotation/freezed_annotation.dart';

part 'language_change.freezed.dart';
part 'language_change.g.dart';

@freezed
class LanguageChange with _$LanguageChange {
  const factory LanguageChange({
    required String languageFrom,
    required String languageTo,
    required String languageChangeType,
  }) = _LanguageChange;

  factory LanguageChange.fromJson(Map<String, dynamic> json) => _$LanguageChangeFromJson(json);
}
