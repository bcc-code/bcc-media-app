import 'package:flutter/material.dart';

import '../../services/auth_service.dart';

class Avatar extends StatelessWidget {
  const Avatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageUrl = AuthService.instance.parsedIdToken?.picture as String;
    final name = AuthService.instance.parsedIdToken?.name as String;
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
                      backgroundImage: NetworkImage(imageUrl),
                      radius: avatarWidth / 2,
                    )
                  : Container(),
            ),
          ),
          Text(
            name,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}
