// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_changed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LanguageChangedEventImpl _$$LanguageChangedEventImplFromJson(
        Map<String, dynamic> json) =>
    _$LanguageChangedEventImpl(
      languageFrom: json['languageFrom'] as String?,
      languageTo: json['languageTo'] as String,
      languageChangeType: json['languageChangeType'] as String,
    );

Map<String, dynamic> _$$LanguageChangedEventImplToJson(
        _$LanguageChangedEventImpl instance) =>
    <String, dynamic>{
      'languageFrom': instance.languageFrom,
      'languageTo': instance.languageTo,
      'languageChangeType': instance.languageChangeType,
    };
