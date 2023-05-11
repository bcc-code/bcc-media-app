import 'package:brunstadtv_app/helpers/ui/svg_icons.dart';

import 'package:brunstadtv_app/providers/auth_state/auth_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../theme/design_system/design_system.dart';

class Avatar extends HookConsumerWidget {
  const Avatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageUrl = ref.read(authStateProvider).user?.picture.toString();
    final name = ref.read(authStateProvider).user?.name;
    const avatarWidth = 100.0;

    return Container(
      margin: const EdgeInsets.only(top: 24, bottom: 16),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            child: kIsWeb
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
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: DesignSystem.of(context).colors.background2,
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
                            ),
                          );
                        },
                      ),
                    ),
                  ),
          ),
          Text(
            name ?? '',
            style: DesignSystem.of(context).textStyles.title1,
          ),
        ],
      ),
    );
  }
}
