import 'package:brunstadtv_app/components/misc/custom_grid_view.dart';
import 'package:brunstadtv_app/graphql/queries/episode.graphql.dart';
import 'package:brunstadtv_app/graphql/queries/kids/show.graphql.dart';
import 'package:brunstadtv_app/helpers/images.dart';
import 'package:brunstadtv_app/theme/design_system/design_system.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class EpisodeGrid extends StatelessWidget {
  const EpisodeGrid({super.key, required this.items});

  final List<Query$GetEpisodesForShow$show$seasons$items$episodes$items> items;

  @override
  Widget build(BuildContext context) {
    return CustomGridView(
      shrinkWrap: true,
      columnCount: 3,
      verticalSpacing: 24,
      horizontalSpacing: 16,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      children: items.mapIndexed((index, item) {
        return EpisodeGridItem(item);
      }).toList(),
    );
  }
}

class EpisodeGridItem extends StatelessWidget {
  const EpisodeGridItem(this.item, {super.key});

  final Query$GetEpisodesForShow$show$seasons$items$episodes$items item;

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Container(child: item.image != null ? simpleFadeInImage(url: item.image!) : null),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Text(
            item.title,
            style: design.textStyles.body2.copyWith(color: design.colors.label1),
          ),
        ),
      ],
    );
  }
}
