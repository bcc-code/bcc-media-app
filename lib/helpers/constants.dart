import '../env/.env.dart';

const BUNDLE_IDENTIFIER = 'media.bcc.app';
const AUTH0_REDIRECT_URI = '$BUNDLE_IDENTIFIER://login-callback';
const AUTH0_DOMAIN = Env.AUTH0_DOMAIN;
const AUTH0_CLIENT_ID = Env.AUTH0_CLIENT_ID;
const AUTH0_ISSUER = 'https://$AUTH0_DOMAIN';

class SecureStorageKeys {
  static const REFRESH_TOKEN = 'refresh_token';
}