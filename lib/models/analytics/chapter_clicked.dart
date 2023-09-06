import 'package:freezed_annotation/freezed_annotation.dart';

part 'chapter_clicked.freezed.dart';
part 'chapter_clicked.g.dart';

@freezed
class ChapterClickedEvent with _$ChapterClickedEvent {
  const factory ChapterClickedEvent({
    required String elementType,
    required String elementId,
    required String chapterId,
    required int chapterStart,
  }) = _ChapterClickedEvent;

  factory ChapterClickedEvent.fromJson(Map<String, dynamic> json) => _$ChapterClickedEventFromJson(json);
}
