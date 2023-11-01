import 'package:animations/animations.dart';
import 'package:auto_route/auto_route.dart';
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
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:focusable_control_builder/focusable_control_builder.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kids/components/buttons/button.dart';
import 'package:kids/components/player/controls.dart';
import 'package:kids/components/player/player_view.dart';
import 'package:kids/helpers/transitions.dart';
import 'package:kids/router/router.gr.dart';
import 'package:kids/screens/episode.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:universal_io/io.dart';

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
  final void Function(EpisodeGridItem item, GlobalKey morphKey) onTap;

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
          onTap: (morphKey) => onTap(item, morphKey),
        );
      }).toList(),
    );
  }
}

var currentMorphKey = GlobalKey();

class EpisodeGridItemRenderer extends HookConsumerWidget {
  const EpisodeGridItemRenderer(
    this.item, {
    super.key,
    required this.onTap,
    this.hideTitle = false,
  });

  final EpisodeGridItem item;
  final void Function(GlobalKey) onTap;
  final bool hideTitle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final design = DesignSystem.of(context);
    final bp = ResponsiveBreakpoints.of(context);
    final morphKey = useMemoized(() => GlobalKey(), []);

    void onTapLocal() {
      onTap(morphKey);
    }

    final borderRadius = BorderRadius.circular(bp.smallerThan(TABLET) ? 16 : 24);

    return FocusableControlBuilder(
      cursor: SystemMouseCursors.click,
      actions: {
        ActivateIntent: CallbackAction<ActivateIntent>(onInvoke: (intent) {
          return onTapLocal();
        }),
      },
      onPressed: onTapLocal,
      builder: (context, control) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: ClipRRect(
              borderRadius: borderRadius,
              child: MorphTransitionHost(
                key: morphKey,
                borderRadius: borderRadius,
                builder: (context) => Container(
                  color: Colors.white,
                  child: Stack(
                    children: [
                      if (item.image != null)
                        Stack(
                          children: [
                            Positioned.fill(
                              child: Animate(
                                effects: [
                                  if (!Platform.isAndroid) ShimmerEffect(duration: 1000.ms),
                                  CallbackEffect(delay: 1000.ms, duration: 250.ms, callback: (_) => true),
                                ],
                                child: Container(color: design.colors.separator2),
                              ),
                            ),
                            simpleFadeInImage(url: item.image!).animate().fadeIn(),
                          ],
                        )
                      else
                        Container(color: design.colors.separator2),
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
          if (!hideTitle)
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
