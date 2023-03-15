import 'package:brunstadtv_app/components/surveys/bottom_sheet/rating_bar.dart';
import 'package:brunstadtv_app/graphql/queries/survey.graphql.dart';
import 'package:brunstadtv_app/theme/bccm_colors.dart';
import 'package:brunstadtv_app/theme/bccm_typography.dart';
import 'package:flutter/material.dart';

import '../../text_field_input.dart';

abstract class SurveyAnswer {}

class SurveyRatingAnswer implements SurveyAnswer {
  final String id;
  final int rating;
  SurveyRatingAnswer({required this.id, required this.rating});
}

class SurveyQuestionAnswer implements SurveyAnswer {
  final String id;
  final String answer;
  SurveyQuestionAnswer({required this.id, required this.answer});
}

class SurveyQuestions extends StatefulWidget {
  final List<Fragment$SurveyQuestion> surveyQuestions;

  const SurveyQuestions(this.surveyQuestions, {super.key});

  @override
  State<SurveyQuestions> createState() => _SurveyQuestionsState();
}

class _SurveyQuestionsState extends State<SurveyQuestions> {
  final Map<String, SurveyAnswer> surveyAnswers = {};

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: widget.surveyQuestions.map(
        (question) {
          if (question is Fragment$SurveyQuestion$$SurveyRatingQuestion) {
            return SurveyQuestionRating(
              question: question,
              onRatingChanged: (rating) {
                surveyAnswers[question.id] = SurveyRatingAnswer(id: question.id, rating: rating);
                print('ratingAnswers: $surveyAnswers');
              },
            );
          } else if (question is Fragment$SurveyQuestion$$SurveyTextQuestion) {
            return SurveyQuestionText(
              question: question,
              onAnswerChanged: (answer) {
                surveyAnswers[question.id] = SurveyQuestionAnswer(id: question.id, answer: answer);
                print('questionAnswers: $surveyAnswers');
              },
            );
          }
          return const SizedBox.shrink();
        },
      ).toList(),
    );
  }
}

class SurveyQuestionRating extends StatefulWidget {
  final Fragment$SurveyQuestion$$SurveyRatingQuestion question;
  final Function(int) onRatingChanged;

  const SurveyQuestionRating({
    super.key,
    required this.question,
    required this.onRatingChanged,
  });

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
              widget.onRatingChanged(rating);
            },
          ),
        ],
      ),
    );
  }
}

class SurveyQuestionText extends StatefulWidget {
  final Fragment$SurveyQuestion$$SurveyTextQuestion question;
  final Function(String) onAnswerChanged;

  const SurveyQuestionText({
    super.key,
    required this.question,
    required this.onAnswerChanged,
  });

  @override
  State<SurveyQuestionText> createState() => _SurveyQuestionTextState();
}

class _SurveyQuestionTextState extends State<SurveyQuestionText> {
  final textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    textController.addListener(() {
      final answer = textController.text;
      if (answer.trim().isNotEmpty) {
        widget.onAnswerChanged(answer);
      }
    });
  }

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
              margin: const EdgeInsets.only(bottom: 8),
              child: Text(
                widget.question.description!,
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
