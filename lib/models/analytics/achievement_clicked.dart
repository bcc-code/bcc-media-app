import 'package:freezed_annotation/freezed_annotation.dart';

part 'achievement_clicked.freezed.dart';
part 'achievement_clicked.g.dart';

@freezed
class AchievementClickedEvent with _$AchievementClickedEvent {
  const factory AchievementClickedEvent({
    required int elementPosition,
    required String elementTitle,
  }) = _AchievementClickedEvent;

  factory AchievementClickedEvent.fromJson(Map<String, dynamic> json) => _$AchievementClickedEventFromJson(json);
}
