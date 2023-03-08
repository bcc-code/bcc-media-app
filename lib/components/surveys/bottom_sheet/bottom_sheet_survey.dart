import 'package:flutter/material.dart';

import '../../../graphql/queries/survey.graphql.dart';
import '../../../helpers/ui/btv_buttons.dart';
import '../../../l10n/app_localizations.dart';
import '../../../theme/bccm_colors.dart';
import '../../../theme/bccm_typography.dart';
import 'survey_questions.dart';

class BottomSheetSurvey extends StatelessWidget {
  final Fragment$Survey survey;

  const BottomSheetSurvey(this.survey, {super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      padding: MediaQuery.of(context).viewInsets,
      duration: const Duration(milliseconds: 200),
      child: Container(
        decoration: const BoxDecoration(
          color: BccmColors.background1,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                child: UnconstrainedBox(
                  child: Container(
                    height: 5,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: BccmColors.label4,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                child: Text(
                  survey.title,
                  textAlign: TextAlign.center,
                  style: BccmTextStyles.title3,
                ),
              ),
              Flexible(
                child: SingleChildScrollView(child: SurveyQuestions(survey.questions.items)),
              ),
              Container(
                height: 52,
                margin: const EdgeInsets.only(top: 16),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 16),
                      child: BtvButton.largeSecondary(
                        labelText: S.of(context).cancel,
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                    Expanded(
                      child: BtvButton.large(
                        labelText: S.of(context).sendFeedback,
                        onPressed: () {},
                        disabled: true,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
