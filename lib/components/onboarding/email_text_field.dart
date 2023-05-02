import 'package:brunstadtv_app/helpers/ui/svg_icons.dart';
import 'package:brunstadtv_app/theme/design_system/design_system.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';

class EmailTextField extends HookWidget {
  const EmailTextField({
    super.key,
    required this.emailFocusNode,
    required this.emailTextController,
    required this.onEditingComplete,
  });

  final FocusNode emailFocusNode;
  final TextEditingController emailTextController;
  final void Function() onEditingComplete;

  @override
  Widget build(BuildContext context) {
    useListenable(emailTextController);
    return TextFormField(
      focusNode: emailFocusNode,
      controller: emailTextController,
      autofillHints: const [AutofillHints.email],
      autocorrect: false,
      keyboardType: TextInputType.emailAddress,
      validator: (email) {
        if (email != null && !EmailValidator.validate(email)) {
          return 'Invalid email';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.disabled,
      style: DesignSystem.of(context).textStyles.body2.copyWith(color: DesignSystem.of(context).colors.label1),
      cursorColor: DesignSystem.of(context).colors.tint1,
      cursorWidth: 1,
      onEditingComplete: onEditingComplete,
      decoration: InputDecoration(
        filled: true,
        isDense: true,
        hintText: 'Email address',
        fillColor: DesignSystem.of(context).colors.background2,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: BorderSide.none),
        contentPadding: const EdgeInsets.all(12),
        suffixIconConstraints: const BoxConstraints(minHeight: 24, minWidth: 24),
        suffixIcon: emailTextController.text.isEmpty
            ? null
            : GestureDetector(
                onTap: () => emailTextController.value = TextEditingValue.empty,
                child: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: SvgPicture.string(
                    SvgIcons.clearXIcon,
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
