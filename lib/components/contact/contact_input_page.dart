import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../l10n/app_localizations.dart';
import '../../theme/design_system/design_system.dart';
import 'device_info_table.dart';

class ContactInputPage extends HookWidget {
  const ContactInputPage(this.messageController, {super.key});

  final TextEditingController messageController;

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16).copyWith(top: 0),
          child: Text(
            S.of(context).contactSupport,
            style: design.textStyles.headline1,
          ),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              TextField(
                minLines: 9,
                maxLines: 13,
                controller: messageController,
                decoration: design.inputDecorations.textFormField.copyWith(hintText: S.of(context).contactIssueHint),
                style: design.textStyles.body1.copyWith(color: design.colors.label1),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 10),
                child: Text(
                  S.of(context).debugInfoExplanation,
                  style: design.textStyles.body2.copyWith(color: design.colors.label1),
                ),
              ),
              const DeviceInfoTable(),
            ],
          ),
        ),
      ],
    );
  }
}
