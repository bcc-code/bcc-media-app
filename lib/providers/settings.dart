import 'package:bccm_player/bccm_player.dart';
import 'package:brunstadtv_app/helpers/constants.dart';
import 'package:brunstadtv_app/providers/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

import '../flavors.dart';
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
    bool? isBetaTester,
    @Default([]) List<String> extraUsergroups,
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

final _defaultLanguage = Intl.defaultLocale ?? FlavorConfig.current.defaultLanguage;

class SettingsService extends StateNotifier<Settings> {
  final Ref ref;

  SettingsService(this.ref) : super(Settings(appLanguage: Locale(_defaultLanguage))) {
    var prefs = ref.read(sharedPreferencesProvider);
    state = state.copyWith(
      appLanguage: Locale(prefs.getString(PrefKeys.appLanguage) ?? _defaultLanguage),
      audioLanguage: prefs.getString(PrefKeys.audioLanguage) ?? _defaultLanguage,
      subtitleLanguage: prefs.getString(PrefKeys.subtitleLanguage),
      analyticsId: prefs.getString(PrefKeys.analyticsId),
      envOverride: prefs.getString(PrefKeys.envOverride),
      isBetaTester: prefs.getBool(PrefKeys.isBetaTester),
      sessionId: (DateTime.now().millisecondsSinceEpoch / 1000).round(),
      extraUsergroups: prefs.getStringList(PrefKeys.extraUsergroups) ?? [],
    );
  }

  Future<void> setAppLanguage(String code) async {
    ref.read(sharedPreferencesProvider).setString(PrefKeys.appLanguage, code);
    state = state.copyWith(appLanguage: getLocale(code) ?? Locale(_defaultLanguage));
    // update the rest of the app
  }

  Future<void> setAudioLanguage(String code) async {
    ref.read(sharedPreferencesProvider).setString(PrefKeys.audioLanguage, code);
    state = state.copyWith(audioLanguage: code);
  }

  void refreshSessionId() {
    final newSessionId = (DateTime.now().millisecondsSinceEpoch / 1000).round();
    debugPrint('Session_id: ${state.sessionId} -> $newSessionId');
    state = state.copyWith(sessionId: newSessionId);
  }

  Future<void> setSubtitleLanguage(String? code) async {
    var prefs = ref.read(sharedPreferencesProvider);
    if (code == null) {
      prefs.remove(PrefKeys.subtitleLanguage);
    } else {
      prefs.setString(PrefKeys.subtitleLanguage, code);
    }
    state = state.copyWith(subtitleLanguage: code);
  }

  Future<void> setAnalyticsId(String? analyticsId) async {
    var prefs = ref.read(sharedPreferencesProvider);
    if (analyticsId == null) {
      prefs.remove(PrefKeys.analyticsId);
    } else {
      prefs.setString(PrefKeys.analyticsId, analyticsId);
    }
    state = state.copyWith(analyticsId: analyticsId);
  }

  Future<void> setBetaTester(bool value) async {
    var prefs = ref.read(sharedPreferencesProvider);
    if (!value) {
      prefs.remove(PrefKeys.isBetaTester);
    } else {
      prefs.setBool(PrefKeys.isBetaTester, true);
    }
    state = state.copyWith(isBetaTester: value);
  }

  Future<void> updateExtraUsergroups(List<String> value) async {
    var prefs = ref.read(sharedPreferencesProvider);
    if (value.isEmpty) {
      prefs.remove(PrefKeys.extraUsergroups);
    } else {
      prefs.setStringList(PrefKeys.extraUsergroups, value);
    }
    state = state.copyWith(extraUsergroups: value);
  }
}

final settingsProvider = StateNotifierProvider<SettingsService, Settings>((ref) {
  final settingsService = SettingsService(ref);
  settingsService.addListener(fireImmediately: true, (state) {
    BccmPlayerInterface.instance.setAppConfig(state.toAppConfig());
  });
  settingsService.addListener(fireImmediately: false, (state) {
    Intl.defaultLocale = state.appLanguage.toLanguageTag();
  });
  return settingsService;
});
