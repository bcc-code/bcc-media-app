import 'package:flutter/material.dart';

import '../theme/bccm_colors.dart';
import '../theme/bccm_typography.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;
  final String? hintText;
  final int minLines;
  final int maxLines;

  const TextFieldInput({
    super.key,
    required this.controller,
    this.minLines = 9,
    this.maxLines = 13,
    this.hintText,
    this.autoFocus = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      minLines: minLines,
      maxLines: maxLines,
      textAlign: TextAlign.start,
      keyboardType: TextInputType.multiline,
      textInputAction: TextInputAction.newline,
      style: BccmTextStyles.body1.copyWith(color: BccmColors.label1),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: BccmTextStyles.body1,
        filled: true,
        fillColor: BccmColors.background2,
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6.0)),
          borderSide: BorderSide(
            width: 1,
            color: BccmColors.background1,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6.0)),
            borderSide: BorderSide(
              width: 1,
              color: BccmColors.tint1,
            )),
        contentPadding: const EdgeInsets.all(16),
      ),
      controller: controller,
      autofocus: autoFocus,
    );
  }
}
