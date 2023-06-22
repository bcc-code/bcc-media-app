import 'package:flutter/material.dart';

class MiniPlayerThemeData {
  final Color? iconColor;
  final Color? backgroundColor;
  final Color? thumbnailBorderColor;
  final Color? topBorderColor;
  final TextStyle? titleStyle;
  final TextStyle? secondaryTitleStyle;

  MiniPlayerThemeData({
    this.iconColor,
    this.backgroundColor,
    this.thumbnailBorderColor,
    this.topBorderColor,
    this.titleStyle,
    this.secondaryTitleStyle,
  });

  factory MiniPlayerThemeData.defaultTheme(BuildContext context) {
    final theme = Theme.of(context);
    return MiniPlayerThemeData(
      iconColor: theme.colorScheme.onSurface,
      backgroundColor: theme.colorScheme.background,
      thumbnailBorderColor: Colors.white.withOpacity(0.01),
      topBorderColor: theme.colorScheme.onSurface.withOpacity(0.1),
      titleStyle: theme.textTheme.labelMedium!.copyWith(color: theme.colorScheme.onSurface),
      secondaryTitleStyle: theme.textTheme.labelSmall?.copyWith(color: theme.colorScheme.primary),
    );
  }

  MiniPlayerThemeData fillWithDefaults(BuildContext context) {
    final defaults = MiniPlayerThemeData.defaultTheme(context);
    return MiniPlayerThemeData(
      iconColor: iconColor ?? defaults.iconColor,
      backgroundColor: backgroundColor ?? defaults.backgroundColor,
      thumbnailBorderColor: thumbnailBorderColor ?? defaults.thumbnailBorderColor,
      topBorderColor: topBorderColor ?? defaults.topBorderColor,
      titleStyle: titleStyle ?? defaults.titleStyle,
      secondaryTitleStyle: secondaryTitleStyle ?? defaults.secondaryTitleStyle,
    );
  }

  MiniPlayerThemeData copyWith({
    Color? iconColor,
    Color? backgroundColor,
    Color? thumbnailBorderColor,
    Color? topBorderColor,
    TextStyle? titleStyle,
    TextStyle? secondaryTitleStyle,
  }) {
    return MiniPlayerThemeData(
      iconColor: iconColor ?? this.iconColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      thumbnailBorderColor: thumbnailBorderColor ?? this.thumbnailBorderColor,
      topBorderColor: topBorderColor ?? this.topBorderColor,
      titleStyle: titleStyle ?? this.titleStyle,
      secondaryTitleStyle: secondaryTitleStyle ?? this.secondaryTitleStyle,
    );
  }
}
