import 'package:collection/collection.dart';

import 'languages.dart';

const noneLanguageCode = 'none';

const subtitleLanguages = [
  LanguageInfo(
    code: noneLanguageCode,
    nativeName: 'None',
  ),
  ...languages
];

String? getSubtitleLanguageName(String? languageCode) {
  languageCode = languageCode ?? noneLanguageCode;
  return subtitleLanguages.firstWhereOrNull((l) => l.code == languageCode)?.nativeName;
}
