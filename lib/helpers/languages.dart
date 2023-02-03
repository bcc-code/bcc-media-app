import 'package:collection/collection.dart';

class LanguageInfo {
  final String code;
  final String nativeName;
  final String englishName;

  const LanguageInfo({
    required this.code,
    required this.nativeName,
    required this.englishName,
  });
}

const languages = [
  LanguageInfo(
    code: 'de',
    nativeName: 'Deutsch',
    englishName: 'German',
  ),
  LanguageInfo(
    code: 'en',
    nativeName: 'English',
    englishName: 'English',
  ),
  LanguageInfo(
    code: 'es',
    nativeName: 'Español',
    englishName: 'Spanish',
  ),
  LanguageInfo(
    code: 'fi',
    nativeName: 'Suomi',
    englishName: 'Finnish',
  ),
  LanguageInfo(
    code: 'fr',
    nativeName: 'Français',
    englishName: 'French',
  ),
  LanguageInfo(
    code: 'hu',
    nativeName: 'Magyar',
    englishName: 'Hungarian',
  ),
  LanguageInfo(
    code: 'it',
    nativeName: 'Italiano',
    englishName: 'Italian',
  ),
  LanguageInfo(
    code: 'nl',
    nativeName: 'Nederlands',
    englishName: 'Dutch',
  ),
  LanguageInfo(
    code: 'no',
    nativeName: 'Norsk',
    englishName: 'Norwegian',
  ),
  LanguageInfo(
    code: 'pl',
    nativeName: 'Polski',
    englishName: 'Polish',
  ),
  LanguageInfo(
    code: 'pt',
    nativeName: 'Português',
    englishName: 'Portuguese',
  ),
  LanguageInfo(
    code: 'ro',
    nativeName: 'Română',
    englishName: 'Romanian',
  ),
  LanguageInfo(
    code: 'ru',
    nativeName: 'Pусский',
    englishName: 'Russian',
  ),
  LanguageInfo(
    code: 'sl',
    nativeName: 'Slovenščina',
    englishName: 'Slovenian',
  ),
  LanguageInfo(
    code: 'tr',
    nativeName: 'Türkçe',
    englishName: 'Turkish',
  ),
  LanguageInfo(
    code: 'da',
    nativeName: 'Dansk',
    englishName: 'Danish',
  ),
  LanguageInfo(
    code: 'bg',
    nativeName: 'български',
    englishName: 'Bulgarian',
  ),
];

String? getLanguageName(String? languageCode) {
  if (languageCode == null) return null;
  return languages.firstWhereOrNull((l) => l.code == languageCode)?.nativeName;
}
