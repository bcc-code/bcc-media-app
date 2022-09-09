import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql/client.dart';
import 'package:my_app/services/auth_service.dart';

final gqlClientProvider = Provider<GraphQLClient>((ref) {
  final httpLink = HttpLink(
    'https://api.brunstad.tv/query',
  );
/* 
  final authLink = AuthLink(
    getToken: () async => AuthService.instance.idToken != null
        ? 'Bearer ${AuthService.instance.idToken}'
        : null,
  ); */

  Link link = httpLink;

  final GraphQLClient client = GraphQLClient(
    /// **NOTE** The default store is the InMemoryStore, which does NOT persist to disk
    cache: GraphQLCache(),
    link: link,
  );

  return client;
});
