import 'package:brunstadtv_app/graphql/queries/page.graphql.dart';
import 'package:brunstadtv_app/helpers/extensions.dart';
import 'package:brunstadtv_app/models/analytics/sections.dart';
import 'package:brunstadtv_app/providers/inherited_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:kids/components/thumbnails/posters/playlist_poster_large.dart';
import 'package:kids/components/thumbnails/posters/poster_large.dart';
import 'package:kids/helpers/router_utils.dart';
import 'package:responsive_framework/responsive_framework.dart';

class PosterSection extends StatelessWidget {
  final Fragment$Section$$PosterSection data;

  const PosterSection(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    final bp = ResponsiveBreakpoints.of(context);
    final double sectionSpacing = bp.smallerThan(TABLET) ? 20 : 28;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: data.items.items
          .asMap()
          .entries
          .map(
            (kv) {
              final item = kv.value;
              return SizedBox(
                child: Padding(
                  padding: kv.key == data.items.items.length - 1 ? EdgeInsets.zero : EdgeInsets.only(right: sectionSpacing),
                  child: InheritedData<SectionItemAnalytics>(
                    inheritedData: SectionItemAnalytics(position: kv.key, id: item.id, type: item.item.$__typename, name: item.title),
                    child: (context) {
                      final playlistItem = item.item.asOrNull<Fragment$Section$$PosterSection$items$items$item$$Playlist>();
                      if (playlistItem != null) {
                        return PlaylistPosterLarge.fromItem(
                          item: playlistItem,
                          onPressed: () => handleSectionItemClick(context, item.item),
                        );
                      }
                      return PosterLarge(
                        image: item.image,
                        onPressed: () => handleSectionItemClick(context, item.item),
                      );
                    },
                  ),
                ),
              );
            },
          )
          .toList()
          .animate(interval: 50.ms)
          .slideX(begin: 1, curve: Curves.easeOutExpo, duration: 2000.ms)
          .scale(begin: Offset(0.8, 0.8))
          .rotate(begin: 0.03)
          .fadeIn(),
    );
  }
}
