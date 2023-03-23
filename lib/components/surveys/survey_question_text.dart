import 'package:flutter/material.dart';

import '../../graphql/queries/prompts.graphql.dart';
import '../../theme/bccm_colors.dart';
import '../../theme/bccm_input_decorations.dart';
import '../../theme/bccm_typography.dart';

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
          TextField(
            minLines: 7,
            maxLines: 10,
            controller: textController,
            autofocus: widget.autoFocus,
            style: BccmTextStyles.body1.copyWith(color: BccmColors.label1),
            decoration: BccmInputDecorations.textFormField,
          ),
        ],
      ),
    );
  }
}
