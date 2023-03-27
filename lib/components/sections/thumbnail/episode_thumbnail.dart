import 'package:flutter/material.dart';

import '../../../helpers/date_time.dart';
import '../../../helpers/ui/ui_utils.dart';
import '../../../models/episode_thumbnail_data.dart';
import '../../bordered_image_container.dart';
import '../../episode_duration.dart';
import '../../watch_progress_indicator.dart';
import '../../watched_badge.dart';

class EpisodeThumbnail extends StatelessWidget {
  final EpisodeThumbnailData episode;
  final double imageWidth;
  final double? imageHeight;
  final double aspectRatio;
  final bool isLive;

  const EpisodeThumbnail({
    super.key,
    required this.episode,
    required this.imageWidth,
    this.imageHeight,
    this.aspectRatio = 16 / 9,
    this.isLive = false,
  });

  factory EpisodeThumbnail.withSize({
    required EpisodeThumbnailData episode,
    required Size imageSize,
    bool isLive = false,
  }) {
    return EpisodeThumbnail(
      episode: episode,
      imageWidth: imageSize.width,
      imageHeight: imageSize.height,
      isLive: isLive,
    );
  }

  factory EpisodeThumbnail.withWidth({
    required EpisodeThumbnailData episode,
    required double imageWidth,
    required double aspectRatio,
    bool isLive = false,
  }) {
    return EpisodeThumbnail(
      imageWidth: imageWidth,
      aspectRatio: aspectRatio,
      isLive: isLive,
      episode: episode,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      width: imageWidth,
      height: imageHeight,
      child: imageHeight == null
          ? AspectRatio(
              aspectRatio: aspectRatio,
              child: EpisodeThumbnailStack(episode: episode, isLive: isLive),
            )
          : EpisodeThumbnailStack(episode: episode, isLive: isLive),
    );
  }
}

class EpisodeThumbnailStack extends StatelessWidget {
  final EpisodeThumbnailData episode;
  final bool isLive;

  const EpisodeThumbnailStack({required this.episode, required this.isLive, super.key});

  bool get watched => episode.progress != null && episode.progress! > episode.duration * 0.9;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        episode.locked && !isLive
            ? Opacity(
                opacity: 0.5,
                child: BorderedImageContainer(imageUrl: episode.image),
              )
            : BorderedImageContainer(imageUrl: episode.image),
        if (episode.locked && !isLive)
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/icons/Wait.png'),
              ),
            ),
          ),
        if (episode.progress != null && !watched)
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(left: 4, bottom: 4, right: 4),
              child: WatchProgressIndicator(totalDuration: episode.duration, watchedDuration: episode.progress!),
            ),
          )
        else if (!episode.locked)
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 12,
              margin: const EdgeInsets.only(right: 4, bottom: 4, left: 4),
              child: Row(
                children: [
                  if (watched) const WatchedBadge(),
                  const Spacer(),
                  EpisodeDuration(duration: getFormattedDuration(episode.duration)),
                ],
              ),
            ),
          ),
        if (getFeaturedTag(publishDate: episode.publishDate, locked: episode.locked, isLive: isLive) != null)
          Positioned(
            top: -4,
            right: -4,
            child: getFeaturedTag(publishDate: episode.publishDate, locked: episode.locked, isLive: isLive)!,
          ),
      ],
    );
  }
}
