// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sections.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SectionClickedEventImpl _$$SectionClickedEventImplFromJson(
        Map<String, dynamic> json) =>
    _$SectionClickedEventImpl(
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

Map<String, dynamic> _$$SectionClickedEventImplToJson(
        _$SectionClickedEventImpl instance) =>
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
