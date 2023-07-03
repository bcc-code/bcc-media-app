import 'package:flutter/material.dart';

class ControlsThemeData {
  final Color? primaryColor;
  final Color? iconColor;
  final TextStyle? durationTextStyle;
  final Color? settingsListBackgroundColor;
  final TextStyle? settingsListTextStyle;
  final TextStyle? fullscreenTitleStyle;
  final SliderThemeData? progressBarTheme;
  final Color? playNextButtonBackgroundColor;
  final Color? playNextButtonProgressColor;

  ControlsThemeData({
    this.primaryColor,
    this.iconColor,
    this.durationTextStyle,
    this.settingsListBackgroundColor,
    this.settingsListTextStyle,
    this.fullscreenTitleStyle,
    this.progressBarTheme,
    this.playNextButtonBackgroundColor,
    this.playNextButtonProgressColor,
  });

  factory ControlsThemeData.defaultTheme(BuildContext context) {
    final theme = Theme.of(context);
    return ControlsThemeData(
      primaryColor: theme.colorScheme.primary,
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
      playNextButtonBackgroundColor: Colors.blue.withOpacity(0.75),
      playNextButtonProgressColor: Colors.blue,
    );
  }

  ControlsThemeData fillWithDefaults(ControlsThemeData defaults) {
    return ControlsThemeData(
      primaryColor: primaryColor ?? defaults.primaryColor,
      iconColor: iconColor ?? defaults.iconColor,
      durationTextStyle: durationTextStyle ?? defaults.durationTextStyle,
      settingsListBackgroundColor: settingsListBackgroundColor ?? defaults.settingsListBackgroundColor,
      settingsListTextStyle: settingsListTextStyle ?? defaults.settingsListTextStyle,
      fullscreenTitleStyle: fullscreenTitleStyle ?? defaults.fullscreenTitleStyle,
      progressBarTheme: progressBarTheme ?? defaults.progressBarTheme,
      playNextButtonBackgroundColor: playNextButtonBackgroundColor ?? defaults.playNextButtonBackgroundColor,
      playNextButtonProgressColor: playNextButtonProgressColor ?? defaults.playNextButtonProgressColor,
    );
  }

  ControlsThemeData copyWith({
    Color? primaryColor,
    Color? iconColor,
    TextStyle? durationTextStyle,
    Color? settingsListBackgroundColor,
    TextStyle? settingsListTextStyle,
    TextStyle? fullscreenTitleStyle,
    SliderThemeData? progressBarTheme,
    Color? playNextButtonBackgroundColor,
    Color? playNextButtonProgressColor,
  }) {
    return ControlsThemeData(
      primaryColor: primaryColor ?? this.primaryColor,
      iconColor: iconColor ?? this.iconColor,
      durationTextStyle: durationTextStyle ?? this.durationTextStyle,
      settingsListBackgroundColor: settingsListBackgroundColor ?? this.settingsListBackgroundColor,
      settingsListTextStyle: settingsListTextStyle ?? this.settingsListTextStyle,
      fullscreenTitleStyle: fullscreenTitleStyle ?? this.fullscreenTitleStyle,
      progressBarTheme: progressBarTheme ?? this.progressBarTheme,
      playNextButtonBackgroundColor: playNextButtonBackgroundColor ?? this.playNextButtonBackgroundColor,
      playNextButtonProgressColor: playNextButtonProgressColor ?? this.playNextButtonProgressColor,
    );
  }
}
