// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_shared.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ContentSharedEvent _$$_ContentSharedEventFromJson(
        Map<String, dynamic> json) =>
    _$_ContentSharedEvent(
      pageCode: json['pageCode'] as String,
      elementType: json['elementType'] as String,
      elementId: json['elementId'] as String,
      position: json['position'] as int?,
    );

Map<String, dynamic> _$$_ContentSharedEventToJson(
        _$_ContentSharedEvent instance) =>
    <String, dynamic>{
      'pageCode': instance.pageCode,
      'elementType': instance.elementType,
      'elementId': instance.elementId,
      'position': instance.position,
    };
