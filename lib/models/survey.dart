import 'package:freezed_annotation/freezed_annotation.dart';

part 'survey.freezed.dart';
part 'survey.g.dart';

@freezed
class CompletedSurveys with _$CompletedSurveys {
  const factory CompletedSurveys(List<CompletedSurvey> completedSurveys) = _CompletedSurveys;

  factory CompletedSurveys.fromJson(Map<String, dynamic> json) => _$CompletedSurveysFromJson(json);
}

@freezed
class CompletedSurvey with _$CompletedSurvey {
  const factory CompletedSurvey({
    required String id,
    required DateTime completionTime,
  }) = _CompletedSurvey;

  factory CompletedSurvey.fromJson(Map<String, dynamic> json) => _$CompletedSurveyFromJson(json);
}
