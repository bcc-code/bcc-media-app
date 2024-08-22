import 'package:flutter/material.dart';

import 'package:bccm_core/design_system.dart';

import '../../l10n/app_localizations.dart';

class ShortErrorView extends StatelessWidget {
  const ShortErrorView({super.key, required this.onRetry, this.title, this.description, this.retryButtonText, this.errorCode, this.errorMessage});
  final void Function() onRetry;
  final String? errorCode;
  final String? errorMessage;
  final String? title;
  final String? description;
  final String? retryButtonText;

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    return Center(
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
                      style: design.textStyles.title1,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: Text(
                      description ?? S.of(context).checkNetwork,
                      textAlign: TextAlign.center,
                      style: design.textStyles.body1.copyWith(color: design.colors.label3),
                    ),
                  ),
                  design.buttons.small(
                    labelText: retryButtonText ?? S.of(context).tryAgainButton,
                    image: Icon(Icons.refresh, color: design.colors.label1, size: 22),
                    imagePosition: ButtonImagePosition.right,
                    onPressed: onRetry,
                  ),
                  if (errorCode != null || errorMessage != null)
                    Container(
                      margin: const EdgeInsets.only(top: 32),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: design.colors.background2,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            S.of(context).technicalDetails,
                            style: design.textStyles.title3,
                          ),
                          if (errorCode != null)
                            SelectableText(
                              'Code: ${errorCode!}',
                              style: design.textStyles.body3.copyWith(color: design.colors.label3),
                              textAlign: TextAlign.left,
                            ),
                          if (errorMessage != null)
                            SelectableText(
                              errorMessage!,
                              style: design.textStyles.body3.copyWith(color: design.colors.label3),
                              textAlign: TextAlign.left,
                            ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
