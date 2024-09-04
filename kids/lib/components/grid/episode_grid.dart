import 'package:bccm_player/bccm_player.dart';
import 'package:brunstadtv_app/components/misc/custom_grid_view.dart';
import 'package:bccm_core/platform.dart';
import 'package:bccm_core/bccm_core.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';
import 'package:bccm_core/design_system.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:focusable_control_builder/focusable_control_builder.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kids/components/buttons/button.dart';
import 'package:kids/components/countdown_circle.dart';
import 'package:kids/helpers/transitions.dart';
import 'package:responsive_framework/responsive_framework.dart';
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
  final void Function(EpisodeGridItem item, int index, GlobalKey morphKey) onTap;

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
        return EpisodeGridItemRenderer(item, onPressed: (morphKey) => onTap(item, index, morphKey));
      }).toList(),
    );
  }
}

class EpisodeGridItemRenderer extends HookConsumerWidget {
  const EpisodeGridItemRenderer(
    this.item, {
    super.key,
    required this.onPressed,
    this.hideTitle = false,
    this.playerController,
  });

  final EpisodeGridItem item;
  final void Function(GlobalKey) onPressed;
  final bool hideTitle;
  final BccmPlayerController? playerController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final design = DesignSystem.of(context);
    final bp = ResponsiveBreakpoints.of(context);
    final morphKey = useMemoized(() => GlobalKey(), []);
    final borderRadius = BorderRadius.circular(bp.smallerThan(TABLET) ? 16 : 24);

    onPressedLocal() {
      onPressed(morphKey);
      CustomHapticFeedback.mediumImpact();
    }

    return FocusableControlBuilder(
      cursor: SystemMouseCursors.click,
      actions: {
        ActivateIntent: CallbackAction<ActivateIntent>(onInvoke: (intent) {
          return onPressedLocal();
        }),
      },
      onPressed: onPressedLocal,
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
                            simpleFadeInImage(url: item.image!),
                            if (autoPlayCountdown != null)
                              Positioned.fill(
                                child: Stack(
                                  children: [
                                    Container(color: design.colors.label2).animate().fadeIn(
                                          duration: 500.ms,
                                          curve: Curves.easeOutExpo,
                                        ),
                                    CountdownCircle(duration: autoPlayCountdown!)
                                        .animate()
                                        .scale(
                                          duration: 1000.ms,
                                          curve: Curves.easeOutExpo,
                                        )
                                        .rotate(begin: -0.25, end: 0)
                                        .moveY(begin: 32, end: 0),
                                  ],
                                ),
                              ),
                          ],
                        )
                      else
                        Container(color: design.colors.separator2),
                      if (item.duration != null)
                        Positioned(
                          bottom: bp.smallerThan(TABLET) ? 8 : 16,
                          right: bp.smallerThan(TABLET) ? 8 : 16,
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
    ).animate().fadeIn(duration: 500.ms);
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
