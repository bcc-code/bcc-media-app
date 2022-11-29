import 'package:freezed_annotation/freezed_annotation.dart';

part 'content_shared.freezed.dart';
part 'content_shared.g.dart';

@freezed
class ContentSharedEvent with _$ContentSharedEvent {
  const factory ContentSharedEvent({
    required String pageCode,
    required String elementType,
    required String elementId,
    int? position,
  }) = _ContentSharedEvent;

  factory ContentSharedEvent.fromJson(Map<String, dynamic> json) => _$ContentSharedEventFromJson(json);
}
