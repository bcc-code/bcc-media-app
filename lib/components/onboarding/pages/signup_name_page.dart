import 'package:brunstadtv_app/components/onboarding/signup_page_wrapper.dart';
import 'package:brunstadtv_app/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../helpers/ui/btv_buttons.dart';
import '../../../helpers/ui/svg_icons.dart';
import '../../../l10n/app_localizations.dart';
import '../../../theme/bccm_colors.dart';
import '../../../theme/bccm_decorations.dart';
import '../../../theme/bccm_typography.dart';

class SignupNamePage extends HookWidget {
  const SignupNamePage({
    super.key,
    required this.pageController,
    required this.firstNameController,
    required this.firstNameFocusNode,
    required this.lastNameController,
    required this.lastNameFocusNode,
    required this.birthDateFocusNode,
  });

  final PageController pageController;
  final TextEditingController firstNameController;
  final FocusNode firstNameFocusNode;
  final TextEditingController lastNameController;
  final FocusNode lastNameFocusNode;
  final FocusNode birthDateFocusNode;

  @override
  Widget build(BuildContext context) {
    useAutomaticKeepAlive();
    useListenable(firstNameController);
    useListenable(lastNameController);
    final formKey = useState(GlobalKey<FormState>());

    nextPage() {
      if (!formKey.value.currentState!.validate()) {
        return;
      }
      pageController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeOutExpo);
      birthDateFocusNode.requestFocus();
    }

    return Form(
      key: formKey.value,
      child: SignupPageWrapper(
        title: 'Your name',
        description: "What's your name?",
        body: [
          Padding(
            padding: const EdgeInsets.only(top: 48, bottom: 10),
            child: Text(
              'First name',
              style: BccmTextStyles.caption1.copyWith(color: BccmColors.label2),
            ),
          ),
          TextFormField(
            controller: firstNameController,
            focusNode: firstNameFocusNode,
            autovalidateMode: AutovalidateMode.disabled,
            style: BccmTextStyles.body2.copyWith(color: BccmColors.label1),
            cursorColor: BccmColors.tint1,
            cursorWidth: 1,
            decoration: BccmDecorations.textFormField,
            onEditingComplete: () => lastNameFocusNode.requestFocus(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 10),
            child: Text(
              'Last name',
              style: BccmTextStyles.caption1.copyWith(color: BccmColors.label2),
            ),
          ),
          TextFormField(
            controller: lastNameController,
            focusNode: lastNameFocusNode,
            autovalidateMode: AutovalidateMode.disabled,
            style: BccmTextStyles.body2.copyWith(color: BccmColors.label1),
            cursorColor: BccmColors.tint1,
            cursorWidth: 1,
            decoration: BccmDecorations.textFormField,
            onEditingComplete: nextPage,
          ),
        ],
        bottomArea: [
          Focus(
            child: Container(
              padding: const EdgeInsets.only(bottom: 16),
              width: double.infinity,
              child: firstNameController.value.text.isBlank || lastNameController.value.text.isBlank
                  ? BtvButton.largeDisabled(
                      onPressed: () {},
                      labelText: S.of(context).continueButton,
                    )
                  : BtvButton.large(
                      onPressed: nextPage,
                      labelText: S.of(context).continueButton,
                    ),
            ),
          )
        ],
      ),
    );
  }
}
