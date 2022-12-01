// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_changed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LanguageChangedEvent _$$_LanguageChangedEventFromJson(
        Map<String, dynamic> json) =>
    _$_LanguageChangedEvent(
      languageFrom: json['languageFrom'] as String?,
      languageTo: json['languageTo'] as String,
      languageChangeType: json['languageChangeType'] as String,
    );

Map<String, dynamic> _$$_LanguageChangedEventToJson(
        _$_LanguageChangedEvent instance) =>
    <String, dynamic>{
      'languageFrom': instance.languageFrom,
      'languageTo': instance.languageTo,
      'languageChangeType': instance.languageChangeType,
    };
