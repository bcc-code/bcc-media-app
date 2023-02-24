import 'package:freezed_annotation/freezed_annotation.dart';

part 'episode_thumbnail_data.freezed.dart';

@freezed
class EpisodeThumbnailData with _$EpisodeThumbnailData {
  const factory EpisodeThumbnailData({
    required int duration,
    String? image,
    required bool locked,
    int? progress,
    String? publishDate,
  }) = _EpisodeThumbnailData;
}
