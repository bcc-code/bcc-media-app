import 'dart:async';
import 'dart:math';

import 'package:animations/animations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/components/status/loading_indicator.dart';
import 'package:brunstadtv_app/graphql/client.dart';
import 'package:brunstadtv_app/graphql/queries/kids/episodes.graphql.dart';
import 'package:brunstadtv_app/graphql/queries/page.graphql.dart';
import 'package:brunstadtv_app/helpers/extensions.dart';
import 'package:brunstadtv_app/helpers/images.dart';
import 'package:brunstadtv_app/helpers/misc.dart';
import 'package:brunstadtv_app/theme/design_system/design_system.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kids/components/buttons/button.dart';
import 'package:kids/helpers/svg_icons.dart';
import 'package:kids/router/router.gr.dart';
import 'package:kids/screens/playlist.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

class PlaylistPosterLarge extends HookConsumerWidget {
  const PlaylistPosterLarge({
    super.key,
    required this.id,
    required this.onPressed,
    required this.onPlayPressed,
    required this.title,
    required this.image,
    required this.imageUrls,
  });

  final String id;
  final VoidCallback? onPressed;
  final Future Function()? onPlayPressed;
  final String title;
  final String? image;
  final List<String> imageUrls;

  factory PlaylistPosterLarge.fromItem({
    required VoidCallback onPressed,
    required Future Function()? onPlayPressed,
    required Fragment$Section$$PosterSection$items$items$item$$Playlist item,
  }) {
    return PlaylistPosterLarge(
      id: item.id,
      onPressed: onPressed,
      onPlayPressed: onPlayPressed,
      title: item.title,
      image: item.image,
      imageUrls: item.items.items.map((e) => e.image).whereNotNull().toList(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final design = DesignSystem.of(context);
    final navigationFuture = useState<Future<void>?>(null);
    final bp = ResponsiveBreakpoints.of(context);
    final small = bp.smallerThan(TABLET);

    return OpenContainer(
      openBuilder: (context, close) {
        final playlistArgs = ModalRoute.of(context)!.settings.arguments.asOrNull<PlaylistScreenRouteArgs>();
        if (playlistArgs != null) {
          return PlaylistScreen(id: playlistArgs.id);
        }
        return const SizedBox.shrink();
      },
      closedColor: const Color(0xFF051335),
      openElevation: 0,
      closedElevation: 0,
      transitionType: ContainerTransitionType.fadeThrough,
      openColor: design.colors.background1,
      openShape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      closedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(small ? 20 : 40)),
      transitionDuration: const Duration(milliseconds: 500),
      routeSettings: RouteSettings(name: PlaylistScreenRoute.page.name, arguments: PlaylistScreenRouteArgs(id: id)),
      closedBuilder: (
        context,
        open,
      ) =>
          AspectRatio(
        aspectRatio: 392 / 582,
        child: Stack(
          children: [
            ShaderMask(
              shaderCallback: (bounds) {
                return LinearGradient(
                  begin: const Alignment(0.00, -1.00),
                  end: const Alignment(0, 1),
                  colors: [const Color(0xFF051335).withOpacity(0.6), Colors.transparent],
                ).createShader(bounds);
              },
              blendMode: BlendMode.srcATop,
              child: GestureDetector(
                onTap: () {
                  onPressed?.call();
                  open();
                },
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
            Padding(
              padding: bp.smallerThan(TABLET) ? const EdgeInsets.all(20) : const EdgeInsets.symmetric(horizontal: 40, vertical: 32),
              child: Text(
                title,
                softWrap: true,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style:
                    (bp.smallerThan(TABLET) ? design.textStyles.headline3 : design.textStyles.headline1).copyWith(color: design.colors.background1),
              ),
            ),
            Positioned(
              bottom: small ? 16 : 40,
              right: small ? 16 : 40,
              child: design.buttons.responsive(
                variant: ButtonVariant.secondary,
                onPressed: () {
                  navigationFuture.value = onPlayPressed?.call();
                },
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
