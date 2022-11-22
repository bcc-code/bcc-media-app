import '../env/env.dart';

const bundleIdentifier = 'tv.brunstad.app';
const auth0RedirectUri = '$bundleIdentifier://login-callback';
const auth0Issuer = 'https://${Env.auth0Domain}';

class SecureStorageKeys {
  static const refreshToken = 'refresh_token';
}

class RouteMetaConstants {
  static const hideMiniPlayer = 'hide_mini_player';
  static const analyticsName = 'analytics_name';
}
