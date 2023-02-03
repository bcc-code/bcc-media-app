import 'dart:ui';

class LanguageInfo {
  final Locale locale;
  final String nativeName;

  const LanguageInfo({required this.locale, required this.nativeName});
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
  ),
  LanguageCodes.en: LanguageInfo(
    locale: Locale('en'),
    nativeName: 'English',
  ),
  LanguageCodes.es: LanguageInfo(
    locale: Locale('es'),
    nativeName: 'Español',
  ),
  LanguageCodes.fi: LanguageInfo(
    locale: Locale('fi'),
    nativeName: 'Suomi',
  ),
  LanguageCodes.fr: LanguageInfo(
    locale: Locale('fr'),
    nativeName: 'Français',
  ),
  LanguageCodes.hr: LanguageInfo(
    locale: Locale('hr'),
    nativeName: 'Hrvatski',
  ),
  LanguageCodes.hu: LanguageInfo(
    locale: Locale('hu'),
    nativeName: 'Magyar',
  ),
  LanguageCodes.it: LanguageInfo(
    locale: Locale('it'),
    nativeName: 'Italiano',
  ),
  LanguageCodes.ml: LanguageInfo(
    locale: Locale('ml'),
    nativeName: 'മലയാളം',
  ),
  LanguageCodes.nl: LanguageInfo(
    locale: Locale('nl'),
    nativeName: 'Nederlands',
  ),
  LanguageCodes.no: LanguageInfo(
    locale: Locale('no'),
    nativeName: 'Norsk',
  ),
  LanguageCodes.pl: LanguageInfo(
    locale: Locale('pl'),
    nativeName: 'Polski',
  ),
  LanguageCodes.pt: LanguageInfo(
    locale: Locale('pt'),
    nativeName: 'Português',
  ),
  LanguageCodes.ro: LanguageInfo(
    locale: Locale('ro'),
    nativeName: 'Română',
  ),
  LanguageCodes.ru: LanguageInfo(
    locale: Locale('ru'),
    nativeName: 'Pусский',
  ),
  LanguageCodes.sl: LanguageInfo(
    locale: Locale('sl'),
    nativeName: 'Slovenščina',
  ),
  LanguageCodes.ta: LanguageInfo(
    locale: Locale('ta'),
    nativeName: 'தமிழ்',
  ),
  LanguageCodes.tr: LanguageInfo(
    locale: Locale('tr'),
    nativeName: 'Türkçe',
  ),
  LanguageCodes.da: LanguageInfo(
    locale: Locale('da'),
    nativeName: 'Dansk',
  ),
  LanguageCodes.bg: LanguageInfo(
    locale: Locale('bg'),
    nativeName: 'български',
  ),
  LanguageCodes.zh: LanguageInfo(
    locale: Locale('zh'),
    nativeName: '中文',
  ),
  LanguageCodes.zh_HK: LanguageInfo(
    locale: Locale('zh', 'HK'),
    nativeName: '粵語',
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
