// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shorts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShortStartedEventImpl _$$ShortStartedEventImplFromJson(
        Map<String, dynamic> json) =>
    _$ShortStartedEventImpl(
      shortId: json['shortId'] as String,
      shortTitle: json['shortTitle'] as String,
      replayCount: json['replayCount'] as int,
      resumed: json['resumed'] as bool,
      positionFraction: (json['positionFraction'] as num).toDouble(),
      positionSeconds: json['positionSeconds'] as int,
    );

Map<String, dynamic> _$$ShortStartedEventImplToJson(
        _$ShortStartedEventImpl instance) =>
    <String, dynamic>{
      'shortId': instance.shortId,
      'shortTitle': instance.shortTitle,
      'replayCount': instance.replayCount,
      'resumed': instance.resumed,
      'positionFraction': instance.positionFraction,
      'positionSeconds': instance.positionSeconds,
    };

_$ShortStoppedEventImpl _$$ShortStoppedEventImplFromJson(
        Map<String, dynamic> json) =>
    _$ShortStoppedEventImpl(
      shortId: json['shortId'] as String,
      shortTitle: json['shortTitle'] as String?,
      positionFraction: (json['positionFraction'] as num).toDouble(),
      positionSeconds: json['positionSeconds'] as int,
      replayCount: json['replayCount'] as int,
    );

Map<String, dynamic> _$$ShortStoppedEventImplToJson(
        _$ShortStoppedEventImpl instance) =>
    <String, dynamic>{
      'shortId': instance.shortId,
      'shortTitle': instance.shortTitle,
      'positionFraction': instance.positionFraction,
      'positionSeconds': instance.positionSeconds,
      'replayCount': instance.replayCount,
    };
