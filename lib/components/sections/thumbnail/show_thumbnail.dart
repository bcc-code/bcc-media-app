import 'package:flutter/material.dart';

import '../../../graphql/queries/page.graphql.dart';

import '../../../theme/bccm_colors.dart';
import '../../bordered_image_container.dart';
import '../../feature_badge.dart';

class ShowThumbnail extends StatelessWidget {
  const ShowThumbnail({
    super.key,
    required this.sectionItem,
    required this.imageSize,
    required this.hasNewEpisodes,
  });

  final Fragment$ItemSectionItem sectionItem;
  final Size imageSize;
  final bool hasNewEpisodes;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      width: imageSize.width,
      height: imageSize.height,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          BorderedImageContainer(imageUrl: sectionItem.image),
          if (hasNewEpisodes)
            const Positioned(
              top: -4,
              right: -4,
              child: FeatureBadge(
                label: 'New Episodes',
                color: BccmColors.tint2,
              ),
            ),
        ],
      ),
    );
  }
}
