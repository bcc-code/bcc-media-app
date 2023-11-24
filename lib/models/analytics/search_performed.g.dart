// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_performed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SearchPerformedEventImpl _$$SearchPerformedEventImplFromJson(
        Map<String, dynamic> json) =>
    _$SearchPerformedEventImpl(
      searchText: json['searchText'] as String,
      searchLatency: json['searchLatency'] as int,
      searchResultCount: json['searchResultCount'] as int,
    );

Map<String, dynamic> _$$SearchPerformedEventImplToJson(
        _$SearchPerformedEventImpl instance) =>
    <String, dynamic>{
      'searchText': instance.searchText,
      'searchLatency': instance.searchLatency,
      'searchResultCount': instance.searchResultCount,
    };
