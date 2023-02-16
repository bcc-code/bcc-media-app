import 'package:bccm_player/playback_platform_pigeon.g.dart';
import 'package:brunstadtv_app/helpers/constants.dart';
import 'package:brunstadtv_app/services/playback_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helpers/languages.dart';

part 'settings.freezed.dart';

@freezed
class Settings with _$Settings {
  const factory Settings({
    required Locale appLanguage,
    String? audioLanguage,
    String? subtitleLanguage,
    String? analyticsId,
    int? sessionId,
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
      sessionId: sessionId,
    );
  }
}

class SettingsService extends StateNotifier<Settings> {
  SettingsService(this.ref, Settings settings) : super(settings);

  final Ref ref;

  final Future<SharedPreferences> prefsF = SharedPreferences.getInstance();

  Future<void> init() async {
    var prefs = await prefsF;
    state = state.copyWith(
      appLanguage: Locale(prefs.getString(PrefKeys.appLanguage) ?? 'en'),
      audioLanguage: prefs.getString(PrefKeys.audioLanguage),
      subtitleLanguage: prefs.getString(PrefKeys.subtitleLanguage),
      analyticsId: prefs.getString(PrefKeys.analyticsId),
      envOverride: prefs.getString(PrefKeys.envOverride),
      sessionId: (DateTime.now().millisecondsSinceEpoch / 1000).round(),
    );
  }

  Future<void> setAppLanguage(String code) async {
    var prefs = await prefsF;

    prefs.setString(PrefKeys.appLanguage, code);
    state = state.copyWith(appLanguage: getLocale(code) ?? const Locale('en'));
    // update the rest of the app
  }

  Future<void> setAudioLanguage(String code) async {
    var prefs = await prefsF;
    prefs.setString(PrefKeys.audioLanguage, code);
    state = state.copyWith(audioLanguage: code);
  }

  void refreshSessionId() {
    final newSessionId = (DateTime.now().millisecondsSinceEpoch / 1000).round();
    debugPrint('Session_id: ${state.sessionId} -> $newSessionId');
    state = state.copyWith(sessionId: newSessionId);
  }

  Future<void> setSubtitleLanguage(String? code) async {
    var prefs = await prefsF;
    if (code == null) {
      prefs.remove(PrefKeys.subtitleLanguage);
    } else {
      prefs.setString(PrefKeys.subtitleLanguage, code);
    }
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
  settingsService.addListener(fireImmediately: false, (state) {
    Intl.defaultLocale = state.appLanguage.toLanguageTag();
  });
  return settingsService;
});
