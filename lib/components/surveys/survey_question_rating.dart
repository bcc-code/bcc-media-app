import 'package:flutter/material.dart';

import '../../graphql/queries/prompts.graphql.dart';
import '../../theme/bccm_colors.dart';
import '../../theme/bccm_typography.dart';
import 'rating_bar.dart';

class SurveyQuestionRating extends StatelessWidget {
  final Fragment$SurveyQuestion$$SurveyRatingQuestion question;
  final Function(int) onRatingChanged;

  const SurveyQuestionRating({
    super.key,
    required this.question,
    required this.onRatingChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 4),
            child: Text(question.title, style: BccmTextStyles.title2),
          ),
          if (question.description != null)
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: Text(
                question.description!,
                style: BccmTextStyles.body2.copyWith(color: BccmColors.label3),
              ),
            ),
          RatingBar(onRatingChanged: onRatingChanged),
        ],
      ),
    );
  }
}
