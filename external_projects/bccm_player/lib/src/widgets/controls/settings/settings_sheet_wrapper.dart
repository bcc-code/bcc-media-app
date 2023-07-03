import 'package:bccm_player/src/widgets/controls/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../theme/controls_theme_data.dart';

class SettingsSheet extends HookWidget {
  const SettingsSheet({
    super.key,
    required this.playerId,
    this.padding,
    required this.controlsTheme,
  });

  final String playerId;
  final EdgeInsets? padding;
  final ControlsThemeData controlsTheme;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        // open bottom sheet with settings
        showModalBottomSheet(
          context: context,
          isDismissible: true,
          builder: (context) => Settings(
            playerId: playerId,
            controlsTheme: controlsTheme,
          ),
        );
      },
      child: Padding(
        padding: padding ?? const EdgeInsets.all(0),
        child: Icon(Icons.settings, color: controlsTheme.iconColor),
      ),
    );
  }
}
