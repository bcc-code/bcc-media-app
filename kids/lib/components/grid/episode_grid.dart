import 'package:animations/animations.dart';
import 'package:bccm_player/bccm_player.dart';
import 'package:brunstadtv_app/api/brunstadtv.dart';
import 'package:brunstadtv_app/components/misc/custom_grid_view.dart';
import 'package:brunstadtv_app/graphql/queries/kids/show.graphql.dart';
import 'package:brunstadtv_app/helpers/extensions.dart';
import 'package:brunstadtv_app/helpers/images.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';
import 'package:brunstadtv_app/providers/inherited_data.dart';
import 'package:brunstadtv_app/providers/playback_service.dart';
import 'package:brunstadtv_app/theme/design_system/design_system.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:focusable_control_builder/focusable_control_builder.dart';
import 'package:kids/components/buttons/button.dart';
import 'package:kids/components/player/controls.dart';
import 'package:kids/components/player/player_view.dart';
import 'package:kids/helpers/transitions.dart';
import 'package:kids/router/router.gr.dart';
import 'package:kids/screens/episode.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

class EpisodeGridItem {
  final String id;
  final String title;
  final String? image;
  final int? duration;

  EpisodeGridItem({
    required this.id,
    required this.title,
    required this.image,
    required this.duration,
  });

  factory EpisodeGridItem.fromFragment(Fragment$KidsEpisodeThumbnail e) {
    return EpisodeGridItem(
      id: e.id,
      title: e.title,
      image: e.image,
      duration: e.duration,
    );
  }
}

class EpisodeGrid extends StatelessWidget {
  const EpisodeGrid({
    super.key,
    required this.items,
    required this.onTap,
  });

  final List<EpisodeGridItem> items;
  final void Function(EpisodeGridItem item) onTap;

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
        return EpisodeGridItemRenderer(
          item,
          onTap: () => onTap(item),
        );
      }).toList(),
    );
  }
}

class EpisodeGridItemRenderer extends ConsumerWidget {
  const EpisodeGridItemRenderer(
    this.item, {
    super.key,
    required this.onTap,
  });

  final EpisodeGridItem item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final design = DesignSystem.of(context);

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
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: _MorphToEpisodeScreen(
              enabled: true,
              episodeId: item.id,
              child: Center(
                child: Container(
                  height: double.infinity,
                  color: Colors.red,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      item.image != null
                          ? Stack(
                              children: [
                                Positioned.fill(
                                  child: Container(color: design.colors.separator2)
                                      .animate(onComplete: (c) => c.forward(from: 0))
                                      .shimmer(duration: 1000.ms)
                                      .callback(delay: 1000.ms, duration: 250.ms, callback: (c) => true),
                                ),
                                simpleFadeInImage(url: item.image!)
                              ],
                            )
                          : Container(color: design.colors.separator2),
                      if (item.duration != null)
                        Positioned(
                          bottom: bp.smallerThan(TABLET) ? 8 : 16,
                          left: bp.smallerThan(TABLET) ? 8 : 16,
                          child: _DurationButton(item.duration!, small: bp.smallerThan(TABLET)),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Text(
              item.title,
              style: design.textStyles.body2.copyWith(color: design.colors.label1),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class _MorphToEpisodeScreen extends StatelessWidget {
  const _MorphToEpisodeScreen({
    super.key,
    required this.child,
    required this.enabled,
    required this.episodeId,
  });

  final Widget child;
  final bool enabled;
  final String episodeId;

  @override
  Widget build(BuildContext context) {
    if (!enabled) return child;
    final small = ResponsiveBreakpoints.of(context).smallerThan(TABLET);
    final duration = 500.ms;
    return OpenContainer(
      openBuilder: (context, close) {
        final args = ModalRoute.of(context)!.settings.arguments.asOrNull<EpisodeScreenRouteArgs>();
        if (args != null) {
          return InheritedData(
            inheritedData: ContainerTransitionInfo(duration: duration),
            child: (c) => EpisodeScreen(
              id: args.id,
              cursor: args.cursor,
              shuffle: args.shuffle,
            ),
          );
        }
        return const SizedBox.shrink();
      },
      openElevation: 0,
      closedElevation: 0,
      transitionType: ContainerTransitionType.fade,
      openColor: Colors.transparent,
      openShape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      closedColor: Colors.transparent,
      closedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(small ? 16 : 16)),
      transitionDuration: duration,
      routeSettings: RouteSettings(name: EpisodeScreenRoute.page.name, arguments: EpisodeScreenRouteArgs(id: episodeId)),
      closedBuilder: (
        context,
        open,
      ) =>
          child,
    );
  }
}

class _DurationButton extends StatelessWidget {
  const _DurationButton(
    this.duration, {
    required this.small,
  });

  final int duration;
  final bool small;

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    final durationButton = Button.raw(
      color: design.colors.background1,
      activeColor: design.colors.background1,
      shadowColor: design.colors.label1.withOpacity(0.2),
      sideColor: const Color(0xFFE9ECF4),
      labelText: '${Duration(seconds: duration).inMinutes} ${S.of(context).minutesShort}',
      labelTextStyle: design.textStyles.title2,
      elevationHeight: 2,
      iconSize: 0,
      height: 40,
      paddings: const ButtonPaddings(
        fromLabelToSide: 20,
        fromLabelToSideWhenAlone: 20,
        fromIconToLabel: 20,
        fromIconToSide: 20,
        fromIconToSideWhenAlone: 20,
      ),
    );
    return IgnorePointer(
      child: small
          ? durationButton.copyWith(
              height: 28,
              labelTextStyle: design.textStyles.title3,
              paddings: const ButtonPaddings(
                fromLabelToSide: 12,
                fromLabelToSideWhenAlone: 12,
                fromIconToLabel: 12,
                fromIconToSide: 12,
                fromIconToSideWhenAlone: 12,
              ),
            )
          : durationButton,
    );
  }
}
