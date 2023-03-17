import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api/brunstadtv.dart';
import '../graphql/queries/prompts.graphql.dart';
import '../models/survey.dart';

final promptsProvider = StreamProvider<List<Fragment$Prompt>>((ref) async* {
  yield await ref.read(apiProvider).getPrompts();
});

class CompletedSurveysNotifier extends StateNotifier<List<CompletedSurvey>> {
  CompletedSurveysNotifier() : super([]);

  void addSurvey(String surveyId) {
    state = [
      ...state,
      CompletedSurvey(id: surveyId, completionTime: DateTime.now()),
    ];
  }

  void removeSurvey(String surveyId) {
    state = state.where((survey) => survey.id != surveyId).toList();
  }
}

final completedSurveysProvider = StateNotifierProvider<CompletedSurveysNotifier, List<CompletedSurvey>>((ref) => CompletedSurveysNotifier());
