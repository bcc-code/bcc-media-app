import 'package:bccm_core/design_system.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SurveyLink extends StatelessWidget {
  final VoidCallback onCancel;
  final String description;
  final String url;
  final String? buttonLabel;

  const SurveyLink({
    super.key,
    required this.onCancel,
    required this.description,
    required this.url,
    this.buttonLabel,
  });

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(
                    description,
                    style: design.textStyles.body3,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 52,
            margin: const EdgeInsets.only(top: 16),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 16),
                  child: design.buttons.large(
                    variant: ButtonVariant.secondary,
                    labelText: S.of(context).cancel,
                    onPressed: onCancel,
                  ),
                ),
                Expanded(
                  child: design.buttons.large(
                    labelText: buttonLabel ?? S.of(context).open,
                    onPressed: () async {
                      final uri = Uri.parse(url);
                      if (await canLaunchUrl(uri)) {
                        await launchUrl(
                          uri,
                          mode: LaunchMode.externalApplication,
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
