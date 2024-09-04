import 'package:flutter/material.dart';

import 'package:bccm_core/platform.dart';

import 'misc/bordered_image_container.dart';

class ShowThumbnail extends StatelessWidget {
  final Fragment$ItemSectionItem sectionItem;
  final double imageWidth;
  final double? imageHeight;
  final double aspectRatio;

  const ShowThumbnail({
    super.key,
    required this.sectionItem,
    required this.imageWidth,
    this.imageHeight,
    this.aspectRatio = 16 / 9,
  });

  factory ShowThumbnail.withSize({
    required Fragment$ItemSectionItem sectionItem,
    required Size imageSize,
  }) {
    return ShowThumbnail(
      sectionItem: sectionItem,
      imageWidth: imageSize.width,
      imageHeight: imageSize.height,
    );
  }

  factory ShowThumbnail.withWidth({
    required Fragment$ItemSectionItem sectionItem,
    required double imageWidth,
    required double aspectRatio,
  }) {
    return ShowThumbnail(
      sectionItem: sectionItem,
      imageWidth: imageWidth,
      aspectRatio: aspectRatio,
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
              child: BorderedImageContainer(imageUrl: sectionItem.image),
            )
          : BorderedImageContainer(imageUrl: sectionItem.image),
    );
  }
}
