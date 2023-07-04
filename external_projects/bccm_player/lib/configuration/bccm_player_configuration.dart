import 'package:bccm_player/src/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../theme/player_theme.dart';

class PlayerConfiguration extends InheritedWidget {
  final PlayerConfigurationData configuration;

  PlayerConfiguration({
    super.key,
    required this.configuration,
    required Widget Function(BuildContext) child,
  }) : super(child: Builder(builder: child));

  @override
  bool updateShouldNotify(PlayerConfiguration oldWidget) => oldWidget.configuration != configuration;

  static PlayerConfigurationData? read(BuildContext context) =>
      context.getElementForInheritedWidgetOfExactType<PlayerConfiguration>()?.widget.asOrNull<PlayerConfiguration>()?.configuration;

  static PlayerConfigurationData? maybeOf(BuildContext context) => context.dependOnInheritedWidgetOfExactType<PlayerConfiguration>()?.configuration;
  static PlayerConfigurationData rawOf(BuildContext context) => context.dependOnInheritedWidgetOfExactType<PlayerConfiguration>()!.configuration;

  static PlayerConfigurationData safeOf(BuildContext context) {
    final configuration = context.dependOnInheritedWidgetOfExactType<PlayerConfiguration>()?.configuration;
    final defaults = PlayerConfigurationData.defaultConfiguration(context);
    return configuration?.fillWithDefaults(defaults) ?? defaults;
  }
}

class PlayerConfigurationData {
  final PlayerThemeData? theme;

  /// List of playback speeds to be shown in the player settings.
  /// Playback speeds should be > 0
  final List<double> playbackSpeeds;

  /// The playback speed which should be selected by default.
  /// This should be one of the values specified in [playbackSpeeds].
  final double defaultPlaybackSpeed;

  PlayerConfigurationData({
    this.theme,
    this.playbackSpeeds = const [0.25, 0.5, 0.75, 1, 1.25, 1.5, 1.75, 2],
    this.defaultPlaybackSpeed = 1,
  }) {
    if (!playbackSpeeds.every((e) => e > 0)) {
      throw ArgumentError.value(
        playbackSpeeds.toString(),
        'playbackSpeed',
        'Playback speeds should be greater than 0',
      );
    }
    if (!playbackSpeeds.contains(defaultPlaybackSpeed)) {
      throw ArgumentError.value(
        defaultPlaybackSpeed,
        'defaultPlaybackSpeed',
        '`defaultPlaybackSpeed` should be one of the values specified in `playbackSpeeds`',
      );
    }
    // print('>>> constructor ${playbackSpeeds}');
  }

  factory PlayerConfigurationData.defaultConfiguration(BuildContext context) {
    return PlayerConfigurationData(
      theme: PlayerThemeData.defaultTheme(context),
    );
  }

  PlayerConfigurationData fillWithDefaults(PlayerConfigurationData defaults) {
    return PlayerConfigurationData(
      theme: theme?.fillWithDefaults(defaults.theme!) ?? defaults.theme,
      playbackSpeeds: playbackSpeeds,
      defaultPlaybackSpeed: defaultPlaybackSpeed,
    );
  }

  PlayerConfigurationData copyWith({
    PlayerThemeData? theme,
    List<double>? playbackSpeeds,
    double? defaultPlaybackSpeed,
  }) {
    return PlayerConfigurationData(
      theme: theme ?? this.theme,
      playbackSpeeds: playbackSpeeds ?? this.playbackSpeeds,
      defaultPlaybackSpeed: defaultPlaybackSpeed ?? this.defaultPlaybackSpeed,
    );
  }
}
