// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deep_link_opened.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeepLinkOpenedEventImpl _$$DeepLinkOpenedEventImplFromJson(
        Map<String, dynamic> json) =>
    _$DeepLinkOpenedEventImpl(
      url: json['url'] as String,
      source: json['source'] as String,
      campaignId: json['campaignId'] as String,
    );

Map<String, dynamic> _$$DeepLinkOpenedEventImplToJson(
        _$DeepLinkOpenedEventImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'source': instance.source,
      'campaignId': instance.campaignId,
    };
