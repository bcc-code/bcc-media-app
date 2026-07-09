import 'package:brunstadtv_app/helpers/forms/range_input_formatter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('RangeInputFormatter', () {
    final formatter = RangeInputFormatter(min: 1, max: 100);

    TextEditingValue value(String text) => TextEditingValue(text: text);

    TextEditingValue format(String oldText, String newText) {
      return formatter.formatEditUpdate(value(oldText), value(newText));
    }

    test('passes an empty string through unchanged', () {
      expect(format('50', '').text, '');
    });

    test('accepts a value within range', () {
      expect(format('50', '55').text, '55');
    });

    test('accepts the min boundary', () {
      expect(format('', '1').text, '1');
    });

    test('accepts the max boundary', () {
      expect(format('50', '100').text, '100');
    });

    test('snaps a below-min value to min', () {
      expect(format('50', '0').text, '1');
    });

    test('snaps non-numeric input to min', () {
      expect(format('50', 'abc').text, '1');
    });

    test('rejects an above-max value by keeping the old value', () {
      expect(format('50', '101').text, '50');
    });
  });
}
