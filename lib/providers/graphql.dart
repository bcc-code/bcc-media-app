import 'package:bccm_core/bccm_core.dart';
import 'package:bccm_core/platform.dart';
import 'package:brunstadtv_app/providers/settings.dart';
import 'package:flutter/widgets.dart';
import 'package:universal_io/io.dart';

import '../flavors.dart';

final bccmGraphQLProviderOverride = bccmGraphQLProvider.overrideWith((ref) {
  final envOverride = ref.read(settingsProvider.select((s) => s.envOverride));
  debugPrint('gqlClient rebuilding. envOverride: $envOverride');

  return createBccmGraphQLClient(
    endpoint: apiEnvUrls[envOverride] ?? apiEnvUrls[EnvironmentOverride.prod]!,
    registerDispose: ref.onDispose,
    getToken: () async {
      final authState = await ref.read(authStateProvider.notifier).getExistingAndEnsureNotExpired();
      if (authState == null) {
        return null;
      }
      return 'Bearer ${authState.auth0AccessToken}';
    },
    buildHeaders: () {
      final settings = ref.read(settingsProvider);
      return BccmGraphqlHeaders(
        acceptLanguage: [settings.appLanguage.languageCode],
        acceptAudioLanguage: settings.audioLanguages,
        acceptSubtitleLanguage: settings.subtitleLanguages,
        application: FlavorConfig.current.applicationCode,
        applicationVersion: formatAppVersion(ref.read(packageInfoProvider)),
        featureFlags: ref.read(featureFlagVariantListProvider),
        extraUsergroups: [
          if (settings.isBetaTester == true) '${FlavorConfig.current.applicationCode}-betatesters',
          ...settings.extraUsergroups,
        ],
        os: Platform.isIOS ? 'iOS' : 'Android',
        osVersion: getOsVersion(ref.read(deviceInfoProvider)),
        isTablet: isTablet,
        onlyPreferredLanguagesContent: settings.onlyPreferredLanguagesContentEnabled,
        sessionId: settings.sessionId,
        searchSessionId: settings.searchSessionId,
      ).toMap();
    },
  );
});
