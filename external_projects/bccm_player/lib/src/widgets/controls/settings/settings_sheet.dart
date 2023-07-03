import 'package:bccm_player/src/widgets/controls/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../configuration/bccm_player_configuration.dart';

class SettingsSheet extends HookWidget {
  const SettingsSheet({
    super.key,
    required this.playerId,
    this.padding,
  });

  final String playerId;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    final controlsTheme = PlayerConfiguration.safeOf(context).theme?.controls;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        // open bottom sheet with settings
        showModalBottomSheet(
          context: context,
          isDismissible: true,
          builder: (context) => Settings(
            playerId: playerId,
          ),
        );
      },
      child: Padding(
        padding: padding ?? const EdgeInsets.all(0),
        child: Icon(Icons.settings, color: controlsTheme?.iconColor),
      ),
    );
  }
}
