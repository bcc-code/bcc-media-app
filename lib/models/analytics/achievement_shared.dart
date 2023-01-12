import 'package:freezed_annotation/freezed_annotation.dart';

part 'achievement_shared.freezed.dart';
part 'achievement_shared.g.dart';

@freezed
class AchievementSharedEvent with _$AchievementSharedEvent {
  const factory AchievementSharedEvent({required String elementTitle}) = _AchievementSharedEvent;

  factory AchievementSharedEvent.fromJson(Map<String, dynamic> json) => _$AchievementSharedEventFromJson(json);
}
