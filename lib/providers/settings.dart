import 'package:bccm_player/playback_platform_pigeon.g.dart';
import 'package:brunstadtv_app/helpers/constants.dart';
import 'package:brunstadtv_app/providers/playback_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'settings.freezed.dart';

@freezed
class Settings with _$Settings {
  const factory Settings({
    required Locale appLanguage,
    String? audioLanguage,
    String? subtitleLanguage,
    String? analyticsId,
    String? envOverride,
  }) = _Settings;
}

extension on Settings {
  AppConfig toAppConfig() {
    return AppConfig(
      appLanguage: appLanguage.languageCode,
      audioLanguage: audioLanguage,
      subtitleLanguage: subtitleLanguage,
      analyticsId: analyticsId,
    );
  }
}

class SettingsService extends StateNotifier<Settings> {
  SettingsService(this.ref, Settings settings) : super(settings);

  final Ref ref;

  final Future<SharedPreferences> prefsF = SharedPreferences.getInstance();

  Future<void> load() async {
    var prefs = await prefsF;
    state = state.copyWith(
        appLanguage: Locale(prefs.getString(PrefKeys.appLanguage) ?? 'en'),
        audioLanguage: prefs.getString(PrefKeys.audioLanguage),
        subtitleLanguage: prefs.getString(PrefKeys.subtitleLanguage),
        analyticsId: prefs.getString(PrefKeys.analyticsId),
        envOverride: prefs.getString(PrefKeys.envOverride));
  }

  Future<void> setAppLanguage(String code) async {
    var prefs = await prefsF;

    prefs.setString(PrefKeys.appLanguage, code);
    state = state.copyWith(appLanguage: Locale(code));

    // update the rest of the app
  }

  Future<void> setAudioLanguage(String code) async {
    var prefs = await prefsF;
    prefs.setString(PrefKeys.audioLanguage, code);
    state = state.copyWith(audioLanguage: code);
  }

  Future<void> setSubtitleLanguage(String code) async {
    var prefs = await prefsF;
    prefs.setString(PrefKeys.subtitleLanguage, code);
    state = state.copyWith(subtitleLanguage: code);
  }

  Future<void> setAnalyticsId(String? analyticsId) async {
    var prefs = await prefsF;
    if (analyticsId == null) {
      prefs.remove(PrefKeys.analyticsId);
    } else {
      prefs.setString(PrefKeys.analyticsId, analyticsId);
    }
    state = state.copyWith(analyticsId: analyticsId);
  }
}

final settingsProvider = StateNotifierProvider<SettingsService, Settings>((ref) {
  final settingsService = SettingsService(ref, const Settings(appLanguage: Locale('en')));
  settingsService.addListener(fireImmediately: false, (state) {
    if (!ref.exists(playbackApiProvider)) return;
    ref.read(playbackApiProvider).setAppConfig(state.toAppConfig());
  });
  return settingsService;
});
