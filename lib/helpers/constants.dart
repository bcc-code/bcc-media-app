import 'package:bccm_core/bccm_core.dart';
import 'package:bccm_core/platform.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../env/env.dart';

class PrefKeys {
  PrefKeys._();
  static const envOverride = 'env_override';
  static const appLanguage = 'app_language';
  static const audioLanguage = 'audio_language';
  static const subtitleLanguage = 'subtitle_language';
  static const downloadAudioLanguage = 'download_audio_language';
  static const downloadQuality = 'download_quality';
  static const analyticsId = 'analytics_id';
  static const completedSurveys = 'completed_surveys';
  static const isBetaTester = 'is_beta_tester';
  static const extraUsergroups = 'extra_usergroups';
  static const onboardingCompleted = 'onboarding_completed';
  static const useNativePlayer = 'use_native_player';
  static const shortsFeatureGuideShown = 'shorts_feature_guide_shown';
  static const likedShortsGuideShown = 'liked_shorts_guide_shown2';
  static const downloadedVideosGuide = 'downloaded_videos_guide';
}

final webEnvUrls = <String, String>{
  EnvironmentOverride.dev: 'https://web.dev.brunstad.tv',
  EnvironmentOverride.sta: 'https://web.sta.brunstad.tv',
  EnvironmentOverride.prod: Env.webUrl,
};

String getWebUrl(WidgetRef ref) {
  final sharedPrefs = ref.read(sharedPreferencesProvider);
  final envOverride = sharedPrefs.getString(PrefKeys.envOverride);
  final webUrl = webEnvUrls[envOverride] ?? webEnvUrls[EnvironmentOverride.prod]!;
  return webUrl;
}

class RouteMetaConstants {
  RouteMetaConstants._();
  static const hideMiniPlayer = 'hide_mini_player';
  static const analyticsName = kRouteMetaAnalyticsName;
  static const settingsName = kRouteMetaSettingsName;
  static const navTabRoute = kRouteMetaNavTab;
}

class MetadataExtraConstants {
  MetadataExtraConstants._();
  static const shortId = 'shortId';
}
