import 'package:bccm_core/bccm_core.dart';
import 'package:bccm_core/platform.dart';
import 'package:brunstadtv_app/helpers/constants.dart';
import 'package:brunstadtv_app/providers/feature_flags.dart';
import 'package:brunstadtv_app/providers/settings.dart';
import 'package:flutter/widgets.dart';
import 'package:graphql/client.dart';
import 'package:http/http.dart';
import 'package:http/retry.dart';

import '../flavors.dart';

final bccmGraphQLProviderOverride = bccmGraphQLProvider.overrideWith((ref) {
  final settings = ref.watch(settingsProvider);
  final extraUsergroups = [
    if (settings.isBetaTester == true) '${FlavorConfig.current.applicationCode}-betatesters',
    ...settings.extraUsergroups,
  ];
  debugPrint('gqlClient rebuilding. envOverride: ${settings.envOverride}');

  final featureFlagsHeader = ref.watch(featureFlagVariantListProvider).join(',');

  final httpLink = HttpLink(
    apiEnvUrls[settings.envOverride] ?? apiEnvUrls[EnvironmentOverride.none]!,
    defaultHeaders: {
      'Accept-Language': settings.appLanguage.languageCode,
      'X-Application': FlavorConfig.current.applicationCode,
      'X-Application-Version': formatAppVersion(ref.watch(packageInfoProvider)),
      'X-Feature-Flags': featureFlagsHeader,
      if (extraUsergroups.isNotEmpty) 'x-explicit-roles': extraUsergroups.join(','),
    },
    httpClient: RetryClient(
      Client(),
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
