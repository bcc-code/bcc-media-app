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
}
