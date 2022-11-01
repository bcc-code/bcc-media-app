import 'package:envify/envify.dart';

part '.env.dart';

class Env {
/* 
  Env(Variables variables) {

  } */

  static const auth0ClientId = 'CU6aNYSKaD6vpgFZvLJ9gvGAFnKRlpir';
  static const auth0Domain = 'login.bcc.no';
  static const auth0Audience = 'api.bcc.no';
  static const brunstadtvApiEndpoint = 'https://api.brunstad.tv/query';
  static const npawAccountCode = _Secrets.npawAccountCode;
}
