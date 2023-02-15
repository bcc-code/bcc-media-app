import 'package:flutter/material.dart';
import 'package:brunstadtv_app/helpers/transparent_image.dart';

import '../theme/bccm_colors.dart';
import '../helpers/image_utils.dart';

class BorderedImageContainer extends StatelessWidget {
  final String? imageUrl;
  final BorderRadiusGeometry? borderRadius;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final Widget? child;

  const BorderedImageContainer({
    super.key,
    this.imageUrl,
    this.width,
    this.height,
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
    this.child,
    this.borderRadius,
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
          color: BccmColors.onTint.withOpacity(0.1),
        ),
      ),
      child: LayoutBuilder(
        builder: (context, BoxConstraints constraints) {
          if (imageUrl == null) {
            return const SizedBox.shrink();
          }
          final imageHeight = (constraints.maxHeight * MediaQuery.of(context).devicePixelRatio).round();
          final imageWidth = (constraints.maxWidth * MediaQuery.of(context).devicePixelRatio).round();
          final imageUri = imageUrl == null ? null : getImageUri(imageUrl!, width: imageWidth, height: imageHeight);
          return ClipRRect(
            borderRadius: borderRadius ?? BorderRadius.circular(6),
            child: SizedBox(
              height: constraints.maxHeight,
              child: imageUri == null
                  ? null
                  : FadeInImage.memoryNetwork(
                      fit: BoxFit.cover,
                      placeholder: kTransparentImage,
                      image: imageUri.toString(),
                      fadeInDuration: const Duration(milliseconds: 400),
                      imageCacheHeight: (constraints.maxHeight * MediaQuery.of(context).devicePixelRatio).round()),
            ),
          );
        },
      ),
    );
  }
}
