// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CompletedSurveys _$CompletedSurveysFromJson(Map<String, dynamic> json) =>
    _CompletedSurveys(
      (json['completedSurveys'] as List<dynamic>)
          .map((e) => CompletedSurvey.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CompletedSurveysToJson(_CompletedSurveys instance) =>
    <String, dynamic>{'completedSurveys': instance.completedSurveys};

_CompletedSurvey _$CompletedSurveyFromJson(Map<String, dynamic> json) =>
    _CompletedSurvey(
      id: json['id'] as String,
      expiry: DateTime.parse(json['expiry'] as String),
    );

Map<String, dynamic> _$CompletedSurveyToJson(_CompletedSurvey instance) =>
    <String, dynamic>{
      'id': instance.id,
      'expiry': instance.expiry.toIso8601String(),
    };
