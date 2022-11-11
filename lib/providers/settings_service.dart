import 'package:bccm_player/playback_platform_pigeon.g.dart';
import 'package:bccm_player/playback_service_interface.dart';
import 'package:brunstadtv_app/graphql/queries/devices.graphql.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../graphql/client.dart';

part 'settings_service.freezed.dart';

@freezed
class Settings with _$Settings {
  const factory Settings(
      {required Locale appLanguage,
      String? audioLanguage,
      String? subtitleLanguage}) = _Settings;
}

extension on Settings {
  AppConfig toAppConfig() {
    return AppConfig(
        appLanguage: appLanguage.languageCode,
        audioLanguage: audioLanguage,
        subtitleLanguage: subtitleLanguage);
  }
}

class SettingsService extends StateNotifier<Settings> {
  SettingsService(this.ref, Settings settings) : super(settings);

  final Ref ref;

  final Future<SharedPreferences> prefsF = SharedPreferences.getInstance();

  Future<void> load() async {
    var prefs = await prefsF;
    state = state.copyWith(
        appLanguage: Locale(prefs.getString('app_language') ?? 'en'),
        audioLanguage: prefs.getString('audio_language'),
        subtitleLanguage: prefs.getString('subtitle_language'));
    PlaybackPlatformInterface.instance.setAppConfig(state.toAppConfig());
  }

  Future<void> setAppLanguage(String code) async {
    var prefs = await prefsF;

    prefs.setString('app_language', code);
    state = state.copyWith(appLanguage: Locale(code));

    // update the rest of the app
  }

  Future<void> setAudioLanguage(String code) async {
    var prefs = await prefsF;
    prefs.setString('audio_language', code);
    state = state.copyWith(audioLanguage: code);
    PlaybackPlatformInterface.instance.setAppConfig(state.toAppConfig());
  }

  Future<void> setSubtitleLanguage(String code) async {
    var prefs = await prefsF;
    prefs.setString('subtitle_language', code);
    state = state.copyWith(subtitleLanguage: code);
    PlaybackPlatformInterface.instance.setAppConfig(state.toAppConfig());
  }
}

final settingsProvider =
    StateNotifierProvider<SettingsService, Settings>((ref) {
  return SettingsService(ref, const Settings(appLanguage: Locale('en')));
});
