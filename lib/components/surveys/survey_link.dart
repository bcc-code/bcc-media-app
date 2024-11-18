import 'package:bccm_core/design_system.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SurveyLink extends StatelessWidget {
  final VoidCallback onCancel;
  final String url;
  final String title;
  final String? description;
  final String actionButtonText;
  final String? cancelButtonText;

  const SurveyLink({
    super.key,
    required this.onCancel,
    required this.url,
    required this.actionButtonText,
    required this.title,
    this.description,
    this.cancelButtonText,
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
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(
                    title,
                    style: design.textStyles.title2,
                    textAlign: TextAlign.center,
                  ),
                ),
                if (description != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Text(
                      description!,
                      style: design.textStyles.body3,
                      textAlign: TextAlign.center,
                    ),
                  ),
              ],
            ),
          ),
          Container(
            height: 116,
            margin: const EdgeInsets.only(top: 16),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: design.buttons.large(
                    labelText: actionButtonText,
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
                Container(
                  margin: const EdgeInsets.only(top: 12),
                  width: double.infinity,
                  child: design.buttons.large(
                    variant: ButtonVariant.secondary,
                    labelText: cancelButtonText ?? S.of(context).cancel,
                    onPressed: onCancel,
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
