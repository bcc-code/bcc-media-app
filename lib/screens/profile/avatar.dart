import 'package:brunstadtv_app/theme/bccm_typography.dart';
import 'package:brunstadtv_app/providers/auth_state/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../theme/bccm_colors.dart';

class Avatar extends ConsumerWidget {
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
            child: Container(
              width: avatarWidth,
              height: avatarWidth,
              decoration: BoxDecoration(
                border: Border.all(
                  color: BccmColors.background2,
                  width: 2,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(avatarWidth / 2)),
              ),
              child: imageUrl != null
                  ? CircleAvatar(
                      backgroundImage: Image.network(
                        imageUrl,
                        cacheWidth: 100,
                      ).image,
                      radius: avatarWidth / 2,
                    )
                  : Container(),
            ),
          ),
          Text(
            name ?? '',
            style: BccmTextStyles.title1,
          ),
        ],
      ),
    );
  }
}
