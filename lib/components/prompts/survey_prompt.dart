import 'package:auto_size_text/auto_size_text.dart';
import 'package:bccm_core/bccm_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';

import 'package:bccm_core/platform.dart';
import '../../helpers/svg_icons.dart';
import 'package:bccm_core/design_system.dart';

import '../surveys/bottom_sheet_survey.dart';

class SurveyPrompt extends StatelessWidget {
  final Fragment$Prompt$$SurveyPrompt prompt;
  final VoidCallback onClose;

  const SurveyPrompt({
    super.key,
    required this.prompt,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    return GestureDetector(
      onTap: () => openBottomSheetSurvey(context, prompt.survey),
      child: Container(
        height: 62,
        padding: const EdgeInsets.symmetric(horizontal: kIsWeb ? 80 : 16, vertical: 12),
        decoration: BoxDecoration(
          color: design.colors.background2,
          border: Border(top: BorderSide(color: design.colors.separatorOnLight, width: 1)),
        ),
        child: SizedBox(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 16),
                child: SvgPicture.string(
                  SvgIcons.feedbackStar,
                  colorFilter: ColorFilter.mode(design.colors.tint1, BlendMode.srcIn),
                  width: 24,
                  height: 24,
                ).animate(onComplete: (c) => c.repeat()).rotate(begin: 0, end: 1, curve: Curves.easeInOutCubicEmphasized, duration: 10000.ms),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (prompt.secondaryTitle != null)
                      Text(prompt.secondaryTitle!, style: design.textStyles.caption2.copyWith(color: design.colors.label3)),
                    AutoSizeText(
                      prompt.title,
                      style: design.textStyles.caption1.copyWith(color: design.colors.label1),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              GestureDetector(
                onTap: onClose,
                child: SvgPicture.string(SvgIcons.close),
              ),
            ],
          ),
        ),
      ).animate(onComplete: (c) => c.repeat()).shimmer(
            duration: 8000.ms,
            color: design.colors.background1,
            blendMode: BlendMode.screen,
            size: 2,
          ),
    );
  }
}
