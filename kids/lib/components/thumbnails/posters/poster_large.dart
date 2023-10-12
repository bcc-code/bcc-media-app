import 'package:brunstadtv_app/components/status/loading_indicator.dart';
import 'package:brunstadtv_app/helpers/images.dart';
import 'package:brunstadtv_app/helpers/misc.dart';
import 'package:brunstadtv_app/theme/design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kids/components/buttons/button.dart';
import 'package:kids/helpers/svg_icons.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

class PosterLarge extends HookWidget {
  const PosterLarge({
    super.key,
    required this.onPressed,
    required this.image,
  });

  final VoidCallback? onPressed;
  final String? image;

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    final navigationFuture = useState<Future<void>?>(null);
    final bp = ResponsiveBreakpoints.of(context);
    final isSmall = bp.smallerThan(TABLET);

    return AspectRatio(
      aspectRatio: 392 / 582,
      child: Stack(
        children: [
          GestureDetector(
            onTap: onPressed,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(isSmall ? 20 : 40),
              child: image == null
                  ? Container(color: design.colors.separator2)
                  : Stack(
                      children: [
                        Positioned.fill(
                          child: Container(color: design.colors.separator2)
                              .animate(onComplete: (c) => c.forward(from: 0))
                              .shimmer(duration: 1000.ms)
                              .callback(delay: 1000.ms, duration: 250.ms, callback: (c) => true),
                        ),
                        SizedBox(
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
              variant: ButtonVariant.secondary,
              onPressed: () {},
              labelText: '',
              image: SvgPicture.string(SvgIcons.play, colorFilter: ColorFilter.mode(design.colors.label1, BlendMode.srcIn)),
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
    );
  }
}
