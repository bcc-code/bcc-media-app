import 'package:bccm_player/theme/controls_theme_data.dart';
import 'package:bccm_player/theme/mini_player_theme_data.dart';
import 'package:flutter/material.dart';

class PlayerThemeData {
  PlayerThemeData({this.miniPlayer, this.controls});

  final MiniPlayerThemeData? miniPlayer;
  final ControlsThemeData? controls;

  factory PlayerThemeData.defaultTheme(BuildContext context) {
    return PlayerThemeData(
      miniPlayer: MiniPlayerThemeData.defaultTheme(context),
      controls: ControlsThemeData.defaultTheme(context),
    );
  }

  PlayerThemeData fillWithDefaults(PlayerThemeData defaults) {
    return PlayerThemeData(
      miniPlayer: miniPlayer?.fillWithDefaults(defaults.miniPlayer!) ?? defaults.miniPlayer,
      controls: controls?.fillWithDefaults(defaults.controls!) ?? defaults.controls,
    );
  }

  PlayerThemeData copyWith({MiniPlayerThemeData? miniPlayer, ControlsThemeData? controls}) {
    return PlayerThemeData(
      miniPlayer: miniPlayer ?? this.miniPlayer,
      controls: controls ?? this.controls,
    );
  }
}
