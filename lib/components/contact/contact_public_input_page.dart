import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:universal_io/io.dart';

import '../../helpers/svg_icons.dart';
import '../../l10n/app_localizations.dart';
import '../../theme/design_system/design_system.dart';
import '../onboarding/email_text_field.dart';

class ContactPublicInputPage extends HookWidget {
  const ContactPublicInputPage({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.messageController,
    required this.onIncludeDeviceInfoChange,
    required this.onShowDeviceInfoTap,
  });

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController messageController;
  final Function(bool) onIncludeDeviceInfoChange;
  final void Function() onShowDeviceInfoTap;

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);

    final includeDeviceInfo = useState(true);
    final emailFocusNode = useFocusNode();
    final messageFocusNode = useFocusNode();

    void includeDeviceInfoChange(bool state) {
      includeDeviceInfo.value = state;
      onIncludeDeviceInfoChange(state);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16).copyWith(top: 0),
          child: Text(
            S.of(context).contactUs,
            style: design.textStyles.headline1,
          ),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: Text(
                  S.of(context).contactName,
                  style: design.textStyles.caption1.copyWith(color: design.colors.label2),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 12),
                child: TextField(
                  cursorColor: design.colors.tint1,
                  controller: nameController,
                  style: design.textStyles.body2.copyWith(color: design.colors.label1),
                  onEditingComplete: () => emailFocusNode.requestFocus(),
                  decoration: design.inputDecorations.textFormField.copyWith(
                    hintText: S.of(context).contactNameHint,
                    suffixIcon: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 100),
                      child: nameController.text.isEmpty
                          ? null
                          : GestureDetector(
                              onTap: () => nameController.value = TextEditingValue.empty,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 12),
                                child: SvgPicture.string(
                                  SvgIcons.clearXIcon,
                                  theme: SvgTheme(currentColor: design.colors.label3),
                                ),
                              ),
                            ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: Text(
                  S.of(context).contactEmail,
                  style: design.textStyles.caption1.copyWith(color: design.colors.label2),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 12),
                child: EmailTextField(
                  emailFocusNode: emailFocusNode,
                  emailTextController: emailController,
                  onEditingComplete: () => messageFocusNode.requestFocus(),
                  hintText: S.of(context).contactEmailHint,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: Text(
                  S.of(context).contactMessage,
                  style: design.textStyles.caption1.copyWith(color: design.colors.label2),
                ),
              ),
              TextField(
                focusNode: messageFocusNode,
                cursorColor: design.colors.tint1,
                minLines: 9,
                maxLines: 13,
                controller: messageController,
                decoration: design.inputDecorations.textFormField.copyWith(hintText: S.of(context).contactMessageHint),
                style: design.textStyles.body2.copyWith(color: design.colors.label1),
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () => includeDeviceInfoChange(!includeDeviceInfo.value),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Switch.adaptive(
                      activeColor: Platform.isIOS ? design.colors.tint1 : null,
                      value: includeDeviceInfo.value,
                      onChanged: (value) => includeDeviceInfoChange(value),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(text: '${S.of(context).contactIncludeDeviceInfo} ', style: design.textStyles.caption1),
                            TextSpan(
                              recognizer: TapGestureRecognizer()..onTap = onShowDeviceInfoTap,
                              text: S.of(context).contactSeeData,
                              style: design.textStyles.caption1.copyWith(
                                fontWeight: FontWeight.w700,
                                decoration: TextDecoration.underline,
                                color: design.colors.tint1,
                              ),
                            ),
                          ]),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
