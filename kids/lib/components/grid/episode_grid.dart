import 'package:bccm_player/bccm_player.dart';
import 'package:brunstadtv_app/api/brunstadtv.dart';
import 'package:brunstadtv_app/components/misc/custom_grid_view.dart';
import 'package:brunstadtv_app/graphql/queries/kids/show.graphql.dart';
import 'package:brunstadtv_app/helpers/images.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';
import 'package:brunstadtv_app/providers/playback_service.dart';
import 'package:brunstadtv_app/theme/design_system/design_system.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:focusable_control_builder/focusable_control_builder.dart';
import 'package:kids/components/buttons/button.dart';
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
        BccmPlayerController.primary.stop(reset: true);
      });
      return ref.read(playbackServiceProvider).playEpisode(
            playerId: BccmPlayerController.primary.value.playerId,
            autoplay: true,
            episode: ep,
          );
    }

    final bp = ResponsiveBreakpoints.of(context);

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
          Stack(
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Container(child: item.image != null ? simpleFadeInImage(url: item.image!) : null),
                ),
              ),
              Positioned(
                bottom: bp.smallerThan(TABLET) ? 8 : 16,
                left: bp.smallerThan(TABLET) ? 8 : 16,
                child: Button.raw(
                  onPressed: onTap,
                  color: design.colors.background1,
                  activeColor: design.colors.background1,
                  shadowColor: design.colors.label1.withOpacity(0.2),
                  sideColor: const Color(0xFFE9ECF4),
                  labelText: '${Duration(seconds: item.duration).inMinutes} ${S.of(context).minutesShort}',
                  labelTextStyle: design.textStyles.title2,
                  elevationHeight: 2,
                  iconSize: 0,
                  height: 2,
                  paddings: const ButtonPaddings(
                    fromLabelToSide: 20,
                    fromLabelToSideWhenAlone: 20,
                    fromIconToLabel: 20,
                    fromIconToSide: 20,
                    fromIconToSideWhenAlone: 20,
                  ),
                ).copyWith(
                  height: bp.smallerThan(TABLET) ? 28 : 40,
                  labelTextStyle: design.textStyles.title3,
                  paddings: const ButtonPaddings(
                    fromLabelToSide: 12,
                    fromLabelToSideWhenAlone: 12,
                    fromIconToLabel: 12,
                    fromIconToSide: 12,
                    fromIconToSideWhenAlone: 12,
                  ),
                ),
              ),
            ],
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
