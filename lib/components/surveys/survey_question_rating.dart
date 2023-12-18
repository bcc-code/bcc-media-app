import 'package:flutter/material.dart';

import '../../graphql/queries/prompts.graphql.dart';
import 'package:bccm_core/design_system.dart';

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
            child: Text(question.title, style: DesignSystem.of(context).textStyles.title2),
          ),
          if (question.description != null)
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: Text(
                question.description!,
                style: DesignSystem.of(context).textStyles.body2.copyWith(color: DesignSystem.of(context).colors.label3),
              ),
            ),
          RatingBar(onRatingChanged: onRatingChanged),
        ],
      ),
    );
  }
}
