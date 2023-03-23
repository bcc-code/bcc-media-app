import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../helpers/extensions.dart';
import '../../graphql/queries/prompts.graphql.dart';
import '../../models/survey.dart';
import '../../providers/prompts.dart';
import '../../providers/surveys.dart';
import 'prompt_survey.dart';

class Prompts extends ConsumerStatefulWidget {
  const Prompts({super.key});

  @override
  ConsumerState<Prompts> createState() => _PromptsState();
}

class _PromptsState extends ConsumerState<Prompts> {
  final List<String> closedPrompts = [];

  void closePrompt(String promptId) {
    setState(() => closedPrompts.add(promptId));
  }

  bool isCompletedSurvey(List<CompletedSurvey> completedSurveys, Fragment$Prompt$$SurveyPrompt surveyPrompt) {
    return completedSurveys.where((survey) => survey.id == surveyPrompt.survey.id).isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    final prompts = ref.watch(promptsProvider);
    final completedSurveys = ref.watch(completedSurveysProvider).valueOrNull;

    return prompts.when(
      data: (prompts) {
        final openPrompts = prompts.whereNot((prompt) => closedPrompts.contains(prompt.id));
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: openPrompts.map(
            (prompt) {
              final surveyPrompt = prompt.asOrNull<Fragment$Prompt$$SurveyPrompt>();
              if (surveyPrompt != null && completedSurveys != null && !isCompletedSurvey(completedSurveys!, surveyPrompt)) {
                return PromptSurvey(prompt: surveyPrompt, onClose: () => closePrompt(surveyPrompt.id));
              }
              return const SizedBox.shrink();
            },
          ).toList(),
        );
      },
      error: (error, stackTrace) => const SizedBox.shrink(),
      loading: () => const SizedBox.shrink(),
    );
  }
}
