import 'package:flutter/material.dart';

import '../helpers/ui/btv_buttons.dart';
import '../theme/bccm_colors.dart';
import '../theme/bccm_typography.dart';
import '../l10n/app_localizations.dart';

class ErrorGeneric extends StatelessWidget {
  const ErrorGeneric({Key? key, required this.onRetry, this.details}) : super(key: key);
  final void Function() onRetry;
  final String? details;

  @override
  Widget build(BuildContext context) => Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        S.of(context).loadContentError,
                        style: BccmTextStyles.title1,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      child: Text(
                        S.of(context).checkNetwork,
                        textAlign: TextAlign.center,
                        style: BccmTextStyles.body1.copyWith(color: BccmColors.label3),
                      ),
                    ),
                    BtvButton.medium(
                      labelText: S.of(context).tryAgainButton,
                      onPressed: () => onRetry(),
                    ),
                  ],
                ),
              ),
              if (details != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 32),
                  child: ExpansionTile(
                    tilePadding: EdgeInsets.zero,
                    title: const Text(
                      'Technical details',
                      style: BccmTextStyles.title3,
                    ),
                    children: [
                      SelectableText(
                        details!,
                      )
                    ],
                  ),
                ),
            ],
          ),
        ),
      );
}
