import 'package:brunstadtv_app/helpers/images.dart';
import 'package:brunstadtv_app/helpers/transparent_image.dart';
import 'package:flutter/material.dart';

import '../../../../theme/design_system/design_system.dart';

class IconSectionButton extends StatelessWidget {
  final String label;
  final String? assetImage;
  final String? networkImage;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;
  final double width;
  final double aspectRatio;

  const IconSectionButton({
    super.key,
    required this.label,
    this.assetImage,
    this.networkImage,
    this.margin = EdgeInsets.zero,
    this.padding = const EdgeInsets.all(8),
    this.onTap,
    this.width = double.infinity,
    this.aspectRatio = 1,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        margin: margin,
        width: width,
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: aspectRatio,
              child: Container(
                padding: padding,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(width: 1, color: DesignSystem.of(context).colors.separatorOnLight),
                  color: DesignSystem.of(context).colors.background2,
                ),
                child: LayoutBuilder(builder: (context, constraints) {
                  return Center(
                    child: assetImage != null
                        ? Image.asset(
                            assetImage!,
                            fit: BoxFit.fitHeight,
                          )
                        : networkImage != null
                            ? FadeInImage(
                                placeholder: MemoryImage(kTransparentImage),
                                fadeInDuration: const Duration(milliseconds: 200),
                                image: networkImageWithRetryAndResize(
                                  imageUrl: networkImage!,
                                  cacheHeight: (constraints.maxHeight * MediaQuery.of(context).devicePixelRatio).round(),
                                ),
                                imageErrorBuilder: imageErrorBuilder,
                                fit: BoxFit.fitHeight,
                              )
                            : null,
                  );
                }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: DesignSystem.of(context).textStyles.body2.copyWith(color: DesignSystem.of(context).colors.label1),
              ),
            )
          ],
        ),
      ),
    );
  }
}
