import 'package:flutter/material.dart';
import 'package:brunstadtv_app/helpers/transparent_image.dart';

import '../helpers/btv_colors.dart';
import '../helpers/image_utils.dart';

class BorderedImageContainer extends StatelessWidget {
  final String? imageUrl;
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
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width ?? double.infinity,
        height: height ?? double.infinity,
        margin: margin,
        foregroundDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            width: 1,
            color: BtvColors.onTint.withOpacity(0.1),
          ),
        ),
        child: LayoutBuilder(
          builder: (context, BoxConstraints constraints) {
            if (imageUrl == null) {
              return const SizedBox.shrink();
            }
            final imageHeight = (constraints.maxHeight * MediaQuery.of(context).devicePixelRatio).round();
            final imageWidth = (constraints.maxWidth * MediaQuery.of(context).devicePixelRatio).round();
            final imageUri = getImageUri(imageUrl!, width: imageWidth, height: imageHeight);
            if (imageUri == null) {
              return const SizedBox.shrink();
            }
            return ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: SizedBox(
                height: constraints.maxHeight,
                child: FadeInImage.memoryNetwork(
                    fit: BoxFit.cover,
                    placeholder: kTransparentImage,
                    image: imageUri.toString()!,
                    fadeInDuration: const Duration(milliseconds: 400),
                    imageCacheHeight: (constraints.maxHeight * MediaQuery.of(context).devicePixelRatio).round()),
              ),
            );
          },
        ));
  }
}
