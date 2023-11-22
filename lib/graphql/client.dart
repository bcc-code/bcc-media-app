import 'package:brunstadtv_app/helpers/constants.dart';
import 'package:brunstadtv_app/providers/auth_state/auth_state.dart';
import 'package:brunstadtv_app/providers/feature_flags.dart';
import 'package:brunstadtv_app/providers/settings.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql/client.dart';
import 'package:http/http.dart';
import 'package:http/retry.dart';

import '../flavors.dart';
import '../helpers/version.dart';
import '../providers/package_info.dart';

final gqlClientProvider = Provider<GraphQLClient>((ref) {
  final settings = ref.watch(settingsProvider);
  final extraUsergroups = [
    if (settings.isBetaTester == true) '${FlavorConfig.current.applicationCode}-betatesters',
    ...settings.extraUsergroups,
  ];
  debugPrint('gqlClient rebuilding. envOverride: ${settings.envOverride}');

  final featureFlagsHeader = ref.watch(featureFlagsProvider.select((value) => value.toggles)).entries.fold<List<String>>([], (list, entry) {
    final variantName = entry.value.variant.name;
    if (!entry.value.enabled) return list;
    if (variantName.isEmpty || entry.value.variant.enabled == false) {
      return [...list, entry.key];
    }
    // "toggle-name:variant;"
    return [...list, '${entry.key}:$variantName'];
  }).join(';');

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
