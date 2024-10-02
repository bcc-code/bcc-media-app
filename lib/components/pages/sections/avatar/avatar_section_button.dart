import 'package:bccm_core/bccm_core.dart';
import 'package:flutter/material.dart';

import 'package:bccm_core/design_system.dart';

class AvatarSectionButton extends StatelessWidget {
  final String name;
  final String? assetImage;
  final String? networkImage;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;
  final double width;
  final double aspectRatio;

  const AvatarSectionButton({
    super.key,
    required this.name,
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
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 1, color: DesignSystem.of(context).colors.separatorOnLight),
                  color: DesignSystem.of(context).colors.background2,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
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
                                    cacheHeight: (constraints.maxHeight * MediaQuery.devicePixelRatioOf(context)).round(),
                                  ),
                                  imageErrorBuilder: imageErrorBuilder,
                                  fit: BoxFit.fitHeight,
                                )
                              : null,
                    );
                  }),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                name,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: DesignSystem.of(context).textStyles.body3.copyWith(color: DesignSystem.of(context).colors.label1),
              ),
            )
          ],
        ),
      ),
    );
  }
}
