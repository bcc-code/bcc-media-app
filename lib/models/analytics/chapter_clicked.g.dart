// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter_clicked.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChapterClickedEvent _$$_ChapterClickedEventFromJson(
        Map<String, dynamic> json) =>
    _$_ChapterClickedEvent(
      elementType: json['elementType'] as String,
      elementId: json['elementId'] as String,
      chapterId: json['chapterId'] as String,
      chapterStart: json['chapterStart'] as int,
    );

Map<String, dynamic> _$$_ChapterClickedEventToJson(
        _$_ChapterClickedEvent instance) =>
    <String, dynamic>{
      'elementType': instance.elementType,
      'elementId': instance.elementId,
      'chapterId': instance.chapterId,
      'chapterStart': instance.chapterStart,
    };
