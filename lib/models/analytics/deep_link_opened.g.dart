// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deep_link_opened.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DeepLinkOpenedEvent _$$_DeepLinkOpenedEventFromJson(
        Map<String, dynamic> json) =>
    _$_DeepLinkOpenedEvent(
      url: json['url'] as String,
      source: json['source'] as String,
      campaignId: json['campaignId'] as String,
    );

Map<String, dynamic> _$$_DeepLinkOpenedEventToJson(
        _$_DeepLinkOpenedEvent instance) =>
    <String, dynamic>{
      'url': instance.url,
      'source': instance.source,
      'campaignId': instance.campaignId,
    };
