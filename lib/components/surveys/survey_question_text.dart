import 'package:flutter/material.dart';

import '../../graphql/queries/prompts.graphql.dart';

import '../../theme/design_system/design_system.dart';

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
            child: Text(widget.question.title, style: DesignSystem.of(context).textStyles.title2),
          ),
          if (widget.question.description != null)
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              child: Text(
                widget.question.description!,
                style: DesignSystem.of(context).textStyles.body2.copyWith(color: DesignSystem.of(context).colors.label3),
              ),
            ),
          TextField(
            minLines: 7,
            maxLines: 10,
            controller: textController,
            autofocus: widget.autoFocus,
            style: DesignSystem.of(context).textStyles.body1.copyWith(color: DesignSystem.of(context).colors.label1),
            decoration: DesignSystem.of(context).inputDecorations.textFormField,
          ),
        ],
      ),
    );
  }
}
