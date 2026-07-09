import 'package:bccm_core/bccm_core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('normalizeLanguage', () {
    test('maps Norwegian variants to "no"', () {
      expect(normalizeLanguage('nb'), 'no');
      expect(normalizeLanguage('nn'), 'no');
    });

    test('maps legacy Turkish "tk" to "tr"', () {
      expect(normalizeLanguage('tk'), 'tr');
    });

    test('passes through an unmapped code unchanged', () {
      expect(normalizeLanguage('en'), 'en');
      expect(normalizeLanguage('xx'), 'xx');
    });
  });

  group('toThreeLetterLanguageCode', () {
    // One representative alias per language; guards against typos/missed
    // aliases in the big switch that would break track selection.
    const cases = {
      'no': 'nor',
      'nb-NO': 'nor',
      'nob': 'nor',
      'en': 'eng',
      'en-GB': 'eng',
      'fr': 'fra',
      'de-DE': 'deu',
      'hu': 'hun',
      'es': 'spa',
      'it': 'ita',
      'pl': 'pol',
      'ro': 'ron',
      'ru': 'rus',
      'sl': 'slv',
      'tr': 'tur',
      'zh-CN': 'zho',
      'zh-HK': 'yue',
      'ta': 'tam',
      'bg': 'bul',
      'nl': 'nld',
      'da': 'dan',
      'fi': 'fin',
      'pt': 'por',
      'kha': 'kha',
      'hr': 'hrv',
    };

    cases.forEach((input, expected) {
      test('maps "$input" to "$expected"', () {
        expect(toThreeLetterLanguageCode(input), expected);
      });
    });

    test('passes through an unknown code unchanged', () {
      expect(toThreeLetterLanguageCode('qqq'), 'qqq');
    });
  });

  group('getLanguageName / getLocale', () {
    test('return null for a null code', () {
      expect(getLanguageName(null), isNull);
      expect(getLocale(null), isNull);
    });

    test('return null for an unknown code', () {
      expect(getLanguageName('xx'), isNull);
      expect(getLocale('xx'), isNull);
    });

    test('return the native name and locale for a known code', () {
      expect(getLanguageName('no'), 'Norsk');
      expect(getLocale('no')?.languageCode, 'no');
    });
  });
}
