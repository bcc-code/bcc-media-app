import 'package:flutter/material.dart';

import 'package:bccm_core/design_system.dart';

import '../../l10n/app_localizations.dart';

class ErrorGeneric extends StatelessWidget {
  const ErrorGeneric({Key? key, required this.onRetry, this.title, this.description, this.retryButtonText, this.details}) : super(key: key);
  final void Function() onRetry;
  final String? details;
  final String? title;
  final String? description;
  final String? retryButtonText;

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
                        title ?? S.of(context).loadContentError,
                        style: DesignSystem.of(context).textStyles.title1,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      child: Text(
                        description ?? S.of(context).checkNetwork,
                        textAlign: TextAlign.center,
                        style: DesignSystem.of(context).textStyles.body1.copyWith(color: DesignSystem.of(context).colors.label3),
                      ),
                    ),
                    DesignSystem.of(context).buttons.medium(
                          labelText: retryButtonText ?? S.of(context).tryAgainButton,
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
                    title: Text(
                      S.of(context).technicalDetails,
                      style: DesignSystem.of(context).textStyles.title3,
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
