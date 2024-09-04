// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CompletedSurveysImpl _$$CompletedSurveysImplFromJson(
        Map<String, dynamic> json) =>
    _$CompletedSurveysImpl(
      (json['completedSurveys'] as List<dynamic>)
          .map((e) => CompletedSurvey.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CompletedSurveysImplToJson(
        _$CompletedSurveysImpl instance) =>
    <String, dynamic>{
      'completedSurveys': instance.completedSurveys,
    };

_$CompletedSurveyImpl _$$CompletedSurveyImplFromJson(
        Map<String, dynamic> json) =>
    _$CompletedSurveyImpl(
      id: json['id'] as String,
      expiry: DateTime.parse(json['expiry'] as String),
    );

Map<String, dynamic> _$$CompletedSurveyImplToJson(
        _$CompletedSurveyImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'expiry': instance.expiry.toIso8601String(),
    };
