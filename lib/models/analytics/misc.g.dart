// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'misc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InteractionEventImpl _$$InteractionEventImplFromJson(
        Map<String, dynamic> json) =>
    _$InteractionEventImpl(
      interaction: json['interaction'] as String?,
      pageCode: json['pageCode'] as String?,
      contextElementType: json['contextElementType'] as String?,
      contextElementId: json['contextElementId'] as String?,
      meta: json['meta'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$InteractionEventImplToJson(
        _$InteractionEventImpl instance) =>
    <String, dynamic>{
      'interaction': instance.interaction,
      'pageCode': instance.pageCode,
      'contextElementType': instance.contextElementType,
      'contextElementId': instance.contextElementId,
      'meta': instance.meta,
    };
