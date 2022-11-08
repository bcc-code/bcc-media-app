import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/graphql/queries/episode.graphql.dart';
import 'package:brunstadtv_app/router/router.gr.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../graphql/client.dart';

class SpecialRoutesGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final route = resolver.route.children![0];

    ProviderContainer? ref;
    if (router.navigatorKey.currentContext != null) {
      ref = ProviderScope.containerOf(router.navigatorKey.currentContext!,
          listen: false);
    }

    if (route.segments[0] == 'r') {
      final code = route.pathParams.get('code');
      print('Code: $code');
    } else if (route.segments[0] == 'series') {
      final legacyEpisodeId =
          int.tryParse(route.pathParams.get('legacyEpisodeId'));
      if (ref != null && legacyEpisodeId != null) {
        final newIdFuture =
            _getEpisodeId(ref, legacyEpisodeId: legacyEpisodeId);
        newIdFuture?.then((newId) {
          if (newId != null) {
            router.root.navigate(EpisodeScreenRoute(episodeId: newId));
          }
        });
      }
    } else if (route.segments[0] == 'program') {
      final legacyProgramId =
          int.tryParse(route.pathParams.get('legacyProgramId'));
      if (ref != null && legacyProgramId != null) {
        final newIdFuture =
            _getEpisodeId(ref, legacyProgramId: legacyProgramId);
        newIdFuture?.then((newId) {
          if (newId != null) {
            router.root.navigate(EpisodeScreenRoute(episodeId: newId));
          }
        });
      }
    }
  }

  Future<String?>? _getEpisodeId(
    ProviderContainer ref, {
    int? legacyEpisodeId,
    int? legacyProgramId,
  }) {
    final client = ref.read(gqlClientProvider);
    Variables$Query$legacyIDLookup? variables;
    if (legacyEpisodeId != null) {
      variables = Variables$Query$legacyIDLookup(episodeId: legacyEpisodeId);
    } else if (legacyProgramId != null) {
      variables = Variables$Query$legacyIDLookup(programId: legacyProgramId);
    } else {
      return null;
    }
    return client
        .query$legacyIDLookup(
      Options$Query$legacyIDLookup(variables: variables),
    )
        .then(
      (value) {
        if (value.hasException) {
          print(value.exception);
          return null;
        }
        if (value.parsedData == null) {
          final legacyType = legacyEpisodeId != null ? 'episode' : 'program';
          final id = legacyEpisodeId ?? legacyProgramId;
          print(
              'Could not find new episode id from legacy $legacyType id: "$id"');
          return null;
        }
        return value.parsedData!.legacyIDLookup.id;
      },
    ).catchError((error) {
      print(error);
    });
  }
}
