import 'package:bccm_player/src/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../constants/playback_speed.dart';
import '../theme/player_theme.dart';

export '../constants/playback_speed.dart';

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
  final PlaybackSpeed playbackSpeed;

  PlayerConfigurationData({this.theme, this.playbackSpeed = PlaybackSpeeds.speed100});

  factory PlayerConfigurationData.defaultConfiguration(BuildContext context) {
    return PlayerConfigurationData(
      theme: PlayerThemeData.defaultTheme(context),
    );
  }

  PlayerConfigurationData fillWithDefaults(PlayerConfigurationData defaults) {
    return PlayerConfigurationData(
      theme: theme?.fillWithDefaults(defaults.theme!) ?? defaults.theme,
    );
  }

  PlayerConfigurationData copyWith({PlayerThemeData? theme, PlaybackSpeed? playbackSpeed}) {
    return PlayerConfigurationData(
      theme: theme ?? this.theme,
      playbackSpeed: playbackSpeed ?? this.playbackSpeed,
    );
  }
}
