// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sections.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SectionClickedEvent _$$_SectionClickedEventFromJson(
        Map<String, dynamic> json) =>
    _$_SectionClickedEvent(
      sectionId: json['sectionId'] as String,
      sectionName: json['sectionName'] as String?,
      sectionPosition: json['sectionPosition'] as int,
      sectionType: json['sectionType'] as String,
      elementName: json['elementName'] as String?,
      elementPosition: json['elementPosition'] as int,
      elementType: json['elementType'] as String,
      elementId: json['elementId'] as String,
      pageCode: json['pageCode'] as String?,
    );

Map<String, dynamic> _$$_SectionClickedEventToJson(
        _$_SectionClickedEvent instance) =>
    <String, dynamic>{
      'sectionId': instance.sectionId,
      'sectionName': instance.sectionName,
      'sectionPosition': instance.sectionPosition,
      'sectionType': instance.sectionType,
      'elementName': instance.elementName,
      'elementPosition': instance.elementPosition,
      'elementType': instance.elementType,
      'elementId': instance.elementId,
      'pageCode': instance.pageCode,
    };
