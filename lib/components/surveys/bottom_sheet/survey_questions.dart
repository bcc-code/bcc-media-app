import 'package:brunstadtv_app/components/surveys/bottom_sheet/rating_bar.dart';
import 'package:brunstadtv_app/graphql/queries/survey.graphql.dart';
import 'package:brunstadtv_app/theme/bccm_colors.dart';
import 'package:brunstadtv_app/theme/bccm_typography.dart';
import 'package:flutter/material.dart';

import '../../text_field_input.dart';

class SurveyQuestions extends StatelessWidget {
  final List<Fragment$SurveyQuestion> surveyQuestions;

  const SurveyQuestions(this.surveyQuestions, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: surveyQuestions.map(
        (question) {
          if (question is Fragment$SurveyQuestion$$SurveyRatingQuestion) {
            return SurveyQuestionRating(question);
          } else if (question is Fragment$SurveyQuestion$$SurveyTextQuestion) {
            return SurveyQuestionText(question);
          }
          return const SizedBox.shrink();
        },
      ).toList(),
    );
  }
}

class SurveyQuestionRating extends StatefulWidget {
  final Fragment$SurveyQuestion$$SurveyRatingQuestion question;

  const SurveyQuestionRating(this.question, {super.key});

  @override
  State<SurveyQuestionRating> createState() => _SurveyQuestionRatingState();
}

class _SurveyQuestionRatingState extends State<SurveyQuestionRating> {
  int curRating = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 4),
            child: Text(widget.question.title, style: BccmTextStyles.title2),
          ),
          if (widget.question.description != null)
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: Text(
                widget.question.description!,
                style: BccmTextStyles.body2.copyWith(color: BccmColors.label3),
              ),
            ),
          RatingBar(
            rating: curRating,
            onRatingChanged: (rating) {
              setState(() => curRating = rating);
            },
          ),
        ],
      ),
    );
  }
}

class SurveyQuestionText extends StatelessWidget {
  final Fragment$SurveyQuestion$$SurveyTextQuestion question;
  final textController = TextEditingController();

  SurveyQuestionText(this.question, {super.key});

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
              margin: const EdgeInsets.only(bottom: 8),
              child: Text(
                question.description!,
                style: BccmTextStyles.body2.copyWith(color: BccmColors.label3),
              ),
            ),
          TextFieldInput(
            controller: textController,
            minLines: 7,
            maxLines: 10,
          ),
        ],
      ),
    );
  }
}
