import 'package:flutter/material.dart';

import '../design_system.dart';

class BccMediaInputDecorations extends DesignSystemInputDecorations {
  BccMediaInputDecorations({
    required DesignSystemColors colors,
    required DesignSystemTextStyles textStyles,
  }) : super(
          textFormField: InputDecoration(
            filled: true,
            isDense: true,
            fillColor: colors.background2,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: BorderSide.none),
            contentPadding: const EdgeInsets.all(12),
            suffixIconConstraints: const BoxConstraints(minHeight: 24, minWidth: 24),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: colors.tint1, width: 1),
              borderRadius: BorderRadius.circular(6),
            ),
            hintStyle: textStyles.body2.copyWith(
              color: colors.label4,
              height: 1.45,
            ),
          ),
        );
}
