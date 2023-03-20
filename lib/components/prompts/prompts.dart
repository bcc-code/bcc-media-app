import 'dart:convert';

import 'package:brunstadtv_app/helpers/extensions.dart';
import 'package:collection/collection.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../graphql/queries/prompts.graphql.dart';
import '../../models/survey.dart';
import '../../providers/prompts.dart';
import './surveys/survey_prompt.dart';

class Prompts extends ConsumerStatefulWidget {
  const Prompts({super.key});

  @override
  ConsumerState<Prompts> createState() => _PromptsState();
}

class _PromptsState extends ConsumerState<Prompts> {
  final List<String> closedPrompts = [];

  void close(String promptId) {
    setState(() => closedPrompts.add(promptId));
  }

  bool isOutdatedSurvey(Fragment$Prompt$$SurveyPrompt surveyPrompt, List<CompletedSurvey> completedSurveys) {
    return completedSurveys.where((survey) => survey.id == surveyPrompt.survey.id).isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    final prompts = ref.watch(promptsProvider);
    final completedSurveys = ref.watch(completedSurveysProvider).valueOrNull ?? [];

    return prompts.when(
      error: (error, stackTrace) {
        FirebaseCrashlytics.instance.recordError(error, stackTrace);
        return const SizedBox.shrink();
      },
      loading: () => const SizedBox.shrink(),
      data: (prompts) {
        final openPrompts = prompts.whereNot((prompt) => closedPrompts.contains(prompt.id));
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: openPrompts.map(
            (prompt) {
              final surveyPrompt = prompt.asOrNull<Fragment$Prompt$$SurveyPrompt>();
              if (surveyPrompt != null && !isOutdatedSurvey(surveyPrompt, completedSurveys)) {
                return PromptSurvey(prompt: surveyPrompt, onClose: () => close(surveyPrompt.id));
              }
              return const SizedBox.shrink();
            },
          ).toList(),
        );
      },
    );
  }
}
