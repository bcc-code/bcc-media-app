import 'package:auto_route/auto_route.dart';
import 'package:bccm_core/bccm_core.dart';
import 'package:bccm_core/platform.dart';
import 'package:brunstadtv_app/api/brunstadtv.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';
import 'package:brunstadtv_app/providers/feature_flags.dart';
import 'package:bccm_core/design_system.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

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

    Future<bool> handleRedirect() async {
      final code = uri.pathSegments.elementAtOrNull(1);
      if (code == null) {
        throw Exception("Couldn't handle /r/ special route, missing path segments. Path: $path");
      }
      final value = await getBccmRedirectUri(code: code, gqlClient: ref.read(bccmGraphQLProvider));
      if (value != null) {
        await launchUrl(value, mode: LaunchMode.externalApplication);
      } else {
        FlutterError.reportError(FlutterErrorDetails(
          exception: Exception('Could not get uri for redirect code: $code'),
          stack: StackTrace.current,
          library: 'BccmSpecialRoutesHandler',
          context: ErrorDescription('While handling redirect code'),
        ));
      }
      return true;
    }

    Future<bool> handleLegacy({required bool isSeriesId}) async {
      final legacyIdString = uri.pathSegments.elementAtOrNull(1);
      final legacyId = int.tryParse(legacyIdString ?? '');
      if (legacyId == null) {
        debugPrint("Couldn't handle legacy program/series route, missing valid path segments. Path: $path");
        return false;
      }
      final router = context.router;
      final newId = await ref.read(apiProvider).legacyIdLookup(
            legacyEpisodeId: isSeriesId ? legacyId : null,
            legacyProgramId: isSeriesId ? null : legacyId,
          );
      if (newId != null) {
        router.navigateNamedFromRoot('/episode/$newId?${uri.query}');
      }
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
