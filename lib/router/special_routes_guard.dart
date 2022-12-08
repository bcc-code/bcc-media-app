import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/graphql/queries/episode.graphql.dart';
import 'package:brunstadtv_app/graphql/queries/redirect.graphql.dart';
import 'package:brunstadtv_app/helpers/navigation_utils.dart';
import 'package:brunstadtv_app/router/router.gr.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../graphql/client.dart';

class SpecialRoutesGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final route = resolver.route.children![0];
    var uri = Uri.tryParse('https://brunstad.tv/${route.stringMatch}');

    ProviderContainer? ref;
    if (router.navigatorKey.currentContext != null) {
      ref = ProviderScope.containerOf(router.navigatorKey.currentContext!, listen: false);
    }
    if (route.segments[0] == 'tvlogin' && uri != null) {
      launchUrl(uri, mode: LaunchMode.externalApplication);
    }

    if (ref != null && route.segments[0] == 'r') {
      final code = route.pathParams.getString('code', '');
      print('Redirect code: $code');
      if (code != '') {
        ref
            .read(gqlClientProvider)
            .query$GetRedirectUrl(Options$Query$GetRedirectUrl(
              variables: Variables$Query$GetRedirectUrl(
                id: code,
              ),
            ))
            .then(
          (result) {
            var urlString = result.parsedData?.redirect.url;
            if (urlString == null) return;
            final uri = Uri.tryParse(urlString);
            if (uri == null) return;
            launchUrl(uri, mode: LaunchMode.externalApplication);
          },
        );
      }
    } else if (route.segments[0] == 'series') {
      final legacyEpisodeId = int.tryParse(route.pathParams.get('legacyEpisodeId'));
      if (ref != null && legacyEpisodeId != null) {
        final newIdFuture = _getEpisodeId(ref, legacyEpisodeId: legacyEpisodeId);
        newIdFuture?.then((newId) {
          if (newId != null) {
            router.root.navigateNamedFromRoot('/episode/$newId${route.queryParams.toQueryStringWithQuestionMark()}');
          }
        });
      }
    } else if (route.segments[0] == 'program') {
      final legacyProgramId = int.tryParse(route.pathParams.get('legacyProgramId'));
      if (ref != null && legacyProgramId != null) {
        final newIdFuture = _getEpisodeId(ref, legacyProgramId: legacyProgramId);
        newIdFuture?.then((newId) {
          if (newId != null) {
            router.root.navigateNamedFromRoot('/episode/$newId${route.queryParams.toQueryStringWithQuestionMark()}');
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
          print('Could not find new episode id from legacy $legacyType id: "$id"');
          return null;
        }
        return value.parsedData!.legacyIDLookup.id;
      },
    ).catchError((error) {
      print(error);
    });
  }
}
