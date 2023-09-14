import 'package:brunstadtv_app/helpers/svg_icons.dart';

import 'package:brunstadtv_app/providers/auth_state/auth_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../theme/design_system/design_system.dart';

class Avatar extends HookConsumerWidget {
  const Avatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageUrl = ref.watch(authStateProvider.select((value) => value.user?.picture));
    const avatarWidth = 100.0;
    final design = DesignSystem.of(context);
    return kIsWeb
        ? Container(
            alignment: Alignment.center,
            width: avatarWidth,
            height: avatarWidth,
            child: SvgPicture.string(SvgIcons.avatar),
          )
        : Container(
            width: avatarWidth,
            height: avatarWidth,
            decoration: BoxDecoration(
              color: design.colors.background2,
              shape: BoxShape.circle,
              border: Border.all(
                color: design.colors.background2,
                width: 2,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(1000),
              child: Image(
                image: NetworkImage(imageUrl ?? ''),
                errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                  return Center(
                    child: SvgPicture.string(
                      SvgIcons.avatar,
                      color: DesignSystem.of(context).colors.tint1,
                      height: 35,
                    ),
                  );
                },
              ),
            ),
          );
  }
}
