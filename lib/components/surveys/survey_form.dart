import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import 'package:bccm_core/platform.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../../l10n/app_localizations.dart';
import 'package:bccm_core/design_system.dart';
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

class SurveyForm extends StatefulHookWidget {
  final Fragment$Survey survey;
  final Function(List<SurveyAnswer>) onSubmit;
  final VoidCallback onCancel;

  const SurveyForm({
    super.key,
    required this.survey,
    required this.onSubmit,
    required this.onCancel,
  });

  @override
  State<SurveyForm> createState() => _SurveyFormState();
}

class _SurveyFormState extends State<SurveyForm> {
  final Map<String, SurveyAnswer> surveyAnswers = {};

  bool get ratingFirst => widget.survey.questions.items.firstOrNull is Fragment$SurveyQuestion$$SurveyRatingQuestion;
  bool get showOnlyFirstQuestion => ratingFirst && !surveyAnswers.containsKey(widget.survey.questions.items.first.id);

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

    final scrollController = useScrollController();
    useValueChanged(MediaQuery.viewInsetsOf(context).bottom, (val, void _) {
      // when the keyboard appears we want to scroll to the bottom of the form
      if (scrollController.hasClients) {
        scrollController.jumpTo(
          scrollController.position.maxScrollExtent,
        );
      }
    });
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.survey.description != null)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Text(
                        widget.survey.description!,
                        style: design.textStyles.body3,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ...widget.survey.questions.items.mapIndexed(
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
                          autoFocus: false,
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  )
                ],
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
      ),
    );
  }
}
