// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CompletedSurveys _$$_CompletedSurveysFromJson(Map<String, dynamic> json) =>
    _$_CompletedSurveys(
      (json['completedSurveys'] as List<dynamic>)
          .map((e) => CompletedSurvey.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_CompletedSurveysToJson(_$_CompletedSurveys instance) =>
    <String, dynamic>{
      'completedSurveys': instance.completedSurveys,
    };

_$_CompletedSurvey _$$_CompletedSurveyFromJson(Map<String, dynamic> json) =>
    _$_CompletedSurvey(
      id: json['id'] as String,
      expiry: DateTime.parse(json['expiry'] as String),
    );

Map<String, dynamic> _$$_CompletedSurveyToJson(_$_CompletedSurvey instance) =>
    <String, dynamic>{
      'id': instance.id,
      'expiry': instance.expiry.toIso8601String(),
    };
