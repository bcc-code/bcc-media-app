import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../helpers/btv_buttons.dart';
import '../helpers/btv_colors.dart';
import '../helpers/btv_typography.dart';
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
                        style: BtvTextStyles.title1,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      child: Text(
                        S.of(context).checkNetwork,
                        textAlign: TextAlign.center,
                        style: BtvTextStyles.body1.copyWith(color: BtvColors.label3),
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
                      style: BtvTextStyles.title3,
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
