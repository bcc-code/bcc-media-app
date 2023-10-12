import 'dart:async';

import 'package:brunstadtv_app/components/status/loading_indicator.dart';
import 'package:brunstadtv_app/graphql/queries/page.graphql.dart';
import 'package:brunstadtv_app/helpers/extensions.dart';
import 'package:brunstadtv_app/helpers/images.dart';
import 'package:brunstadtv_app/helpers/misc.dart';
import 'package:brunstadtv_app/providers/inherited_data.dart';
import 'package:brunstadtv_app/theme/design_system/design_system.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kids/components/buttons/button.dart';
import 'package:kids/helpers/svg_icons.dart';
import 'package:kids/screens/home.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

class PlaylistPosterLarge extends HookWidget {
  const PlaylistPosterLarge({
    super.key,
    required this.onPressed,
    required this.title,
    required this.image,
    required this.imageUrls,
  });

  final VoidCallback? onPressed;
  final String title;
  final String? image;
  final List<String> imageUrls;

  factory PlaylistPosterLarge.fromItem({
    required VoidCallback onPressed,
    required Fragment$Section$$PosterSection$items$items$item$$Playlist item,
  }) {
    return PlaylistPosterLarge(
      onPressed: onPressed,
      title: item.title,
      image: item.image,
      imageUrls: item.items.items.map((e) => e.image).whereNotNull().toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    final navigationFuture = useState<Future<void>?>(null);
    final bp = ResponsiveBreakpoints.of(context);
    final small = bp.smallerThan(TABLET);

    return AspectRatio(
      aspectRatio: 392 / 582,
      child: Stack(
        children: [
          ShaderMask(
            shaderCallback: (bounds) {
              return LinearGradient(
                begin: Alignment(0.00, -1.00),
                end: Alignment(0, 1),
                colors: [Color(0xFF051335).withOpacity(0.6), Colors.transparent],
              ).createShader(bounds);
            },
            blendMode: BlendMode.srcATop,
            child: GestureDetector(
              onTap: onPressed,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(small ? 20 : 40),
                child: Container(
                  color: const Color(0xFF051335),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Center(
                        child: _PlaylistInnerGrid(imageUrls: imageUrls, small: small),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 32),
            child: Text(
              title,
              softWrap: true,
              style: design.textStyles.headline1.copyWith(color: design.colors.onTint),
            ),
          ),
          Positioned(
            bottom: small ? 16 : 40,
            right: small ? 16 : 40,
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
                      child: Container(
                        color: design.colors.background1.withOpacity(0.5),
                        child: const Center(child: LoadingIndicator()),
                      ),
                    ),
                error: (e) => const SizedBox.shrink(),
                noData: () => const SizedBox.shrink(),
                ready: (d) => const SizedBox.shrink()),
        ],
      ),
    );
  }
}

class _PlaylistInnerGrid extends HookWidget {
  const _PlaylistInnerGrid({
    required this.imageUrls,
    required this.small,
  });

  final List<String> imageUrls;
  final bool small;

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);

    var urlsToUse = imageUrls.take(8).toList();
    if (urlsToUse.length < 8) {
      urlsToUse = urlsToUse + List.generate(8 - urlsToUse.length, (index) => urlsToUse[index % urlsToUse.length]);
    }
    const scale = 1.4;
    final spacing = (small ? 8 : 16) * (1 / scale);

    return IgnorePointer(
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()
          ..rotateZ(-0.2)
          ..scale(scale),
        child: GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          padding: EdgeInsets.zero,
          crossAxisSpacing: spacing,
          mainAxisSpacing: spacing,
          childAspectRatio: 16 / 9,
          children: imageUrls
              .map(
                (url) => ClipRRect(
                  borderRadius: BorderRadius.circular(small ? 6 : 12),
                  child: LayoutBuilder(
                    builder: (context, constraints) => Image(
                      fit: BoxFit.cover,
                      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                        return Stack(
                          children: [
                            Positioned.fill(child: Container(color: design.colors.label1)),
                            AnimatedOpacity(
                              opacity: frame == null ? 0 : 1,
                              duration: const Duration(seconds: 1),
                              curve: Curves.easeOut,
                              child: child,
                            ),
                          ],
                        );
                      },
                      image: networkImageWithRetryAndResize(
                        imageUrl: getImageUri(url, height: constraints.maxHeight.round()).toString(),
                        cacheHeight: (constraints.maxHeight * MediaQuery.of(context).devicePixelRatio).round(),
                      ),
                      errorBuilder: imageErrorBuilder,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
