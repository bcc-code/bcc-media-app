import 'package:auto_route/auto_route.dart';
import 'package:bccm_core/bccm_core.dart';
import 'package:bccm_core/platform.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kids/components/grid/episode_grid.dart';
import 'package:kids/router/router.gr.dart';
import 'package:responsive_framework/responsive_framework.dart';

class DefaultGridSection extends HookConsumerWidget {
  final Fragment$Section$$DefaultGridSection data;

  const DefaultGridSection(this.data, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bp = ResponsiveBreakpoints.of(context);
    final safePadding = MediaQuery.of(context).padding;
    final double basePadding = bp.smallerThan(TABLET) ? 20 : 48;

    final episodeItems = useMemoized(() {
      return data.items.items
          .map((item) => EpisodeGridItem(
                id: item.id,
                title: item.title,
                image: item.image,
                duration: item.item.asOrNull<Fragment$GridSectionItem$item$$Episode>()?.duration,
              ))
          .toList();
    });

    return Padding(
      padding: EdgeInsets.only(
        left: safePadding.left + basePadding,
        right: safePadding.right + basePadding,
      ),
      child: EpisodeGrid(
          items: episodeItems,
          onTap: (episode, index, key) {
            if (!context.mounted) return;
            context.router.push(EpisodeScreenRoute(id: episode.id));
            CustomHapticFeedback.mediumImpact();
          }),
    );
  }
}
