import 'package:brunstadtv_app/providers/settings.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('sanitizeLanguageCodes', () {
    test('keeps known language codes and preserves their order', () {
      expect(sanitizeLanguageCodes(['en', 'no', 'de']), ['en', 'no', 'de']);
    });

    test('removes a stray "null" code (the reported bug)', () {
      // A leftover "null" segment used to be hidden but kept its index,
      // making it unremovable and crashing the reorderable list.
      expect(sanitizeLanguageCodes(['null', 'en', 'no']), ['en', 'no']);
    });

    test('removes empty and whitespace-only entries', () {
      expect(sanitizeLanguageCodes(['', 'en', '   ', 'no']), ['en', 'no']);
    });

    test('removes unknown language codes', () {
      expect(sanitizeLanguageCodes(['en', 'xx', 'no', 'zz']), ['en', 'no']);
    });

    test('trims surrounding whitespace around valid codes', () {
      expect(sanitizeLanguageCodes([' en ', 'no\n']), ['en', 'no']);
    });

    test('returns an empty list when given an empty list', () {
      expect(sanitizeLanguageCodes([]), isEmpty);
    });

    test('returns an empty list when every code is invalid', () {
      expect(sanitizeLanguageCodes(['null', '', 'xx']), isEmpty);
    });
  });
}
