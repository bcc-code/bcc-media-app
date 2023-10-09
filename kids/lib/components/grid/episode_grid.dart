import 'package:bccm_player/bccm_player.dart';
import 'package:brunstadtv_app/api/brunstadtv.dart';
import 'package:brunstadtv_app/components/misc/custom_grid_view.dart';
import 'package:brunstadtv_app/graphql/queries/episode.graphql.dart';
import 'package:brunstadtv_app/graphql/queries/kids/show.graphql.dart';
import 'package:brunstadtv_app/graphql/schema/schema.graphql.dart';
import 'package:brunstadtv_app/helpers/images.dart';
import 'package:brunstadtv_app/providers/playback_service.dart';
import 'package:brunstadtv_app/theme/design_system/design_system.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:focusable_control_builder/focusable_control_builder.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

class EpisodeGrid extends StatelessWidget {
  const EpisodeGrid({super.key, required this.items});

  final List<Query$GetEpisodesForShow$show$seasons$items$episodes$items> items;

  @override
  Widget build(BuildContext context) {
    final bp = ResponsiveBreakpoints.of(context);
    return CustomGridView(
      shrinkWrap: true,
      columnCount: 3,
      verticalSpacing: 24,
      horizontalSpacing: bp.smallerThan(TABLET) ? 16 : 24,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      children: items.mapIndexed((index, item) {
        return EpisodeGridItem(item);
      }).toList(),
    );
  }
}

class EpisodeGridItem extends ConsumerWidget {
  const EpisodeGridItem(this.item, {super.key});

  final Query$GetEpisodesForShow$show$seasons$items$episodes$items item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final design = DesignSystem.of(context);
    void onTap() async {
      final ep = await ref.read(apiProvider).fetchEpisode(item.id);
      if (ep == null) return;
      if (!context.mounted) return;
      ref
          .read(playbackServiceProvider)
          .openFullscreen(
            context,
            config: BccmPlayerViewConfig(
              deviceOrientationsFullscreen: (vc) => [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight],
              deviceOrientationsNormal: (vc) => [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight],
            ),
          )
          .then((_) {
        if (BccmPlayerController.primary.value.currentMediaItem?.isOffline == true) {
          BccmPlayerController.primary.stop(reset: false);
        }
      });
      return ref.read(playbackServiceProvider).playEpisode(playerId: BccmPlayerController.primary.value.playerId, episode: ep);
    }

    return FocusableControlBuilder(
      cursor: SystemMouseCursors.click,
      actions: {
        ActivateIntent: CallbackAction<ActivateIntent>(onInvoke: (intent) {
          return onTap();
        }),
      },
      onPressed: onTap,
      builder: (context, control) => Column(
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
      ),
    );
  }
}
