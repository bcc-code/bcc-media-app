import 'dart:convert';

import 'package:brunstadtv_app/providers/auth_state.dart';
import 'package:brunstadtv_app/providers/settings_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gql_dio_link/gql_dio_link.dart';
import 'package:graphql/client.dart';
import 'package:http/http.dart';
import 'package:http/io_client.dart';
import 'package:http/retry.dart';

import '../env/env.dart';
import '../main.dart';

final gqlClientProvider = Provider<GraphQLClient>((ref) {
  final httpLink = HttpLink(Env.brunstadtvApiEndpoint,
      defaultHeaders: {
        'Accept-Language': ref.watch(settingsProvider).appLanguage.languageCode,
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
