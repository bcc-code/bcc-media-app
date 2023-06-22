import 'package:flutter/material.dart';

class ControlsThemeData {
  final Color? iconColor;
  final TextStyle? durationTextStyle;
  final Color? settingsListBackgroundColor;
  final TextStyle? settingsListTextStyle;
  final TextStyle? fullScreenTitleStyle;
  final SliderThemeData? progressBarTheme;

  ControlsThemeData({
    this.iconColor,
    this.durationTextStyle,
    this.settingsListBackgroundColor,
    this.settingsListTextStyle,
    this.fullScreenTitleStyle,
    this.progressBarTheme,
  });

  factory ControlsThemeData.defaultTheme(BuildContext context) {
    final theme = Theme.of(context);
    return ControlsThemeData(
      iconColor: theme.colorScheme.onBackground,
      durationTextStyle: theme.textTheme.labelSmall!.copyWith(color: theme.colorScheme.onBackground),
      settingsListBackgroundColor: theme.colorScheme.background,
      settingsListTextStyle: theme.textTheme.labelMedium!.copyWith(color: theme.colorScheme.onSurface),
      fullScreenTitleStyle: theme.textTheme.labelLarge!.copyWith(color: theme.colorScheme.onBackground),
      progressBarTheme: SliderTheme.of(context).copyWith(
        trackHeight: 2,
        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
        overlayShape: SliderComponentShape.noOverlay,
        activeTrackColor: theme.colorScheme.onBackground,
        inactiveTrackColor: theme.colorScheme.onBackground.withOpacity(0.2),
        thumbColor: theme.colorScheme.onBackground,
      ),
    );
  }

  ControlsThemeData fillWithDefaults(BuildContext context) {
    final defaults = ControlsThemeData.defaultTheme(context);
    return ControlsThemeData(
      iconColor: iconColor ?? defaults.iconColor,
      durationTextStyle: durationTextStyle ?? defaults.durationTextStyle,
      settingsListBackgroundColor: settingsListBackgroundColor ?? defaults.settingsListBackgroundColor,
      settingsListTextStyle: settingsListTextStyle ?? defaults.settingsListTextStyle,
      fullScreenTitleStyle: fullScreenTitleStyle ?? defaults.fullScreenTitleStyle,
      progressBarTheme: progressBarTheme ?? defaults.progressBarTheme,
    );
  }

  ControlsThemeData copyWith({
    Color? iconColor,
    TextStyle? durationTextStyle,
    Color? settingsListBackgroundColor,
    TextStyle? settingsListTextStyle,
    TextStyle? fullScreenTitleStyle,
    SliderThemeData? progressBarTheme,
  }) {
    return ControlsThemeData(
      iconColor: iconColor ?? this.iconColor,
      durationTextStyle: durationTextStyle ?? this.durationTextStyle,
      settingsListBackgroundColor: settingsListBackgroundColor ?? this.settingsListBackgroundColor,
      settingsListTextStyle: settingsListTextStyle ?? this.settingsListTextStyle,
      fullScreenTitleStyle: fullScreenTitleStyle ?? this.fullScreenTitleStyle,
      progressBarTheme: progressBarTheme ?? this.progressBarTheme,
    );
  }
}
