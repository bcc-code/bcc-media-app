import 'package:brunstadtv_app/helpers/ui/svg_icons.dart';
import 'package:brunstadtv_app/theme/bccm_colors.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../theme/bccm_typography.dart';

class EmailTextField extends StatelessWidget {
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
    return TextFormField(
      focusNode: emailFocusNode,
      controller: emailTextController,
      autofillHints: const [AutofillHints.email],
      validator: (email) {
        if (email != null && !EmailValidator.validate(email)) {
          return 'Invalid email';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.disabled,
      style: BccmTextStyles.body2.copyWith(color: BccmColors.label1),
      cursorColor: BccmColors.tint1,
      cursorWidth: 1,
      onEditingComplete: onEditingComplete,
      decoration: InputDecoration(
        filled: true,
        isDense: true,
        hintText: 'Email address',
        fillColor: BccmColors.background2,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: BorderSide.none),
        contentPadding: const EdgeInsets.all(12),
        suffixIconConstraints: const BoxConstraints(minHeight: 24, minWidth: 24),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 12),
          child: SvgPicture.string(
            SvgIcons.clearXIcon,
            theme: const SvgTheme(currentColor: BccmColors.label3),
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
