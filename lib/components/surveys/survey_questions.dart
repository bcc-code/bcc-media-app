import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../../theme/bccm_colors.dart';
import '../../theme/bccm_typography.dart';
import '../../../graphql/queries/prompts.graphql.dart';
import '../../../helpers/ui/btv_buttons.dart';
import '../../../l10n/app_localizations.dart';
import '../text_field_input.dart';
import 'rating_bar.dart';

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
  bool showOnlyFirstQuestion = false;

  @override
  void initState() {
    super.initState();
    if (widget.surveyQuestions.isNotEmpty && widget.surveyQuestions.first is Fragment$SurveyQuestion$$SurveyRatingQuestion) {
      showOnlyFirstQuestion = true;
    }
  }

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
                        if (showOnlyFirstQuestion) {
                          setState(() => showOnlyFirstQuestion = false);
                        }
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
                      autoFocus: index == 0 || (index == 1 && widget.surveyQuestions[0] is Fragment$SurveyQuestion$$SurveyRatingQuestion),
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
                child: BtvButton.largeSecondary(
                  labelText: S.of(context).cancel,
                  onPressed: widget.onCancel,
                ),
              ),
              Expanded(
                child: BtvButton.large(
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

class SurveyQuestionText extends StatefulWidget {
  final Fragment$SurveyQuestion$$SurveyTextQuestion question;
  final Function(String) onAnswerChanged;
  final bool autoFocus;

  const SurveyQuestionText({
    super.key,
    required this.question,
    required this.onAnswerChanged,
    this.autoFocus = false,
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
      widget.onAnswerChanged(textController.text);
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
            minLines: 7,
            maxLines: 10,
            controller: textController,
            autoFocus: widget.autoFocus,
          ),
        ],
      ),
    );
  }
}
