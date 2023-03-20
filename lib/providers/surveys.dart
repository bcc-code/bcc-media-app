import 'dart:async';
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helpers/constants.dart';
import '../models/survey.dart';

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

  Future addSurvey(String surveyId) async {
    final List<CompletedSurvey> completedSurveys = [
      ...(state.valueOrNull ?? []),
      CompletedSurvey(id: surveyId, expiry: DateTime.now().add(const Duration(days: 60))),
    ];
    state = AsyncValue.data(completedSurveys);
    await updateSharedPreference(completedSurveys);
  }

  Future updateSharedPreference(List<CompletedSurvey> completedSurveys) async {
    final sharedPrefs = await SharedPreferences.getInstance();
    final newCompletedSurveysStr = jsonEncode(CompletedSurveys(completedSurveys).toJson());
    await sharedPrefs.setString(PrefKeys.completedSurveys, newCompletedSurveysStr);
  }
}
