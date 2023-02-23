import 'package:brunstadtv_app/helpers/transparent_image.dart';
import 'package:flutter/material.dart';

import '../theme/bccm_colors.dart';
import '../theme/bccm_typography.dart';

class CategoryButton extends StatelessWidget {
  final String label;
  final String? assetImage;
  final String? networkImage;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;
  final double width;
  final double aspectRatio;

  const CategoryButton({
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
                  border: Border.all(width: 1, color: BccmColors.separatorOnLight),
                  color: BccmColors.background2,
                ),
                child: LayoutBuilder(builder: (context, constraints) {
                  return Center(
                    child: assetImage != null
                        ? Image.asset(
                            assetImage!,
                            fit: BoxFit.fitHeight,
                          )
                        : networkImage != null
                            ? FadeInImage.memoryNetwork(
                                placeholder: kTransparentImage,
                                fadeInDuration: const Duration(milliseconds: 200),
                                image: networkImage!,
                                imageCacheHeight: (constraints.maxHeight * MediaQuery.of(context).devicePixelRatio).round(),
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
                style: BccmTextStyles.body2.copyWith(color: BccmColors.label1),
              ),
            )
          ],
        ),
      ),
    );
  }
}
