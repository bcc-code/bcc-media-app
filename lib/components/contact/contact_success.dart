import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import '../../theme/design_system/design_system.dart';

class ContactSuccess extends StatelessWidget {
  const ContactSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  S.of(context).thankYouSupportTitle,
                  textAlign: TextAlign.center,
                  style: design.textStyles.headline1,
                ),
                const SizedBox(height: 12),
                Text(
                  S.of(context).thankYouSupportDescription,
                  textAlign: TextAlign.center,
                  style: design.textStyles.body1.copyWith(color: design.colors.label3),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: design.buttons.large(
              labelText: S.of(context).done,
              onPressed: context.router.pop,
            ),
          ),
        ],
      ),
    );
  }
}
