import 'package:flutter/material.dart';

import 'bccm_colors.dart';
import 'bccm_typography.dart';

class BccmDecorations {
  BccmDecorations._();
  static final textFormField = InputDecoration(
    filled: true,
    isDense: true,
    hintText: 'Type in first name',
    fillColor: BccmColors.background2,
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: BorderSide.none),
    contentPadding: const EdgeInsets.all(12),
    suffixIconConstraints: const BoxConstraints(minHeight: 24, minWidth: 24),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: BccmColors.tint1, width: 1),
      borderRadius: BorderRadius.circular(6),
    ),
    hintStyle: BccmTextStyles.body2.copyWith(
      color: BccmColors.label4,
      height: 1.45,
    ),
  );
}
