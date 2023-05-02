import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';

import '../../helpers/ui/svg_icons.dart';
import '../../theme/design_system/design_system.dart';

class PasswordTextField extends HookWidget {
  const PasswordTextField({super.key, required this.focusNode, required this.controller, this.onEditingComplete});

  final FocusNode focusNode;
  final TextEditingController controller;
  final void Function()? onEditingComplete;

  @override
  Widget build(BuildContext context) {
    final obscureText = useState(true);
    return TextField(
      focusNode: focusNode,
      controller: controller,
      autofillHints: const [AutofillHints.password],
      style: DesignSystem.of(context).textStyles.body2.copyWith(color: DesignSystem.of(context).colors.label1),
      cursorColor: DesignSystem.of(context).colors.tint1,
      cursorWidth: 1,
      maxLength: 100,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      buildCounter: (context, {required currentLength, required isFocused, maxLength}) => null,
      onEditingComplete: onEditingComplete,
      obscureText: obscureText.value,
      decoration: InputDecoration(
        filled: true,
        isDense: true,
        hintText: 'Enter password',
        fillColor: DesignSystem.of(context).colors.background2,
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
              theme: SvgTheme(currentColor: DesignSystem.of(context).colors.label3),
            ),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: DesignSystem.of(context).colors.tint1, width: 1),
          borderRadius: BorderRadius.circular(6),
        ),
        hintStyle: DesignSystem.of(context).textStyles.body2.copyWith(
              color: DesignSystem.of(context).colors.label4,
              height: 1.45,
            ),
      ),
    );
  }
}
