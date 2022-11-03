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
  final httpLink = DioLink(Env.brunstadtvApiEndpoint,
      defaultHeaders: {
        'Accept-Language': ref.watch(settingsProvider).appLanguage.languageCode
      },
      client: Dio(BaseOptions(
          sendTimeout: 5000, connectTimeout: 5000, receiveTimeout: 5000))
        ..interceptors.add(alice.getDioInterceptor()));

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
