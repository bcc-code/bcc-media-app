import 'package:brunstadtv_app/components/onboarding/signup_page_wrapper.dart';
import 'package:brunstadtv_app/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../helpers/forms/range_input_formatter.dart';
import '../../../helpers/ui/btv_buttons.dart';
import '../../../helpers/widget_keys.dart';
import '../../../l10n/app_localizations.dart';
import '../../../theme/bccm_colors.dart';
import '../../../theme/bccm_decorations.dart';
import '../../../theme/bccm_typography.dart';

class SignupBirthDatePage extends HookWidget {
  const SignupBirthDatePage({
    super.key,
    required this.pageController,
    required this.monthController,
    required this.monthFocusNode,
    required this.yearController,
    required this.yearFocusNode,
  });

  final PageController pageController;
  final TextEditingController monthController;
  final FocusNode monthFocusNode;
  final TextEditingController yearController;
  final FocusNode yearFocusNode;

  @override
  Widget build(BuildContext context) {
    useAutomaticKeepAlive();
    useListenable(monthController);
    useListenable(yearController);
    final formKey = useState(GlobalKey<FormState>());

    nextPage() {
      if (!formKey.value.currentState!.validate()) {
        return;
      }
    }

    return Form(
      key: formKey.value,
      child: SignupPageWrapper(
        title: 'Birth date',
        description: 'We use your birth date to give you a more tailored experience.',
        body: [
          Padding(
            padding: const EdgeInsets.only(top: 48, bottom: 10),
            child: Text(
              'Birth Date (MM/YYYY)',
              style: BccmTextStyles.caption1.copyWith(color: BccmColors.label2),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Focus(
                  onFocusChange: (value) {
                    if (!value && monthController.value.text.isNotEmpty) {
                      monthController.value = monthController.value.copyWith(text: monthController.value.text.padLeft(2, '0'));
                    }
                  },
                  child: TextFormField(
                    controller: monthController,
                    focusNode: monthFocusNode,
                    inputFormatters: [RangeInputFormatter(min: 0, max: 12)],
                    autovalidateMode: AutovalidateMode.disabled,
                    style: BccmTextStyles.body2.copyWith(color: BccmColors.label1),
                    cursorColor: BccmColors.tint1,
                    cursorWidth: 1,
                    decoration: BccmDecorations.textFormField,
                    onEditingComplete: () {
                      yearFocusNode.requestFocus();
                    },
                    onChanged: (v) {
                      if (v.length == 2) yearFocusNode.requestFocus();
                    },
                    keyboardType: TextInputType.number,
                    buildCounter: (context, {required currentLength, required isFocused, maxLength}) => null,
                    maxLength: 2,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Focus(
                  onFocusChange: (value) {
                    if (!value && yearController.value.text.isNotEmpty) {
                      yearController.value = yearController.value.copyWith(text: yearController.value.text.padLeft(4, '0'));
                    }
                  },
                  child: TextFormField(
                    controller: yearController,
                    focusNode: yearFocusNode,
                    inputFormatters: [RangeInputFormatter(min: 0, max: DateTime.now().year)],
                    keyboardType: TextInputType.number,
                    autovalidateMode: AutovalidateMode.disabled,
                    style: BccmTextStyles.body2.copyWith(color: BccmColors.label1),
                    cursorColor: BccmColors.tint1,
                    cursorWidth: 1,
                    decoration: BccmDecorations.textFormField,
                    onEditingComplete: nextPage,
                  ),
                ),
              ),
            ],
          ),
        ],
        bottomArea: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Row(
              children: [
                Expanded(
                  child: BtvButton.largeSecondary(
                    onPressed: () {
                      pageController.previousPage(duration: const Duration(milliseconds: 500), curve: Curves.easeOutExpo);
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    labelText: S.of(context).back,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: monthController.value.text.isBlank || yearController.value.text.isBlank
                      ? BtvButton.largeDisabled(
                          key: WidgetKeys.registerButton,
                          onPressed: () {},
                          labelText: S.of(context).registerButton,
                        )
                      : BtvButton.large(
                          key: WidgetKeys.registerButton,
                          onPressed: () {
                            pageController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeOutExpo);
                            FocusManager.instance.primaryFocus?.unfocus();
                          },
                          labelText: S.of(context).registerButton,
                        ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
