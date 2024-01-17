part '.env.dart';

// Getting errors?
// Check if your .env.dart file is missing anything from the .env.dart.example file.

class Env {
  Env._();
  static const enableStudy = _Secrets.enableStudy;
  static const auth0ClientId = 'CU6aNYSKaD6vpgFZvLJ9gvGAFnKRlpir';
  static const auth0Domain = 'login.bcc.no';
  static const auth0Scopes = ['openid', 'profile', 'offline_access', 'church', 'country', 'email'];
  static const auth0Audience = 'api.bcc.no';
  static const auth0SignupConnection = 'BCC-Members';
  static const brunstadtvApiEndpoint = 'https://api.brunstad.tv/query';
  static const npawAccountCode = _Secrets.npawAccountCode;
  static const rudderstackWriteKey = _Secrets.rudderstackWriteKey;
  static final webUrl = _Secrets.webUrl.isNotEmpty ? _Secrets.webUrl : 'https://app.bcc.media';
  static const unleashClientKey = _Secrets.unleashClientKey;
  static const unleashProxyUrl = _Secrets.unleashProxyUrl;
  static const unleashAppName = _Secrets.unleashAppName;
  static const forceFlutterControls = _Secrets.forceFlutterControls;
  static const forceShorts = _Secrets.forceShorts;
}
