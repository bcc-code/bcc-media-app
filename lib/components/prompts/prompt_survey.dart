import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../graphql/queries/prompts.graphql.dart';
import '../../helpers/ui/btv_buttons.dart';
import '../../helpers/ui/svg_icons.dart';
import '../../l10n/app_localizations.dart';
import '../../theme/bccm_colors.dart';
import '../../theme/bccm_typography.dart';
import '../surveys/bottom_sheet_survey.dart';

class PromptSurvey extends StatelessWidget {
  final Fragment$Prompt$$SurveyPrompt prompt;
  final VoidCallback onClose;

  const PromptSurvey({
    super.key,
    required this.prompt,
    required this.onClose,
  });

  openBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      isScrollControlled: true,
      useSafeArea: true,
      isDismissible: true,
      builder: (context) => BottomSheetSurvey(prompt),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 62,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        color: BccmColors.background2,
        border: Border(top: BorderSide(color: BccmColors.separatorOnLight, width: 1)),
      ),
      child: SizedBox(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 16),
              child: SvgPicture.string(
                SvgIcons.feedbackStar,
                colorFilter: const ColorFilter.mode(BccmColors.tint1, BlendMode.srcIn),
                width: 24,
                height: 24,
              ),
            ),
            Expanded(child: Text(prompt.title, style: BccmTextStyles.title3)),
            Container(
              margin: const EdgeInsets.only(right: 8),
              child: BtvButton.small(
                labelText: S.of(context).open,
                onPressed: () => openBottomSheet(context),
              ),
            ),
            GestureDetector(
              onTap: onClose,
              child: SvgPicture.string(SvgIcons.close),
            ),
          ],
        ),
      ),
    );
  }
}
