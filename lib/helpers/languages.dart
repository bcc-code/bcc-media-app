import 'package:collection/collection.dart';

class LanguageInfo {
  final String code;
  final String nativeName;

  const LanguageInfo({required this.code, required this.nativeName});
}

const languages = [
  LanguageInfo(
    code: 'de',
    nativeName: 'Deutsch',
  ),
  LanguageInfo(
    code: 'en',
    nativeName: 'English',
  ),
  LanguageInfo(
    code: 'es',
    nativeName: 'Español',
  ),
  LanguageInfo(
    code: 'fi',
    nativeName: 'Suomi',
  ),
  LanguageInfo(
    code: 'fr',
    nativeName: 'Français',
  ),
  LanguageInfo(
    code: 'hu',
    nativeName: 'Magyar',
  ),
  LanguageInfo(
    code: 'it',
    nativeName: 'Italiano',
  ),
  LanguageInfo(
    code: 'nl',
    nativeName: 'Nederlands',
  ),
  LanguageInfo(
    code: 'no',
    nativeName: 'Norsk',
  ),
  LanguageInfo(
    code: 'pl',
    nativeName: 'Polski',
  ),
  LanguageInfo(
    code: 'pt',
    nativeName: 'Português',
  ),
  LanguageInfo(
    code: 'ro',
    nativeName: 'Română',
  ),
  LanguageInfo(
    code: 'ru',
    nativeName: 'Pусский',
  ),
  LanguageInfo(
    code: 'sl',
    nativeName: 'Slovenščina',
  ),
  LanguageInfo(
    code: 'tr',
    nativeName: 'Türkçe',
  ),
];

String? getLanguageName(String? languageCode) {
  if (languageCode == null) return null;
  return languages.firstWhereOrNull((l) => l.code == languageCode)?.nativeName;
}
