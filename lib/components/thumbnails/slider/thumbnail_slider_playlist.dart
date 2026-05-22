import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'package:bccm_core/platform.dart';
import 'package:bccm_core/design_system.dart';

import '../show_thumbnail.dart';

class ThumbnailSliderPlaylist extends StatelessWidget {
  final Fragment$ItemSectionItem sectionItem;
  final Size imageSize;

  const ThumbnailSliderPlaylist({
    super.key,
    required this.sectionItem,
    required this.imageSize,
  });

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    final side = math.min(imageSize.width, imageSize.height);
    final squareSize = Size(side, side);
    return SizedBox(
      width: side,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShowThumbnail.withSize(
            imageSize: squareSize,
            sectionItem: sectionItem,
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 2),
            child: Text(
              sectionItem.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: design.textStyles.caption1.copyWith(color: design.colors.label1),
            ),
          ),
        ],
      ),
    );
  }
}
