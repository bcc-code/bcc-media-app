// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_result_clicked.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SectionClickedEventImpl _$$SectionClickedEventImplFromJson(
        Map<String, dynamic> json) =>
    _$SectionClickedEventImpl(
      searchText: json['searchText'] as String,
      elementPosition: json['elementPosition'] as int,
      elementType: json['elementType'] as String,
      elementId: json['elementId'] as String,
      group: json['group'] as String,
    );

Map<String, dynamic> _$$SectionClickedEventImplToJson(
        _$SectionClickedEventImpl instance) =>
    <String, dynamic>{
      'searchText': instance.searchText,
      'elementPosition': instance.elementPosition,
      'elementType': instance.elementType,
      'elementId': instance.elementId,
      'group': instance.group,
    };
