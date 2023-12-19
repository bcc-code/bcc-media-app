import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:bccm_core/platform.dart';
import '../../../thumbnails/grid/thumbnail_grid.dart';

class ItemSectionThumbnailGrid extends StatelessWidget {
  final Fragment$GridSection data;
  final double aspectRatio;
  final bool showSecondaryTitle;
  final String? collectionId;

  const ItemSectionThumbnailGrid({
    required this.data,
    required this.aspectRatio,
    required this.showSecondaryTitle,
    required this.collectionId,
    super.key,
  });

  factory ItemSectionThumbnailGrid.fromDefaultGridSection(Fragment$Section$$DefaultGridSection data) {
    return ItemSectionThumbnailGrid(
      data: data,
      showSecondaryTitle: data.metadata?.secondaryTitles ?? true,
      aspectRatio: 16 / 9,
      collectionId: data.metadata?.collectionId,
    );
  }

  factory ItemSectionThumbnailGrid.fromPosterGridSection(Fragment$Section$$PosterGridSection data) {
    return ItemSectionThumbnailGrid(
      data: data,
      showSecondaryTitle: data.metadata?.secondaryTitles ?? true,
      aspectRatio: 0.67,
      collectionId: data.metadata?.collectionId,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: kIsWeb ? 80 : 16),
      child: ThumbnailGrid(
        gridSize: data.gridSize,
        aspectRatio: aspectRatio,
        sectionItems: data.items.items,
        showSecondaryTitle: showSecondaryTitle,
        collectionId: collectionId,
      ),
    );
  }
}
