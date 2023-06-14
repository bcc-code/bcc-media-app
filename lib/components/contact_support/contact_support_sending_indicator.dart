import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import '../../theme/design_system/design_system.dart';
import '../status_indicators/loading_indicator.dart';

class ContactSupportSendingIndicator extends StatelessWidget {
  const ContactSupportSendingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const LoadingIndicator(),
          const SizedBox(
            height: 12,
          ),
          Text(
            S.of(context).sending,
            style: DesignSystem.of(context).textStyles.body1,
          ),
        ],
      ),
    );
  }
}
