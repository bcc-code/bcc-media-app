import 'package:brunstadtv_app/helpers/btv_typography.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

import '../../services/auth_service.dart';

class Avatar extends StatelessWidget {
  const Avatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageUrl = AuthService.instance.user?.pictureUrl.toString();
    final name = AuthService.instance.user?.name as String;
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
                  color: const Color.fromRGBO(29, 40, 56, 1),
                  width: 2,
                ),
                borderRadius:
                    const BorderRadius.all(Radius.circular(avatarWidth / 2)),
              ),
              child: imageUrl != null
                  ? CircleAvatar(
                      backgroundImage: ExtendedNetworkImageProvider(imageUrl),
                      radius: avatarWidth / 2,
                    )
                  : Container(),
            ),
          ),
          Text(
            name,
            style: BtvTextStyles.title1,
          ),
        ],
      ),
    );
  }
}
