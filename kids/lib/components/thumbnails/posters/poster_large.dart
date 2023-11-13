import 'dart:math';

import 'package:animations/animations.dart';
import 'package:brunstadtv_app/components/status/loading_indicator.dart';
import 'package:brunstadtv_app/helpers/haptic_feedback.dart';
import 'package:brunstadtv_app/helpers/images.dart';
import 'package:brunstadtv_app/helpers/misc.dart';
import 'package:brunstadtv_app/theme/design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kids/helpers/animation.dart';
import 'package:kids/helpers/svg_icons.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:universal_io/io.dart';

class PosterLarge extends HookWidget {
  const PosterLarge({
    super.key,
    required this.image,
    required this.hasNewEpisodes,
    this.onPressed,
    this.onPlayPressed,
    this.openBuilder,
    this.routeSettings,
  });

  final VoidCallback? onPressed;
  final Future Function()? onPlayPressed;
  final String? image;
  final bool hasNewEpisodes;
  final OpenContainerBuilder<Object?>? openBuilder;
  final RouteSettings? routeSettings;

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    final navigationFuture = useState<Future<void>?>(null);
    final bp = ResponsiveBreakpoints.of(context);
    final isSmall = bp.smallerThan(TABLET);

    return OpenContainer(
      openBuilder: openBuilder ?? (context, close) => const SizedBox.shrink(),
      routeSettings: routeSettings,
      closedColor: Colors.transparent,
      openElevation: 0,
      closedElevation: 0,
      tappable: false,
      transitionType: ContainerTransitionType.fadeThrough,
      openColor: design.colors.background1,
      openShape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      closedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(isSmall ? 20 : 40)),
      transitionDuration: const Duration(milliseconds: 500),
      closedBuilder: (
        context,
        open,
      ) =>
          AspectRatio(
        aspectRatio: 392 / 582,
        child: Stack(
          children: [
            GestureDetector(
              onTap: () {
                onPressed?.call();
                if (openBuilder != null) open();
                CustomHapticFeedback.mediumImpact();
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(isSmall ? 20 : 40),
                child: image == null
                    ? Container(color: design.colors.separator2)
                    : Stack(
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
                          hasNewEpisodes
                              ? Container(
                                  color: design.colors.background2,
                                  child: Transform.translate(
                                    offset: bp.smallerThan(TABLET) ? const Offset(0, -20) : const Offset(0, 0),
                                    child: SimpleShadow(
                                      opacity: 0.15,
                                      color: Colors.black,
                                      offset: const Offset(0, 8),
                                      sigma: 40,
                                      child: SimpleShadow(
                                        opacity: 0.15,
                                        color: Colors.black,
                                        offset: const Offset(0, 2),
                                        sigma: 3,
                                        child: Transform.scale(
                                          scale: bp.smallerThan(TABLET) ? 0.7 : 0.65,
                                          child: Transform.rotate(
                                            angle: -pi / 180 * 10,
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(30),
                                              child: SizedBox(
                                                height: double.infinity,
                                                child: simpleFadeInImage(url: image!),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ))
                              : SizedBox(
                                  height: double.infinity,
                                  child: simpleFadeInImage(url: image!),
                                ),
                        ],
                      ),
              ),
            ),
            Positioned(
              bottom: isSmall ? 16 : 40,
              right: isSmall ? 16 : 40,
              child: design.buttons.responsive(
                variant: hasNewEpisodes ? ButtonVariant.primary : ButtonVariant.secondary,
                onPressed: () {
                  navigationFuture.value = onPlayPressed?.call();
                },
                labelText: hasNewEpisodes ? 'New' : '',
                image: SvgPicture.string(
                  SvgIcons.play,
                  colorFilter: ColorFilter.mode(design.colors.label1, BlendMode.srcIn),
                ),
              ),
            ),
            if (navigationFuture.value != null)
              simpleFutureBuilder(
                  future: navigationFuture.value!,
                  loading: () => Positioned.fill(
                      child: Container(color: design.colors.background1.withOpacity(0.5), child: const Center(child: LoadingIndicator()))),
                  error: (e) => const SizedBox.shrink(),
                  noData: () => const SizedBox.shrink(),
                  ready: (d) => const SizedBox.shrink()),
          ],
        ),
      ),
    );
  }
}
