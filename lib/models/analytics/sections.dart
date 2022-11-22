import 'package:freezed_annotation/freezed_annotation.dart';

part 'sections.freezed.dart';
part 'sections.g.dart';

@freezed
class SectionClickedEvent with _$SectionClickedEvent {
  const factory SectionClickedEvent({
    required String sectionId,
    String? sectionName,
    required int sectionPosition,
    required String sectionType,
    String? elementName,
    required int elementPosition,
    required String elementType,
    required String elementId,
    String? pageCode,
  }) = _SectionClickedEvent;

  factory SectionClickedEvent.fromJson(Map<String, dynamic> json) => _$SectionClickedEventFromJson(json);
}

@freezed
class SectionAnalytics with _$SectionAnalytics {
  const factory SectionAnalytics({
    String? pageCode,
    required String id,
    String? name,
    required int position,
    required String type,
  }) = _SectionAnalytics;
}

@freezed
class SectionItemAnalytics with _$SectionItemAnalytics {
  const factory SectionItemAnalytics({
    required int position,
    required String type,
    required String id,
    String? name,
  }) = _SectionItemAnalytics;
}
