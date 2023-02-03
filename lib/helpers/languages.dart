import 'dart:ui';

class LanguageInfo {
  final Locale locale;
  final String nativeName;
  final String englishName;

  const LanguageInfo({
    required this.locale,
    required this.nativeName,
    required this.englishName,
  });
}

class LanguageCodes {
  static const de = 'de';
  static const en = 'en';
  static const es = 'es';
  static const fi = 'fi';
  static const fr = 'fr';
  static const hr = 'hr';
  static const hu = 'hu';
  static const it = 'it';
  static const ml = 'ml';
  static const nl = 'nl';
  static const no = 'no';
  static const pl = 'pl';
  static const pt = 'pt';
  static const ro = 'ro';
  static const ru = 'ru';
  static const sl = 'sl';
  static const ta = 'ta';
  static const tr = 'tr';
  static const da = 'da';
  static const bg = 'bg';
  static const zh = 'zh';
  static const zh_HK = 'zh-HK';
}

const languages = {
  LanguageCodes.de: LanguageInfo(
    locale: Locale('de'),
    nativeName: 'Deutsch',
    englishName: 'German',
  ),
  LanguageCodes.en: LanguageInfo(
    locale: Locale('en'),
    nativeName: 'English',
    englishName: 'English',
  ),
  LanguageCodes.es: LanguageInfo(
    locale: Locale('es'),
    nativeName: 'Español',
    englishName: 'Spanish',
  ),
  LanguageCodes.fi: LanguageInfo(
    locale: Locale('fi'),
    nativeName: 'Suomi',
    englishName: 'Finnish',
  ),
  LanguageCodes.fr: LanguageInfo(
    locale: Locale('fr'),
    nativeName: 'Français',
    englishName: 'French',
  ),
  LanguageCodes.hr: LanguageInfo(
    locale: Locale('hr'),
    nativeName: 'Hrvatski',
    englishName: 'Croatian',
  ),
  LanguageCodes.hu: LanguageInfo(
    locale: Locale('hu'),
    nativeName: 'Magyar',
    englishName: 'Hungarian',
  ),
  LanguageCodes.it: LanguageInfo(
    locale: Locale('it'),
    nativeName: 'Italiano',
    englishName: 'Italian',
  ),
  LanguageCodes.ml: LanguageInfo(
    locale: Locale('ml'),
    nativeName: 'മലയാളം',
    englishName: 'Malayalam',
  ),
  LanguageCodes.nl: LanguageInfo(
    locale: Locale('nl'),
    nativeName: 'Nederlands',
    englishName: 'Dutch',
  ),
  LanguageCodes.no: LanguageInfo(
    locale: Locale('no'),
    nativeName: 'Norsk',
    englishName: 'Norwegian',
  ),
  LanguageCodes.pl: LanguageInfo(
    locale: Locale('pl'),
    nativeName: 'Polski',
    englishName: 'Polish',
  ),
  LanguageCodes.pt: LanguageInfo(
    locale: Locale('pt'),
    nativeName: 'Português',
    englishName: 'Portuguese',
  ),
  LanguageCodes.ro: LanguageInfo(
    locale: Locale('ro'),
    nativeName: 'Română',
    englishName: 'Romanian',
  ),
  LanguageCodes.ru: LanguageInfo(
    locale: Locale('ru'),
    nativeName: 'Pусский',
    englishName: 'Russian',
  ),
  LanguageCodes.sl: LanguageInfo(
    locale: Locale('sl'),
    nativeName: 'Slovenščina',
    englishName: 'Slovenian',
  ),
  LanguageCodes.ta: LanguageInfo(
    locale: Locale('ta'),
    nativeName: 'தமிழ்',
    englishName: 'Tamil',
  ),
  LanguageCodes.tr: LanguageInfo(
    locale: Locale('tr'),
    nativeName: 'Türkçe',
    englishName: 'Turkish',
  ),
  LanguageCodes.da: LanguageInfo(
    locale: Locale('da'),
    nativeName: 'Dansk',
    englishName: 'Danish',
  ),
  LanguageCodes.bg: LanguageInfo(
    locale: Locale('bg'),
    nativeName: 'български',
    englishName: 'Bulgarian',
  ),
  LanguageCodes.zh: LanguageInfo(
    locale: Locale('zh'),
    nativeName: '中文',
    englishName: 'Chinese',
  ),
  LanguageCodes.zh_HK: LanguageInfo(
    locale: Locale('zh', 'HK'),
    nativeName: '粵語',
    englishName: 'Cantonese',
  ),
};

final appLanuageCodes = [
  LanguageCodes.de,
  LanguageCodes.en,
  LanguageCodes.es,
  LanguageCodes.fi,
  LanguageCodes.fr,
  LanguageCodes.hu,
  LanguageCodes.it,
  LanguageCodes.nl,
  LanguageCodes.no,
  LanguageCodes.pl,
  LanguageCodes.pt,
  LanguageCodes.ro,
  LanguageCodes.ru,
  LanguageCodes.sl,
  LanguageCodes.tr,
  LanguageCodes.da,
  LanguageCodes.bg,
];

String? getLanguageName(String? languageCode) {
  if (languageCode == null) {
    return null;
  }
  return languages[languageCode]?.nativeName;
}

Locale? getLocale(String? languageCode) {
  if (languageCode == null) {
    return null;
  }
  return languages[languageCode]?.locale;
}
