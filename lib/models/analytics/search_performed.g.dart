// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_performed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SearchPerformedEvent _$$_SearchPerformedEventFromJson(
        Map<String, dynamic> json) =>
    _$_SearchPerformedEvent(
      searchText: json['searchText'] as String,
      searchLatency: json['searchLatency'] as int,
      searchResultCount: json['searchResultCount'] as int,
    );

Map<String, dynamic> _$$_SearchPerformedEventToJson(
        _$_SearchPerformedEvent instance) =>
    <String, dynamic>{
      'searchText': instance.searchText,
      'searchLatency': instance.searchLatency,
      'searchResultCount': instance.searchResultCount,
    };
