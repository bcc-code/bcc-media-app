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
  static PlayerThemeData of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<PlayerTheme>()!.playerTheme;
}

class PlayerThemeData {
  PlayerThemeData({this.miniPlayer, this.controls});

  final MiniPlayerThemeData? miniPlayer;
  final ControlsThemeData? controls;
}
