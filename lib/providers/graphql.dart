import 'package:bccm_core/bccm_core.dart';
import 'package:bccm_core/platform.dart';
import 'package:brunstadtv_app/providers/settings.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql/client.dart';
import 'package:http/http.dart';
import 'package:http/retry.dart';
import 'package:universal_io/io.dart';

import '../flavors.dart';

final bccmGraphQLProviderOverride = bccmGraphQLProvider.overrideWith((ref) {
  final envOverride = ref.read(settingsProvider.select((s) => s.envOverride));
  debugPrint('gqlClient rebuilding. envOverride: $envOverride');
  final httpLink = HttpLink(
    apiEnvUrls[envOverride] ?? apiEnvUrls[EnvironmentOverride.prod]!,
    httpClient: RetryClient(
      _ApiHttpClient(ref: ref),
      retries: 1,
      when: (response) => response.statusCode == 500 || response.statusCode == 429,
    ),
  );

  final authLink = AuthLink(
    getToken: () async {
      final authState = await ref.read(authStateProvider.notifier).getExistingAndEnsureNotExpired();
      if (authState == null) {
        return null;
      }
      return 'Bearer ${authState.auth0AccessToken}';
    },
  );

  Link link = authLink.concat(httpLink);
  final GraphQLClient client = GraphQLClient(
    cache: GraphQLCache(),
    defaultPolicies: DefaultPolicies(
      query: Policies(
        cacheReread: CacheRereadPolicy.ignoreAll,
        fetch: FetchPolicy.networkOnly,
      ),
    ),
    link: link,
  );

  return client;
});

class _ApiHttpClient extends BaseClient {
  final Client _client;
  final Ref ref;

  _ApiHttpClient({Client? client, required this.ref}) : _client = client ?? Client();

  @override
  Future<StreamedResponse> send(BaseRequest request) async {
    final settings = ref.read(settingsProvider);
    final extraUsergroups = [
      if (settings.isBetaTester == true) '${FlavorConfig.current.applicationCode}-betatesters',
      ...settings.extraUsergroups,
    ];
    final isLoggedIn = ref.read(authStateProvider).isLoggedIn;
    final featureFlagVariants = ref.read(featureFlagVariantListProvider);
    final os = Platform.isIOS ? 'iOS' : 'Android';
    final osVersion = getOsVersion(ref.read(deviceInfoProvider));
    final headers = BccmGraphqlHeaders(
      acceptLanguage: [settings.appLanguage.languageCode],
      application: FlavorConfig.current.applicationCode,
      applicationVersion: formatAppVersion(ref.watch(packageInfoProvider)),
      featureFlags: isLoggedIn ? featureFlagVariants : null,
      extraUsergroups: extraUsergroups,
      os: os,
      osVersion: osVersion,
      isTablet: isTablet,
    ).toMap();
    request.headers.addAll(headers);
    return _client.send(request);
  }
}
