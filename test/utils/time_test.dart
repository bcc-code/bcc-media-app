import 'package:bccm_core/bccm_core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('getFormattedDuration', () {
    test('formats zero as m:ss', () {
      expect(getFormattedDuration(0), '0:00');
    });

    test('formats seconds under a minute', () {
      expect(getFormattedDuration(59), '0:59');
    });

    test('formats exactly one minute', () {
      expect(getFormattedDuration(60), '1:00');
    });

    test('pads seconds within a minute', () {
      expect(getFormattedDuration(5), '0:05');
    });

    test('formats an hour as h:mm:ss', () {
      expect(getFormattedDuration(3600), '1:00:00');
    });

    test('formats hours, minutes and seconds', () {
      expect(getFormattedDuration(3661), '1:01:01');
    });

    test('padFirstSegment pads the leading minutes when there are no hours', () {
      expect(getFormattedDuration(65, padFirstSegment: true), '01:05');
    });

    test('padFirstSegment pads the leading hours', () {
      expect(getFormattedDuration(3661, padFirstSegment: true), '01:01:01');
    });
  });

  group('getFormattedProductionDate', () {
    test('returns null for null input', () {
      expect(getFormattedProductionDate(null), isNull);
    });

    test('returns null for unparseable input', () {
      expect(getFormattedProductionDate('not-a-date'), isNull);
    });

    test('formats a valid ISO date', () {
      expect(getFormattedProductionDate('2026-07-09'), '09. Jul 2026');
    });
  });

  group('getEarliestNullableDateTime', () {
    test('returns the earliest date, ignoring nulls', () {
      final result = getEarliestNullableDateTime([DateTime.parse('2026-07-09'), null, DateTime.parse('2026-01-01'), DateTime.parse('2026-12-31')]);
      expect(result, DateTime.parse('2026-01-01'));
    });

    test('returns null when all entries are null', () {
      expect(getEarliestNullableDateTime([null, null]), isNull);
    });
  });
}
