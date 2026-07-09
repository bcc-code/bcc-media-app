import 'package:bccm_core/bccm_core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('StringExtensions.isBlank', () {
    test('is true for null', () {
      String? value;
      expect(value.isBlank, isTrue);
    });

    test('is true for empty and whitespace-only strings', () {
      expect(''.isBlank, isTrue);
      expect('   '.isBlank, isTrue);
      expect('\n\t'.isBlank, isTrue);
    });

    test('is false for a string with non-whitespace content', () {
      expect('a'.isBlank, isFalse);
      expect('  x  '.isBlank, isFalse);
    });
  });

  group('StringExtensions.capitalized', () {
    test('returns the value unchanged when blank', () {
      String? value;
      expect(value.capitalized, isNull);
      expect(''.capitalized, '');
    });

    test('uppercases the first letter and lowercases the rest', () {
      expect('hello'.capitalized, 'Hello');
      // Documents the (surprising) contract: the tail is lowercased too.
      expect('hELLO'.capitalized, 'Hello');
    });

    test('handles a single character', () {
      expect('a'.capitalized, 'A');
    });
  });

  group('AsExtension.asOrNull', () {
    test('returns the value when the type matches', () {
      const Object value = 'text';
      expect(value.asOrNull<String>(), 'text');
    });

    test('returns null when the type does not match', () {
      const Object value = 42;
      expect(value.asOrNull<String>(), isNull);
    });
  });
}
