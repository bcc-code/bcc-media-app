import 'package:bccm_core/bccm_core.dart';
import 'package:flutter/material.dart';

/// Looks complicated, but its just to get a AppTheme instance based on where we are in the widget tree.
/// See https://api.flutter.dev/flutter/widgets/InheritedWidget-class.html
///
/// Example:
///
/// ```dart
/// final theme = AppTheme.of(context);
/// ```
class AppTheme extends InheritedWidget {
  final AppThemeData theme;
  AppTheme({
    super.key,
    required Widget Function(BuildContext) builder,
    required this.theme,
  }) : super(child: Builder(builder: builder));
  @override
  bool updateShouldNotify(AppTheme oldWidget) => theme != oldWidget.theme;

  static AppThemeData? read<T>(BuildContext context) =>
      context.getElementForInheritedWidgetOfExactType<AppTheme>()?.widget.asOrNull<AppTheme>()?.theme;

  static AppThemeData? maybeOf<T>(BuildContext context) => context.dependOnInheritedWidgetOfExactType<AppTheme>()?.theme;

  static AppThemeData of<T>(BuildContext context) => context.dependOnInheritedWidgetOfExactType<AppTheme>()!.theme;
}

class AppThemeData {
  final Gradient studyGradient;
  final Gradient achievementBackgroundGradient;
  final Gradient genericBackgroundGradient;
  final AppTabThemeData? tabTheme;
  final bool appBarTransparent;

  AppThemeData({
    required this.studyGradient,
    required this.achievementBackgroundGradient,
    required this.genericBackgroundGradient,
    required this.appBarTransparent,
    this.tabTheme,
  });
}

class AppTabThemeData {
  final Gradient? iconActiveGradient;
  final Color? activeColor;

  AppTabThemeData({
    this.iconActiveGradient,
    this.activeColor,
  });
}
