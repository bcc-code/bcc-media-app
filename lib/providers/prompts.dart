import 'dart:async';
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/brunstadtv.dart';
import '../graphql/queries/prompts.graphql.dart';
import '../helpers/constants.dart';
import '../models/survey.dart';

final promptsProvider = StreamProvider<List<Fragment$Prompt>>((ref) async* {
  yield await ref.read(apiProvider).getPrompts();
});

final completedSurveysProvider = AsyncNotifierProvider<CompletedSurveysNotifier, List<CompletedSurvey>>(() => CompletedSurveysNotifier());

class CompletedSurveysNotifier extends AsyncNotifier<List<CompletedSurvey>> {
  @override
  FutureOr<List<CompletedSurvey>> build() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    final completedSurveysStr = sharedPrefs.getString(PrefKeys.completedSurveys);
    if (completedSurveysStr == null) {
      return [];
    }
    final completedSurveys = CompletedSurveys.fromJson(jsonDecode(completedSurveysStr)).completedSurveys;
    final relevantCompletedSurveys = completedSurveys.where((survey) => survey.expiry.isAfter(DateTime.now())).toList();
    if (completedSurveys.length != relevantCompletedSurveys.length) {
      await updateSharedPreference(relevantCompletedSurveys);
    }
    return relevantCompletedSurveys;
  }

  Future updateSharedPreference(List<CompletedSurvey> completedSurveys) async {
    final sharedPrefs = await SharedPreferences.getInstance();
    final newCompletedSurveysStr = jsonEncode(CompletedSurveys(completedSurveys).toJson());
    await sharedPrefs.setString(PrefKeys.completedSurveys, newCompletedSurveysStr);
  }

  Future addSurvey(String surveyId) async {
    final List<CompletedSurvey> newCompletedSurveys = [
      ...(state.value ?? []),
      CompletedSurvey(id: surveyId, expiry: DateTime.now().add(const Duration(days: 60))),
    ];
    await updateSharedPreference(newCompletedSurveys);
    state = AsyncValue.data(newCompletedSurveys);
  }
}
