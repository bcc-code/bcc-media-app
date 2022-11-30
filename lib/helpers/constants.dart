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
}

const apiEnvUrls = <String, String>{
  Environments.dev: 'https://api.dev.brunstad.tv/query',
  Environments.staging: 'https://api.sta.brunstad.tv/query',
  Environments.prod: 'https://api.brunstad.tv/query',
};

class Environments {
  static const dev = 'dev';
  static const staging = 'staging';
  static const prod = 'prod';
}

class RouteMetaConstants {
  static const hideMiniPlayer = 'hide_mini_player';
  static const analyticsName = 'analytics_name';
}
