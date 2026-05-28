import 'package:flutter/material.dart';

import 'package:bccm_core/platform.dart';
import 'package:bccm_core/design_system.dart';

import '../show_thumbnail.dart';

class ThumbnailGridPlaylist extends StatelessWidget {
  final Fragment$GridSectionItem sectionItem;

  const ThumbnailGridPlaylist({
    super.key,
    required this.sectionItem,
  });

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShowThumbnail.withWidth(
          sectionItem: sectionItem,
          imageWidth: double.infinity,
          aspectRatio: 1,
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
    );
  }
}
