import 'dart:convert';

import 'package:brunstadtv_app/providers/settings_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gql_dio_link/gql_dio_link.dart';
import 'package:graphql/client.dart';
import 'package:brunstadtv_app/services/auth_service.dart';
import 'package:http/http.dart';

import '../env/env.dart';
import '../main.dart';

final gqlClientProvider = Provider<GraphQLClient>((ref) {
  final httpLink = HttpLink(Env.brunstadtvApiEndpoint, defaultHeaders: {
    'Accept-Language': ref.watch(settingsProvider).appLanguage.languageCode,
  });

  final authLink = AuthLink(
    getToken: () => AuthService.instance.auth0AccessToken != null
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
