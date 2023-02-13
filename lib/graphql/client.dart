import 'package:brunstadtv_app/helpers/constants.dart';
import 'package:brunstadtv_app/providers/auth_state.dart';
import 'package:brunstadtv_app/providers/settings.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql/client.dart';
import 'package:http/http.dart';
import 'package:http/retry.dart';

final gqlClientProvider = Provider<GraphQLClient>((ref) {
  final settings = ref.watch(settingsProvider);
  final authStateNotifier = ref.read(authStateProvider.notifier);
  debugPrint('envOverride: ${settings.envOverride}');
  final httpLink = HttpLink(apiEnvUrls[settings.envOverride] ?? apiEnvUrls[EnvironmentOverride.none]!,
      defaultHeaders: {
        'Accept-Language': settings.appLanguage.languageCode,
      },
      httpClient: RetryClient(Client(), retries: 1, when: (response) => response.statusCode == 500 || response.statusCode == 429));

  final authLink = AuthLink(getToken: () async {
    final authState = await authStateNotifier.getExistingAndEnsureNotExpired();
    if (authState == null) {
      return null;
    }
    return 'Bearer ${authState.auth0AccessToken}';
  });

  debugPrint(httpLink.uri.toString());

  Link link = authLink.concat(httpLink);

  final GraphQLClient client = GraphQLClient(
    /// **NOTE** The default store is the InMemoryStore, which does NOT persist to disk
    cache: GraphQLCache(),
    defaultPolicies: DefaultPolicies(query: Policies(cacheReread: CacheRereadPolicy.ignoreAll, fetch: FetchPolicy.networkOnly)),
    link: link,
  );

  return client;
});
