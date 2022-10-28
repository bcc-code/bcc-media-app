import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql/client.dart';
import 'package:brunstadtv_app/services/auth_service.dart';

import '../env/env.dart';

final gqlClientProvider = Provider<GraphQLClient>((ref) {
  final httpLink = HttpLink(
    Env.brunstadtvApiEndpoint,
  );

  final authLink = AuthLink(
    getToken: () async => AuthService.instance.idToken != null
        ? 'Bearer ${AuthService.instance.auth0AccessToken}'
        : null,
  );

  Link link = authLink.concat(httpLink);

  final GraphQLClient client = GraphQLClient(
    /// **NOTE** The default store is the InMemoryStore, which does NOT persist to disk
    cache: GraphQLCache(),
    defaultPolicies: DefaultPolicies(
        query: Policies(
            cacheReread: CacheRereadPolicy.ignoreAll,
            fetch: FetchPolicy.networkOnly)),
    link: link,
  );

  return client;
});
