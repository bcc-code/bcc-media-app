import 'package:shared_preferences/shared_preferences.dart';

import '../env/env.dart';

const bundleIdentifier = 'tv.brunstad.app';
const auth0RedirectUri = '$bundleIdentifier://login-callback';
const auth0Issuer = 'https://${Env.auth0Domain}';

class PrefKeys {
  PrefKeys._();
  static const envOverride = 'env_override';
  static const refreshToken = 'refresh_token';
  static const appLanguage = 'app_language';
  static const audioLanguage = 'audio_language';
  static const subtitleLanguage = 'subtitle_language';
  static const analyticsId = 'analytics_id';
  static const completedSurveys = 'completed_surveys';
  static const isBetaTester = 'is_beta_tester';
  static const extraUsergroups = 'extra_usergroups';
  static const onboardingCompleted = 'onboarding_completed';
  static const useNativePlayer = 'use_native_player';
}

class SecureStorageKeys {
  SecureStorageKeys._();
  static const refreshToken = 'refresh_token';
  static const idToken = 'id_token';
  static const accessToken = 'access_token';
}

const apiEnvUrls = <String, String>{
  EnvironmentOverride.none: Env.brunstadtvApiEndpoint,
  EnvironmentOverride.dev: 'https://api.dev.brunstad.tv/query',
  EnvironmentOverride.sta: 'https://api.sta.brunstad.tv/query',
  EnvironmentOverride.prod: 'https://api.brunstad.tv/query',
};

final webEnvUrls = <String, String>{
  EnvironmentOverride.none: Env.webUrl,
  EnvironmentOverride.dev: 'https://web.dev.brunstad.tv',
  EnvironmentOverride.sta: 'https://web.sta.brunstad.tv',
  EnvironmentOverride.prod: 'https://app.bcc.media',
};

Future getWebUrl() async {
  final sharedPrefs = await SharedPreferences.getInstance();
  final envOverride = sharedPrefs.getString(PrefKeys.envOverride);
  final webUrl = webEnvUrls[envOverride] ?? webEnvUrls[EnvironmentOverride.none]!;
  return webUrl;
}

class EnvironmentOverride {
  EnvironmentOverride._();
  static const dev = 'dev';
  static const sta = 'sta';
  static const prod = 'prod';
  static const none = 'none';
}

class RouteMetaConstants {
  static const hideMiniPlayer = 'hide_mini_player';
  static const analyticsName = 'analytics_name';
  static const settingsName = 'settings_name';
  static const navTabRoute = 'nav_tab_route';
}
