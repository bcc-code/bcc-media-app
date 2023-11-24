// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'downloads.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VideoDownloadStartedEventImpl _$$VideoDownloadStartedEventImplFromJson(
        Map<String, dynamic> json) =>
    _$VideoDownloadStartedEventImpl(
      downloadId: json['downloadId'] as String,
      episodeId: json['episodeId'] as String,
      quality: json['quality'] as String?,
      audioLanguage: json['audioLanguage'] as String?,
    );

Map<String, dynamic> _$$VideoDownloadStartedEventImplToJson(
        _$VideoDownloadStartedEventImpl instance) =>
    <String, dynamic>{
      'downloadId': instance.downloadId,
      'episodeId': instance.episodeId,
      'quality': instance.quality,
      'audioLanguage': instance.audioLanguage,
    };

_$VideoDownloadRemovedEventImpl _$$VideoDownloadRemovedEventImplFromJson(
        Map<String, dynamic> json) =>
    _$VideoDownloadRemovedEventImpl(
      downloadId: json['downloadId'] as String,
      episodeId: json['episodeId'] as String?,
    );

Map<String, dynamic> _$$VideoDownloadRemovedEventImplToJson(
        _$VideoDownloadRemovedEventImpl instance) =>
    <String, dynamic>{
      'downloadId': instance.downloadId,
      'episodeId': instance.episodeId,
    };

_$VideoDownloadPlayedEventImpl _$$VideoDownloadPlayedEventImplFromJson(
        Map<String, dynamic> json) =>
    _$VideoDownloadPlayedEventImpl(
      downloadId: json['downloadId'] as String,
      episodeId: json['episodeId'] as String?,
    );

Map<String, dynamic> _$$VideoDownloadPlayedEventImplToJson(
        _$VideoDownloadPlayedEventImpl instance) =>
    <String, dynamic>{
      'downloadId': instance.downloadId,
      'episodeId': instance.episodeId,
    };
