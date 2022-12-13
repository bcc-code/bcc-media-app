part '.env.dart';

// Getting errors?
// Check if your .env.dart file is missing anything from the .env.dart.example file.

class Env {
  static const enableStudy = _Secrets.enableStudy;
  static const auth0ClientId = 'CU6aNYSKaD6vpgFZvLJ9gvGAFnKRlpir';
  static const auth0Domain = 'login.bcc.no';
  static const auth0Audience = 'api.bcc.no';
  static const brunstadtvApiEndpoint = 'https://api.brunstad.tv/query';
  static const npawAccountCode = _Secrets.npawAccountCode;
  static const rudderstackWriteKey = _Secrets.rudderstackWriteKey;
  static final studyUrl = _Secrets.studyUrl.isNotEmpty ? _Secrets.studyUrl : 'https://web.brunstad.tv';
}
