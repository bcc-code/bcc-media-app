import 'package:bccm_core/platform.dart';
import 'package:bccm_player/bccm_player.dart';
import 'package:brunstadtv_app/helpers/constants.dart';
import 'package:bccm_core/bccm_core.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

import '../flavors.dart';
import '../models/offline/download_quality.dart';

part 'settings.freezed.dart';

@freezed
class Settings with _$Settings implements CommonSettings {
  const factory Settings({
    required Locale appLanguage,
    @Default([]) List<String> audioLanguages,
    @Default([]) List<String> subtitleLanguages,
    String? downloadAudioLanguage,
    DownloadQuality? downloadQuality,
    String? analyticsId,
    int? sessionId,
    String? envOverride,
    bool? isBetaTester,
    bool? useNativePlayer,
    @Default([]) List<String> extraUsergroups,
    bool? notificationsEnabled,
  }) = _Settings;
}

extension on Settings {
  AppConfig toAppConfig() {
    return AppConfig(
      appLanguage: appLanguage.languageCode,
      audioLanguages: audioLanguages.isNotEmpty ? audioLanguages : [appLanguage.languageCode],
      subtitleLanguages: FlavorConfig.current.flavor == Flavor.kids ? audioLanguages : subtitleLanguages,
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
      audioLanguages: (prefs.getString(PrefKeys.audioLanguage) ?? _defaultLanguage).split(','),
      subtitleLanguages: prefs.getString(PrefKeys.subtitleLanguage)?.split(',') ?? [],
      downloadAudioLanguage: prefs.getString(PrefKeys.downloadAudioLanguage),
      downloadQuality: DownloadQuality.values.firstWhereOrNull((element) => element.index == prefs.getInt(PrefKeys.downloadQuality)),
      analyticsId: prefs.getString(PrefKeys.analyticsId),
      envOverride: prefs.getString(PrefKeys.envOverride),
      isBetaTester: prefs.getBool(PrefKeys.isBetaTester),
      useNativePlayer: prefs.getBool(PrefKeys.useNativePlayer),
      sessionId: (DateTime.now().millisecondsSinceEpoch / 1000).round(),
      extraUsergroups: prefs.getStringList(PrefKeys.extraUsergroups) ?? [],
      notificationsEnabled: prefs.getBool(PrefKeys.notificationsEnabled),
    );
  }

  Future<void> setAppLanguage(String code, {bool sendAnalytics = true}) async {
    if (code == state.appLanguage.languageCode) return;
    final previous = state.appLanguage.languageCode;
    ref.read(sharedPreferencesProvider).setString(PrefKeys.appLanguage, code);
    state = state.copyWith(appLanguage: getLocale(code) ?? Locale(_defaultLanguage));
    if (sendAnalytics) {
      ref.read(analyticsProvider).languageChanged(LanguageChangedEvent(
            languageFrom: previous,
            languageTo: code,
            languageChangeType: 'app',
          ));
    }
  }

  Future<void> setAudioLanguages(List<String> languageCodes) async {
    //if (const DeepCollectionEquality().equals(state.audioLanguages, languageCodes)) return;
    final previous = state.audioLanguages;

    ref.read(sharedPreferencesProvider).setString(PrefKeys.audioLanguage, languageCodes.join(','));
    state = state.copyWith(audioLanguages: languageCodes);

    ref.read(analyticsProvider).languageChanged(LanguageChangedEvent(
          languageFrom: previous.join(','),
          languageTo: languageCodes.join(','),
          languageChangeType: 'audio',
        ));
  }

  void refreshSessionId() {
    final newSessionId = (DateTime.now().millisecondsSinceEpoch / 1000).round();
    debugPrint('Session_id: ${state.sessionId} -> $newSessionId');
    state = state.copyWith(sessionId: newSessionId);
  }

  Future<void> setSubtitleLanguages(List<String> languageCodes) async {
    var prefs = ref.read(sharedPreferencesProvider);
    if (languageCodes.isEmpty) {
      prefs.remove(PrefKeys.subtitleLanguage);
    } else {
      prefs.setString(PrefKeys.subtitleLanguage, languageCodes.join(','));
    }
    state = state.copyWith(subtitleLanguages: languageCodes);
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

  Future<void> setUseNativePlayer(bool value) async {
    var prefs = ref.read(sharedPreferencesProvider);
    if (!value) {
      prefs.remove(PrefKeys.useNativePlayer);
    } else {
      prefs.setBool(PrefKeys.useNativePlayer, true);
    }
    state = state.copyWith(useNativePlayer: value);
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

  Future<void> setDownloadAudioLanguage(String? code) async {
    var prefs = ref.read(sharedPreferencesProvider);
    if (code == null) {
      prefs.remove(PrefKeys.downloadAudioLanguage);
    } else {
      prefs.setString(PrefKeys.downloadAudioLanguage, code);
    }
    state = state.copyWith(downloadAudioLanguage: code);
  }

  Future<void> setDownloadQuality(DownloadQuality? quality) async {
    var prefs = ref.read(sharedPreferencesProvider);
    if (quality == null) {
      prefs.remove(PrefKeys.downloadQuality);
    } else {
      prefs.setInt(PrefKeys.downloadQuality, quality.index);
    }
    state = state.copyWith(downloadQuality: quality);
  }

  Future<void> setNotificationsEnabled(bool? value) async {
    var prefs = ref.read(sharedPreferencesProvider);
    if (value == null) {
      prefs.remove(PrefKeys.notificationsEnabled);
    } else {
      prefs.setBool(PrefKeys.notificationsEnabled, value);
    }
    state = state.copyWith(notificationsEnabled: value);
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

final commonSettingsProviderOverride = commonSettingsProvider.overrideWith((ref) => ref.watch(settingsProvider));
