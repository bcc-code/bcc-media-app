import 'package:brunstadtv_app/helpers/constants.dart';
import 'package:brunstadtv_app/providers/auth_state.dart';
import 'package:brunstadtv_app/providers/settings.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql/client.dart';
import 'package:http/http.dart';
import 'package:http/retry.dart';

import '../env/env.dart';

final gqlClientProvider = Provider<GraphQLClient>((ref) {
  final settings = ref.watch(settingsProvider);
  final httpLink = HttpLink(ApiEnvUrls[settings.envOverride] ?? ApiEnvUrls[Environments.prod]!,
      defaultHeaders: {
        'Accept-Language': settings.appLanguage.languageCode,
      },
      httpClient: RetryClient(Client(), retries: 1, when: (response) => response.statusCode == 500 || response.statusCode == 429));

  final authLink = AuthLink(getToken: () {
    final token = ref.read(authStateProvider).auth0AccessToken;
    return token != null ? 'Bearer ${ref.read(authStateProvider).auth0AccessToken}' : null;
  });

  Link link = authLink.concat(httpLink);

  final GraphQLClient client = GraphQLClient(
    /// **NOTE** The default store is the InMemoryStore, which does NOT persist to disk
    cache: GraphQLCache(),
    defaultPolicies: DefaultPolicies(query: Policies(cacheReread: CacheRereadPolicy.ignoreAll, fetch: FetchPolicy.networkOnly)),
    link: link,
  );

  return client;
});
