import 'package:freezed_annotation/freezed_annotation.dart';

part 'deep_link_opened.freezed.dart';
part 'deep_link_opened.g.dart';

@freezed
class DeepLinkOpenedEvent with _$DeepLinkOpenedEvent {
  const factory DeepLinkOpenedEvent({
    required String url,
    required String source,
    required String campaignId,
  }) = _DeepLinkOpenedEvent;

  factory DeepLinkOpenedEvent.fromJson(Map<String, dynamic> json) => _$DeepLinkOpenedEventFromJson(json);
}
