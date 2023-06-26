import 'package:bccm_player/src/helpers/utils/extensions.dart';
import 'package:bccm_player/theme/controls_theme_data.dart';
import 'package:bccm_player/theme/mini_player_theme_data.dart';
import 'package:flutter/material.dart';

class PlayerTheme extends InheritedWidget {
  PlayerTheme({
    super.key,
    required Widget Function(BuildContext) child,
    required this.playerTheme,
  }) : super(child: Builder(builder: child));

  final PlayerThemeData playerTheme;

  @override
  bool updateShouldNotify(PlayerTheme oldWidget) => oldWidget.playerTheme != playerTheme;
  static PlayerThemeData? read(BuildContext context) =>
      context.getElementForInheritedWidgetOfExactType<PlayerTheme>()?.widget.asOrNull<PlayerTheme>()?.playerTheme;
  static PlayerThemeData? maybeOf(BuildContext context) => context.dependOnInheritedWidgetOfExactType<PlayerTheme>()?.playerTheme;
  static PlayerThemeData rawOf(BuildContext context) => context.dependOnInheritedWidgetOfExactType<PlayerTheme>()!.playerTheme;

  static PlayerThemeData safeOf(BuildContext context) {
    final theme = context.dependOnInheritedWidgetOfExactType<PlayerTheme>()?.playerTheme;
    final defaults = PlayerThemeData.defaultTheme(context);
    return theme?.fillWithDefaults(defaults) ?? defaults;
  }
}

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
}
