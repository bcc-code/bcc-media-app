import 'package:universal_io/io.dart';

import 'package:bccm_player/playback_service_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CastButton extends StatefulWidget {
  const CastButton({super.key});

  final methodChannel = const MethodChannel('bccm_player/cast_button');

  @override
  State<CastButton> createState() => _CastButtonState();
}

class _CastButtonState extends State<CastButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return const AndroidView(
        viewType: 'bccm_player/cast_button',
        layoutDirection: TextDirection.ltr,
        creationParams: <String, dynamic>{},
        creationParamsCodec: StandardMessageCodec(),
      );
    } else if (Platform.isIOS) {
      return const UiKitView(viewType: 'bccm_player/cast_button');
    }
    return Container();
  }
}
