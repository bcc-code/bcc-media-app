import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/api/brunstadtv.dart';
import 'package:brunstadtv_app/helpers/router/router_utils.dart';
import 'package:brunstadtv_app/helpers/router/redirect.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';
import 'package:brunstadtv_app/providers/feature_flags.dart';
import 'package:bccm_core/design_system.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../graphql/client.dart';

final specialRoutesHandlerProvider = Provider<SpecialRoutesHandler>((ref) {
  return BccmSpecialRoutesHandler(ref);
});

abstract class SpecialRoutesHandler {
  /// Handles special routes, e.g. /r/ redirects, legacy routes, etc.
  /// Returns true if the route was handled (and in that case the caller should prevent any default navigation if relevant)
  Future<bool> handle(BuildContext context, String path);
}

class BccmSpecialRoutesHandler implements SpecialRoutesHandler {
  Ref ref;
  BccmSpecialRoutesHandler(this.ref);

  @override
  Future<bool> handle(BuildContext context, String path) async {
    if (!path.startsWith('/')) return false;
    var uri = Uri.tryParse('https://web.brunstad.tv$path');
    if (uri == null || uri.pathSegments.isEmpty) return false;

    bool handleTvLogin() {
      launchUrl(uri, mode: LaunchMode.externalApplication);
      return true;
    }

    bool handleRedirect() {
      final code = uri.pathSegments.elementAtOrNull(1);
      if (code == null) {
        throw Exception("Couldn't handle /r/ special route, missing path segments. Path: $path");
      }
      performRedirect(code: code, gqlClient: ref.read(gqlClientProvider));
      return true;
    }

    bool handleLegacy({required bool isSeriesId}) {
      final legacyIdString = uri.pathSegments.elementAtOrNull(1);
      final legacyId = int.tryParse(legacyIdString ?? '');
      if (legacyId == null) {
        debugPrint("Couldn't handle legacy program/series route, missing valid path segments. Path: $path");
        return false;
      }
      final newIdFuture = ref.read(apiProvider).legacyIdLookup(
            legacyEpisodeId: isSeriesId ? legacyId : null,
            legacyProgramId: isSeriesId ? null : legacyId,
          );
      newIdFuture.then((newId) {
        if (newId != null) {
          context.router.navigateNamedFromRoot('/episode/$newId?${uri.query}');
        }
      });
      return true;
    }

    bool handleShorts() {
      if (ref.read(featureFlagsProvider).shorts) {
        return false;
      }
      showDialog(
        context: context,
        builder: (context) {
          final design = DesignSystem.of(context);
          return AlertDialog(
            title: Text(
              S.of(context).shortsTab,
              style: design.textStyles.title2.copyWith(color: design.colors.label2),
            ),
            content: Text(
              S.of(context).featureNotAvailableYet,
              style: design.textStyles.body1.copyWith(color: design.colors.label2),
            ),
            actions: [
              design.buttons.responsive(
                onPressed: () => Navigator.of(context).pop(),
                labelText: S.of(context).gotIt,
              ),
            ],
          );
        },
      );
      return false;
    }

    switch (uri.pathSegments[0]) {
      case 'tvlogin':
        return handleTvLogin();
      case 'r':
        return handleRedirect();
      case 'series':
        return handleLegacy(isSeriesId: true);
      case 'program':
        return handleLegacy(isSeriesId: false);
      case 'shorts':
        return handleShorts();
    }
    return false;
  }
}
