import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';

import '../../helpers/ui/svg_icons.dart';
import '../../theme/bccm_colors.dart';
import '../../theme/bccm_typography.dart';

class PasswordTextField extends HookWidget {
  const PasswordTextField({
    super.key,
    required this.focusNode,
    required this.controller,
  });

  final FocusNode focusNode;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final obscureText = useState(true);
    return TextField(
      focusNode: focusNode,
      controller: controller,
      style: BccmTextStyles.body2.copyWith(color: BccmColors.label1),
      cursorColor: BccmColors.tint1,
      cursorWidth: 1,
      maxLength: 100,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      buildCounter: (context, {required currentLength, required isFocused, maxLength}) => null,
      obscureText: obscureText.value,
      decoration: InputDecoration(
        filled: true,
        isDense: true,
        hintText: 'Enter password',
        fillColor: BccmColors.background2,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: BorderSide.none),
        contentPadding: const EdgeInsets.all(12),
        suffixIconConstraints: const BoxConstraints(minHeight: 24, minWidth: 24),
        suffixIcon: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => obscureText.value = !obscureText.value,
          child: Padding(
            padding: const EdgeInsets.only(right: 12),
            child: SvgPicture.string(
              obscureText.value ? SvgIcons.eyeClosed : SvgIcons.eyeOpen,
              theme: const SvgTheme(currentColor: BccmColors.label3),
            ),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: BccmColors.tint1, width: 1),
          borderRadius: BorderRadius.circular(6),
        ),
        hintStyle: BccmTextStyles.body2.copyWith(
          color: BccmColors.label4,
          height: 1.45,
        ),
      ),
    );
  }
}
