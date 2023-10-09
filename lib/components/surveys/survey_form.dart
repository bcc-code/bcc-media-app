import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../../../graphql/queries/prompts.graphql.dart';
import '../../../l10n/app_localizations.dart';
import '../../theme/design_system/design_system.dart';
import 'survey_question_rating.dart';
import 'survey_question_text.dart';

abstract class SurveyAnswer {}

class SurveyAnswerRating implements SurveyAnswer {
  final String id;
  final int rating;
  SurveyAnswerRating({required this.id, required this.rating});
}

class SurveyAnswerText implements SurveyAnswer {
  final String id;
  final String answer;
  SurveyAnswerText({required this.id, required this.answer});
}

class SurveyForm extends StatefulWidget {
  final List<Fragment$SurveyQuestion> surveyQuestions;
  final Function(List<SurveyAnswer>) onSubmit;
  final VoidCallback onCancel;

  const SurveyForm({
    super.key,
    required this.surveyQuestions,
    required this.onSubmit,
    required this.onCancel,
  });

  @override
  State<SurveyForm> createState() => _SurveyFormState();
}

class _SurveyFormState extends State<SurveyForm> {
  final Map<String, SurveyAnswer> surveyAnswers = {};

  bool get ratingFirst => widget.surveyQuestions.firstOrNull is Fragment$SurveyQuestion$$SurveyRatingQuestion;
  bool get showOnlyFirstQuestion => ratingFirst && !surveyAnswers.containsKey(widget.surveyQuestions.first.id);

  void updateAnswer(String id, SurveyAnswer? answer) {
    setState(() {
      if (answer == null) {
        surveyAnswers.remove(id);
      } else {
        surveyAnswers[id] = answer;
      }
    });
  }

  void onSendFeedback() {
    widget.onSubmit(surveyAnswers.values.toList());
  }

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.surveyQuestions.mapIndexed(
                (index, question) {
                  if (index > 0 && showOnlyFirstQuestion) {
                    return const SizedBox.shrink();
                  }
                  if (question is Fragment$SurveyQuestion$$SurveyRatingQuestion) {
                    return SurveyQuestionRating(
                      question: question,
                      onRatingChanged: (rating) {
                        updateAnswer(question.id, SurveyAnswerRating(id: question.id, rating: rating));
                      },
                    );
                  } else if (question is Fragment$SurveyQuestion$$SurveyTextQuestion) {
                    return SurveyQuestionText(
                      question: question,
                      onAnswerChanged: (answer) {
                        updateAnswer(
                          question.id,
                          answer.trim().isEmpty ? null : SurveyAnswerText(id: question.id, answer: answer),
                        );
                      },
                      autoFocus: index == 0 || (index == 1 && ratingFirst),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ).toList(),
            ),
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
                  onPressed: widget.onCancel,
                ),
              ),
              Expanded(
                child: design.buttons.large(
                  labelText: S.of(context).sendFeedback,
                  onPressed: onSendFeedback,
                  disabled: surveyAnswers.isEmpty,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
