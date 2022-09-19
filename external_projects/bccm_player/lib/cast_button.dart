import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CastButton extends StatelessWidget {
  const CastButton({super.key});

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return Container(
        child: const AndroidView(
          viewType: 'bccm_player/cast_button',
          layoutDirection: TextDirection.ltr,
          creationParams: <String, dynamic>{},
          creationParamsCodec: StandardMessageCodec(),
        ),
      );
    } else if (Platform.isIOS) {
      return SizedBox(
        width: 40,
        height: 40,
        child: UiKitView(
          viewType: 'bccm_player/cast_button',
        ),
      );
    }
    return Container();
  }
}
