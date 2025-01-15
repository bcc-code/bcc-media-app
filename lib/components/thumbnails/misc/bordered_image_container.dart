import 'package:bccm_core/bccm_core.dart';
import 'package:brunstadtv_app/helpers/permanent_cache_manager.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

import 'package:bccm_core/design_system.dart';

class BorderedImageContainer extends StatelessWidget {
  final String? imageUrl;
  final BorderRadiusGeometry? borderRadius;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final Widget? child;
  final bool? useCache;

  const BorderedImageContainer({
    super.key,
    this.imageUrl,
    this.width,
    this.height,
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
    this.child,
    this.borderRadius,
    this.useCache,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height ?? double.infinity,
      margin: margin,
      foregroundDecoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(6),
        border: Border.all(
          width: 1,
          color: DesignSystem.of(context).colors.onTint.withOpacity(0.1),
        ),
      ),
      child: LayoutBuilder(
        builder: (context, BoxConstraints constraints) {
          if (imageUrl == null) {
            return const SizedBox.shrink();
          }
          final imageHeight = (constraints.maxHeight * MediaQuery.devicePixelRatioOf(context)).round();
          final imageUri = imageUrl == null ? null : getImageUri(imageUrl!, height: imageHeight);
          return ClipRRect(
            borderRadius: borderRadius ?? BorderRadius.circular(6),
            child: SizedBox(
              height: constraints.maxHeight,
              child: imageUri == null
                  ? null
                  : FadeInImage(
                      fit: BoxFit.cover,
                      placeholder: MemoryImage(kTransparentImage),
                      image: useCache == true
                          ? ExtendedNetworkImageProvider(
                              imageUri.toString(),
                              cache: true,
                              cacheKey: PermanentCacheManager().config.cacheKey,
                              cacheMaxAge: PermanentCacheManager().config.stalePeriod,
                            )
                          : networkImageWithRetryAndResize(
                              imageUrl: imageUri.toString(),
                              cacheHeight: (constraints.maxHeight * MediaQuery.devicePixelRatioOf(context)).round(),
                            ),
                      imageErrorBuilder: imageErrorBuilder,
                      fadeInDuration: const Duration(milliseconds: 400),
                    ),
            ),
          );
        },
      ),
    );
  }
}
