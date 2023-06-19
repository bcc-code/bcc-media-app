import 'package:universal_io/io.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CastButton extends StatelessWidget {
  const CastButton({super.key, this.color});

  final methodChannel = const MethodChannel('bccm_player/cast_button');
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final creationParams = <String, dynamic>{
      if (color != null) 'color': color!.value,
    };
    if (Platform.isAndroid) {
      return AndroidView(
        viewType: 'bccm_player/cast_button',
        layoutDirection: TextDirection.ltr,
        creationParams: creationParams,
        creationParamsCodec: const StandardMessageCodec(),
      );
    } else if (Platform.isIOS && const String.fromEnvironment('IS_MAESTRO_TEST', defaultValue: 'false') != 'true') {
      return UiKitView(
        viewType: 'bccm_player/cast_button',
        creationParams: creationParams,
        creationParamsCodec: const StandardMessageCodec(),
      );
    }
    return Container();
  }
}
