// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_result_clicked.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SectionClickedEvent _$$_SectionClickedEventFromJson(
        Map<String, dynamic> json) =>
    _$_SectionClickedEvent(
      searchText: json['searchText'] as String,
      elementPosition: json['elementPosition'] as int,
      elementType: json['elementType'] as String,
      elementId: json['elementId'] as String,
      group: json['group'] as String,
    );

Map<String, dynamic> _$$_SectionClickedEventToJson(
        _$_SectionClickedEvent instance) =>
    <String, dynamic>{
      'searchText': instance.searchText,
      'elementPosition': instance.elementPosition,
      'elementType': instance.elementType,
      'elementId': instance.elementId,
      'group': instance.group,
    };
