// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'downloads.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_VideoDownloadStartedEvent _$$_VideoDownloadStartedEventFromJson(
        Map<String, dynamic> json) =>
    _$_VideoDownloadStartedEvent(
      downloadId: json['downloadId'] as String,
      episodeId: json['episodeId'] as String,
      quality: json['quality'] as String?,
      audioLanguage: json['audioLanguage'] as String?,
    );

Map<String, dynamic> _$$_VideoDownloadStartedEventToJson(
        _$_VideoDownloadStartedEvent instance) =>
    <String, dynamic>{
      'downloadId': instance.downloadId,
      'episodeId': instance.episodeId,
      'quality': instance.quality,
      'audioLanguage': instance.audioLanguage,
    };

_$_VideoDownloadRemovedEvent _$$_VideoDownloadRemovedEventFromJson(
        Map<String, dynamic> json) =>
    _$_VideoDownloadRemovedEvent(
      downloadId: json['downloadId'] as String,
      episodeId: json['episodeId'] as String?,
    );

Map<String, dynamic> _$$_VideoDownloadRemovedEventToJson(
        _$_VideoDownloadRemovedEvent instance) =>
    <String, dynamic>{
      'downloadId': instance.downloadId,
      'episodeId': instance.episodeId,
    };

_$_VideoDownloadPlayedEvent _$$_VideoDownloadPlayedEventFromJson(
        Map<String, dynamic> json) =>
    _$_VideoDownloadPlayedEvent(
      downloadId: json['downloadId'] as String,
      episodeId: json['episodeId'] as String?,
    );

Map<String, dynamic> _$$_VideoDownloadPlayedEventToJson(
        _$_VideoDownloadPlayedEvent instance) =>
    <String, dynamic>{
      'downloadId': instance.downloadId,
      'episodeId': instance.episodeId,
    };
