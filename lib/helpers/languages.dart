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
  static const zhHK = 'zh-HK';
}

const languages = {
  LanguageCodes.de: LanguageInfo(
    locale: Locale(LanguageCodes.de),
    nativeName: 'Deutsch',
    englishName: 'German',
  ),
  LanguageCodes.en: LanguageInfo(
    locale: Locale(LanguageCodes.en),
    nativeName: 'English',
    englishName: 'English',
  ),
  LanguageCodes.es: LanguageInfo(
    locale: Locale(LanguageCodes.es),
    nativeName: 'Español',
    englishName: 'Spanish',
  ),
  LanguageCodes.fi: LanguageInfo(
    locale: Locale(LanguageCodes.fi),
    nativeName: 'Suomi',
    englishName: 'Finnish',
  ),
  LanguageCodes.fr: LanguageInfo(
    locale: Locale(LanguageCodes.fr),
    nativeName: 'Français',
    englishName: 'French',
  ),
  LanguageCodes.hr: LanguageInfo(
    locale: Locale(LanguageCodes.hr),
    nativeName: 'Hrvatski',
    englishName: 'Croatian',
  ),
  LanguageCodes.hu: LanguageInfo(
    locale: Locale(LanguageCodes.hu),
    nativeName: 'Magyar',
    englishName: 'Hungarian',
  ),
  LanguageCodes.it: LanguageInfo(
    locale: Locale(LanguageCodes.it),
    nativeName: 'Italiano',
    englishName: 'Italian',
  ),
  LanguageCodes.ml: LanguageInfo(
    locale: Locale(LanguageCodes.ml),
    nativeName: 'മലയാളം',
    englishName: 'Malayalam',
  ),
  LanguageCodes.nl: LanguageInfo(
    locale: Locale(LanguageCodes.nl),
    nativeName: 'Nederlands',
    englishName: 'Dutch',
  ),
  LanguageCodes.no: LanguageInfo(
    locale: Locale(LanguageCodes.no),
    nativeName: 'Norsk',
    englishName: 'Norwegian',
  ),
  LanguageCodes.pl: LanguageInfo(
    locale: Locale(LanguageCodes.pl),
    nativeName: 'Polski',
    englishName: 'Polish',
  ),
  LanguageCodes.pt: LanguageInfo(
    locale: Locale(LanguageCodes.pt),
    nativeName: 'Português',
    englishName: 'Portuguese',
  ),
  LanguageCodes.ro: LanguageInfo(
    locale: Locale(LanguageCodes.ro),
    nativeName: 'Română',
    englishName: 'Romanian',
  ),
  LanguageCodes.ru: LanguageInfo(
    locale: Locale(LanguageCodes.ru),
    nativeName: 'Pусский',
    englishName: 'Russian',
  ),
  LanguageCodes.sl: LanguageInfo(
    locale: Locale(LanguageCodes.sl),
    nativeName: 'Slovenščina',
    englishName: 'Slovenian',
  ),
  LanguageCodes.ta: LanguageInfo(
    locale: Locale(LanguageCodes.ta),
    nativeName: 'தமிழ்',
    englishName: 'Tamil',
  ),
  LanguageCodes.tr: LanguageInfo(
    locale: Locale(LanguageCodes.tr),
    nativeName: 'Türkçe',
    englishName: 'Turkish',
  ),
  LanguageCodes.da: LanguageInfo(
    locale: Locale(LanguageCodes.da),
    nativeName: 'Dansk',
    englishName: 'Danish',
  ),
  LanguageCodes.bg: LanguageInfo(
    locale: Locale(LanguageCodes.bg),
    nativeName: 'български',
    englishName: 'Bulgarian',
  ),
  LanguageCodes.zh: LanguageInfo(
    locale: Locale(LanguageCodes.zh),
    nativeName: '中文',
    englishName: 'Chinese',
  ),
  LanguageCodes.zhHK: LanguageInfo(
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

String normalizeLanguage(String code) {
  switch (code) {
    case 'tk':
      return 'tr';
    case 'nb':
    case 'nn':
      return 'no';
    default:
      return code;
  }
}
