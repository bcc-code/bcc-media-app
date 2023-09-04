import 'package:flutter/material.dart';

import '../../graphql/queries/page.graphql.dart';

import '../../theme/design_system/design_system.dart';
import 'misc/bordered_image_container.dart';
import '../badges/feature_badge.dart';

class ShowThumbnail extends StatelessWidget {
  final Fragment$ItemSectionItem sectionItem;
  final bool hasNewEpisodes;
  final double imageWidth;
  final double? imageHeight;
  final double aspectRatio;

  const ShowThumbnail({
    super.key,
    required this.sectionItem,
    required this.imageWidth,
    this.imageHeight,
    this.aspectRatio = 16 / 9,
    required this.hasNewEpisodes,
  });

  factory ShowThumbnail.withSize({
    required Fragment$ItemSectionItem sectionItem,
    required Size imageSize,
    bool hasNewEpisodes = false,
  }) {
    return ShowThumbnail(
      sectionItem: sectionItem,
      imageWidth: imageSize.width,
      imageHeight: imageSize.height,
      hasNewEpisodes: hasNewEpisodes,
    );
  }

  factory ShowThumbnail.withWidth({
    required Fragment$ItemSectionItem sectionItem,
    required double imageWidth,
    required double aspectRatio,
    bool hasNewEpisodes = false,
  }) {
    return ShowThumbnail(
      sectionItem: sectionItem,
      imageWidth: imageWidth,
      aspectRatio: aspectRatio,
      hasNewEpisodes: hasNewEpisodes,
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
              child: ShowThumbnailStack(sectionItem: sectionItem, hasNewEpisodes: hasNewEpisodes),
            )
          : ShowThumbnailStack(sectionItem: sectionItem, hasNewEpisodes: hasNewEpisodes),
    );
  }
}

class ShowThumbnailStack extends StatelessWidget {
  final Fragment$ItemSectionItem sectionItem;
  final bool hasNewEpisodes;

  const ShowThumbnailStack({
    required this.sectionItem,
    required this.hasNewEpisodes,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        BorderedImageContainer(imageUrl: sectionItem.image),
        if (hasNewEpisodes)
          Positioned(
            top: -4,
            right: -4,
            child: FeatureBadge(
              label: 'New Episodes',
              color: DesignSystem.of(context).colors.tint2,
            ),
          ),
      ],
    );
  }
}
