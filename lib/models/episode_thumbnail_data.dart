import 'package:bccm_core/platform.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'episode_thumbnail_data.freezed.dart';

@freezed
class EpisodeThumbnailData with _$EpisodeThumbnailData {
  const factory EpisodeThumbnailData({
    required String title,
    int? duration,
    String? image,
    required bool locked,
    int? progress,
    String? publishDate,
    int? number,
    String? showTitle,
    int? seasonNumber,
  }) = _EpisodeThumbnailData;

  factory EpisodeThumbnailData.fromFragment(Fragment$EpisodeThumbnail e) {
    return EpisodeThumbnailData(
      title: e.title,
      image: e.image,
      duration: e.duration,
      locked: e.locked,
      progress: e.progress,
      publishDate: e.publishDate,
      number: e.number,
      seasonNumber: e.season?.number,
      showTitle: e.season?.$show.title,
    );
  }
}
