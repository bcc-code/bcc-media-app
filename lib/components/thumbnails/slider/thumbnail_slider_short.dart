import 'package:brunstadtv_app/components/thumbnails/misc/bordered_image_container.dart';
import 'package:brunstadtv_app/helpers/svg_icons.dart';
import 'package:flutter/material.dart';

import 'package:bccm_core/design_system.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_shadow/simple_shadow.dart';

class ThumbnailSliderShort extends StatelessWidget {
  final String image;
  final Size imageSize;

  const ThumbnailSliderShort({
    super.key,
    required this.image,
    required this.imageSize,
  });

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    return SizedBox(
      width: imageSize.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                width: imageSize.width,
                height: imageSize.height,
                child: BorderedImageContainer(imageUrl: image, useCache: false),
              ),
              Positioned.fill(child: Container(color: design.colors.background1.withOpacity(0.3))),
              Positioned.fill(
                child: Center(child: SimpleShadow(offset: const Offset(0, 0), child: SvgPicture.string(SvgIcons.play, height: 24))),
              ),
            ],
          ),
          /*   Text(
            short.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: design.textStyles.caption1.copyWith(color: design.colors.label1),
          ) */
        ],
      ),
    );
  }
}
