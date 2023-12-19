import 'package:bccm_core/bccm_core.dart';
import 'package:brunstadtv_app/helpers/svg_icons.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:bccm_core/design_system.dart';

class Avatar extends HookConsumerWidget {
  const Avatar({
    Key? key,
    this.width = 100.0,
    this.backgroundColor,
  }) : super(key: key);

  final double? width;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageUrl = ref.watch(authStateProvider.select((value) => value.user?.picture));
    final design = DesignSystem.of(context);
    return kIsWeb
        ? Container(
            alignment: Alignment.center,
            width: width,
            height: width,
            child: SvgPicture.string(SvgIcons.avatar),
          )
        : Container(
            width: width,
            height: width,
            decoration: BoxDecoration(
              color: backgroundColor ?? design.colors.background2,
              shape: BoxShape.circle,
              border: Border.all(
                color: backgroundColor ?? design.colors.background2,
                width: 2,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(1000),
              child: Image(
                image: NetworkImage(imageUrl ?? ''),
                errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                  return FractionallySizedBox(
                    widthFactor: 0.4,
                    child: Center(
                      child: SvgPicture.string(
                        SvgIcons.avatar,
                        colorFilter: ColorFilter.mode(DesignSystem.of(context).colors.tint1, BlendMode.srcIn),
                        height: 35,
                      ),
                    ),
                  );
                },
              ),
            ),
          );
  }
}
