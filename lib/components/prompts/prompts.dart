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

  @override
  void initState() {
    super.initState();
    CompletedSurveys parsed = CompletedSurveys.fromJson(jsonDecode('{"completedSurveys": [{"id": "1", "completionTime": "${DateTime.now()}"}]}'));
    print(parsed);
  }

  void close(String promptId) {
    setState(() => closedPrompts.add(promptId));
  }

  @override
  Widget build(BuildContext context) {
    final prompts = ref.watch(promptsProvider);

    return prompts.when(
      error: (error, stackTrace) {
        FirebaseCrashlytics.instance.recordError(error, stackTrace);
        return const SizedBox.shrink();
      },
      loading: () => const SizedBox.shrink(),
      data: (promptItems) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: promptItems.whereNot((prompt) => closedPrompts.contains(prompt.id)).map(
            (prompt) {
              final surveyPrompt = prompt.asOrNull<Fragment$Prompt$$SurveyPrompt>();
              if (surveyPrompt != null) {
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
