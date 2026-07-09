import 'package:bccm_core/bccm_core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('getFormattedAgeRating', () {
    test('maps "A" to "0+"', () {
      expect(getFormattedAgeRating('A'), '0+');
    });

    test('appends "+" to a numeric rating', () {
      expect(getFormattedAgeRating('12'), '12+');
      expect(getFormattedAgeRating('18'), '18+');
    });
  });

  group('NullableContinuation.let', () {
    test('runs the callback and returns its result when non-null', () {
      const value = 'x';
      expect(value.let((it) => it.toUpperCase()), 'X');
    });

    test('returns null and does not run the callback when null', () {
      String? nullString() => null;
      final value = nullString();
      var ran = false;
      final result = value.let((it) {
        ran = true;
        return it;
      });
      expect(result, isNull);
      expect(ran, isFalse);
    });
  });
}
