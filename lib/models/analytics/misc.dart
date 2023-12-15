import 'package:freezed_annotation/freezed_annotation.dart';

part 'misc.freezed.dart';
part 'misc.g.dart';

@freezed
class InteractionEvent with _$InteractionEvent {
  const factory InteractionEvent({
    String? interaction, // 'play', 'pause', 'share', 'like', 'mute'
    String? pageCode, // 'shorts'
    String? contextElementType, // 'shorts'
    String? contextElementId, // e.g. uuid of the short
    Map<String, dynamic>? meta,
  }) = _InteractionEvent;

  factory InteractionEvent.fromJson(Map<String, dynamic> json) => _$InteractionEventFromJson(json);
}

@freezed
class GuideShownEvent with _$GuideShownEvent {
  const factory GuideShownEvent({
    String? guide,
    Map<String, dynamic>? meta,
  }) = _GuideShownEvent;

  factory GuideShownEvent.fromJson(Map<String, dynamic> json) => _$GuideShownEventFromJson(json);
}
