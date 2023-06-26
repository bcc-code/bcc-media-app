import 'package:flutter/material.dart';

class ControlsThemeData {
  final Color? iconColor;
  final TextStyle? durationTextStyle;
  final Color? settingsListBackgroundColor;
  final TextStyle? settingsListTextStyle;
  final TextStyle? fullscreenTitleStyle;
  final SliderThemeData? progressBarTheme;

  ControlsThemeData({
    this.iconColor,
    this.durationTextStyle,
    this.settingsListBackgroundColor,
    this.settingsListTextStyle,
    this.fullscreenTitleStyle,
    this.progressBarTheme,
  });

  factory ControlsThemeData.defaultTheme(BuildContext context) {
    final theme = Theme.of(context);
    return ControlsThemeData(
      iconColor: Colors.white,
      durationTextStyle: theme.textTheme.labelSmall?.copyWith(color: theme.colorScheme.onBackground),
      settingsListBackgroundColor: theme.colorScheme.background,
      settingsListTextStyle: theme.textTheme.labelMedium?.copyWith(color: theme.colorScheme.onSurface),
      fullscreenTitleStyle: theme.textTheme.labelLarge?.copyWith(color: theme.colorScheme.onBackground),
      progressBarTheme: SliderThemeData(
        trackHeight: 2,
        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
        overlayShape: const RoundSliderOverlayShape(overlayRadius: 12),
        activeTrackColor: theme.colorScheme.primary,
        inactiveTrackColor: theme.colorScheme.onBackground.withOpacity(0.2),
        thumbColor: theme.colorScheme.primary,
      ),
    );
  }

  ControlsThemeData fillWithDefaults(ControlsThemeData defaults) {
    return ControlsThemeData(
      iconColor: iconColor ?? defaults.iconColor,
      durationTextStyle: durationTextStyle ?? defaults.durationTextStyle,
      settingsListBackgroundColor: settingsListBackgroundColor ?? defaults.settingsListBackgroundColor,
      settingsListTextStyle: settingsListTextStyle ?? defaults.settingsListTextStyle,
      fullscreenTitleStyle: fullscreenTitleStyle ?? defaults.fullscreenTitleStyle,
      progressBarTheme: progressBarTheme ?? defaults.progressBarTheme,
    );
  }

  ControlsThemeData copyWith({
    Color? iconColor,
    TextStyle? durationTextStyle,
    Color? settingsListBackgroundColor,
    TextStyle? settingsListTextStyle,
    TextStyle? fullscreenTitleStyle,
    SliderThemeData? progressBarTheme,
  }) {
    return ControlsThemeData(
      iconColor: iconColor ?? this.iconColor,
      durationTextStyle: durationTextStyle ?? this.durationTextStyle,
      settingsListBackgroundColor: settingsListBackgroundColor ?? this.settingsListBackgroundColor,
      settingsListTextStyle: settingsListTextStyle ?? this.settingsListTextStyle,
      fullscreenTitleStyle: fullscreenTitleStyle ?? this.fullscreenTitleStyle,
      progressBarTheme: progressBarTheme ?? this.progressBarTheme,
    );
  }
}
