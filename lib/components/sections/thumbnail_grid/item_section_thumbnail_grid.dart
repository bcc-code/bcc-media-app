import 'package:flutter/material.dart';

import '../../../graphql/queries/page.graphql.dart';
import 'thumbnail_grid.dart';

class ItemSectionThumbnailGrid extends StatelessWidget {
  final Fragment$GridSection data;
  final double aspectRatio;
  final bool showSecondaryTitle;

  const ItemSectionThumbnailGrid({
    required this.data,
    required this.aspectRatio,
    required this.showSecondaryTitle,
    super.key,
  });

  factory ItemSectionThumbnailGrid.fromDefaultGridSection(Fragment$Section$$DefaultGridSection data) {
    return ItemSectionThumbnailGrid(
      data: data,
      showSecondaryTitle: data.metadata?.secondaryTitles ?? true,
      aspectRatio: 16 / 9,
    );
  }

  factory ItemSectionThumbnailGrid.fromPosterGridSection(Fragment$Section$$PosterGridSection data) {
    return ItemSectionThumbnailGrid(
      data: data,
      showSecondaryTitle: data.metadata?.secondaryTitles ?? true,
      aspectRatio: 0.67,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: ThumbnailGrid(
        gridSize: data.gridSize,
        sectionItems: data.items.items,
        showSecondaryTitle: showSecondaryTitle,
      ),
    );
  }
}
