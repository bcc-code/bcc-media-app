// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter_clicked.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChapterClickedEventImpl _$$ChapterClickedEventImplFromJson(
        Map<String, dynamic> json) =>
    _$ChapterClickedEventImpl(
      elementType: json['elementType'] as String,
      elementId: json['elementId'] as String,
      chapterId: json['chapterId'] as String,
      chapterStart: json['chapterStart'] as int,
    );

Map<String, dynamic> _$$ChapterClickedEventImplToJson(
        _$ChapterClickedEventImpl instance) =>
    <String, dynamic>{
      'elementType': instance.elementType,
      'elementId': instance.elementId,
      'chapterId': instance.chapterId,
      'chapterStart': instance.chapterStart,
    };
