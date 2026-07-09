import 'package:bccm_core/bccm_core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('getExtendedVersionNumber', () {
    test('returns 0 for an empty string', () {
      expect(getExtendedVersionNumber(''), 0);
    });

    test('encodes major/minor/patch into a single comparable int', () {
      expect(getExtendedVersionNumber('1.2.3'), 1 * 100000 + 2 * 1000 + 3);
      expect(getExtendedVersionNumber('1.2.3'), 102003);
    });

    test('orders versions numerically', () {
      expect(getExtendedVersionNumber('1.10.0') > getExtendedVersionNumber('1.9.0'), isTrue);
      expect(getExtendedVersionNumber('2.0.0') > getExtendedVersionNumber('1.99.99'), isTrue);
    });

    test('treats missing trailing segments as zero', () {
      expect(getExtendedVersionNumber('1.2'), getExtendedVersionNumber('1.2.0'));
      expect(getExtendedVersionNumber('1'), getExtendedVersionNumber('1.0.0'));
    });

    test('treats non-numeric segments as zero instead of throwing', () {
      expect(getExtendedVersionNumber('1.2.x'), getExtendedVersionNumber('1.2.0'));
    });
  });
}
