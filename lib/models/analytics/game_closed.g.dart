// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_closed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GameClosedEvent _$$_GameClosedEventFromJson(Map<String, dynamic> json) =>
    _$_GameClosedEvent(
      gameId: json['gameId'] as String,
      timeSpent: json['timeSpent'] as int,
      position: json['position'] as int?,
    );

Map<String, dynamic> _$$_GameClosedEventToJson(_$_GameClosedEvent instance) =>
    <String, dynamic>{
      'gameId': instance.gameId,
      'timeSpent': instance.timeSpent,
      'position': instance.position,
    };
