// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_closed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameClosedEventImpl _$$GameClosedEventImplFromJson(
        Map<String, dynamic> json) =>
    _$GameClosedEventImpl(
      gameId: json['gameId'] as String,
      timeSpent: json['timeSpent'] as int,
      position: json['position'] as int?,
    );

Map<String, dynamic> _$$GameClosedEventImplToJson(
        _$GameClosedEventImpl instance) =>
    <String, dynamic>{
      'gameId': instance.gameId,
      'timeSpent': instance.timeSpent,
      'position': instance.position,
    };
