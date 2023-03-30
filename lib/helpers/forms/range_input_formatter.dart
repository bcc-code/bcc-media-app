import 'package:flutter/services.dart';

// Based on https://stackoverflow.com/a/68072967
class RangeInputFormatter extends TextInputFormatter {
  final int min;
  final int max;

  RangeInputFormatter({required this.min, required this.max});

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text == '') {
      return newValue;
    }
    final newInt = int.tryParse(newValue.text);
    if (newInt == null || newInt < min) {
      return const TextEditingValue().copyWith(text: min.toString());
    } else {
      return newInt > max ? oldValue : newValue;
    }
  }
}
