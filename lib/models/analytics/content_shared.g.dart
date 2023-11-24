// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_shared.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContentSharedEventImpl _$$ContentSharedEventImplFromJson(
        Map<String, dynamic> json) =>
    _$ContentSharedEventImpl(
      pageCode: json['pageCode'] as String,
      elementType: json['elementType'] as String,
      elementId: json['elementId'] as String,
      position: json['position'] as int?,
    );

Map<String, dynamic> _$$ContentSharedEventImplToJson(
        _$ContentSharedEventImpl instance) =>
    <String, dynamic>{
      'pageCode': instance.pageCode,
      'elementType': instance.elementType,
      'elementId': instance.elementId,
      'position': instance.position,
    };
