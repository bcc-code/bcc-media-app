import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:brunstadtv_app/env/env.dart';
import 'package:brunstadtv_app/helpers/utils.dart';
import 'package:brunstadtv_app/providers/inherited_data.dart';
import 'package:brunstadtv_app/providers/settings.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:rudder_sdk_flutter/RudderController.dart';
import 'package:rudder_sdk_flutter_platform_interface/platform.dart';

import '../models/analytics/language_changed.dart';
import '../models/analytics/sections.dart';
import '../models/analytics/content_shared.dart';

String getAgeGroup(int? age) {
  if (age == null) {
    return 'UNKNOWN';
  }
  if (age >= 65) {
    return '65+';
  } else if (age >= 51) {
    return '51 - 65';
  } else if (age >= 37) {
    return '37 - 50';
  } else if (age >= 26) {
    return '26 - 36';
  } else if (age >= 19) {
    return '19 - 26';
  } else if (age >= 13) {
    return '13 - 18';
  } else if (age >= 10) {
    return '10 - 12';
  } else {
    return '< 10';
  }
}

final analyticsProvider = Provider<Analytics>((ref) {
  return Analytics(ref: ref);
});

class Analytics {
  PackageInfo? packageInfo;
  Ref ref;

  Analytics({required this.ref}) {
    final RudderController controller = RudderController.instance;
    RudderLogger.init(RudderLogger.VERBOSE);
    RudderConfigBuilder builder = RudderConfigBuilder();
    builder.withDataPlaneUrl('https://rs.bcc.media/');
    builder.withMobileConfig(MobileConfig(recordScreenViews: true));
    controller.initialize(Env.rudderstackWriteKey, config: builder.build());
    PackageInfo.fromPlatform().then((value) => packageInfo = value);
  }

  RudderProperty getCommonData() {
    return RudderProperty.fromMap({
      'channel': 'mobile',
      'appLanguage': ref.read(settingsProvider).appLanguage.languageCode,
      'releaseVersion': packageInfo == null ? null : formatAppVersion(packageInfo!),
    });
  }

  void track() {}

  void sectionItemClicked(BuildContext context) {
    var sectionAnalytics = InheritedData.read<SectionAnalytics>(context);
    if (sectionAnalytics == null) {
      FirebaseCrashlytics.instance.recordError(Exception('Missing SectionAnalytics.'), StackTrace.current);
      return;
    }
    var sectionItemAnalytics = InheritedData.read<SectionItemAnalytics>(context);
    if (sectionItemAnalytics == null) {
      FirebaseCrashlytics.instance.recordError(Exception('Missing sectionItemAnalytics.'), StackTrace.current);
      return;
    }
    var event = SectionClickedEvent(
      sectionId: sectionAnalytics.id,
      sectionName: sectionAnalytics.name,
      sectionPosition: sectionAnalytics.position,
      sectionType: sectionAnalytics.type,
      pageCode: sectionAnalytics.pageCode,
      elementName: sectionItemAnalytics.name,
      elementPosition: sectionItemAnalytics.position,
      elementType: sectionItemAnalytics.type,
      elementId: sectionItemAnalytics.id,
    );
    RudderController.instance.track('section_clicked', properties: getCommonData().putValue(map: event.toJson()));
  }

  void languageChanged(LanguageChangedEvent event) {
    RudderController.instance.track('language_changed', properties: getCommonData().putValue(map: event.toJson()));
  }

  void contentShared(ContentSharedEvent event) {
    RudderController.instance.track('content_shared', properties: getCommonData().putValue(map: event.toJson()));
  }

  void identify(UserProfile profile, String analyticsId) {
    ref.read(settingsProvider.notifier).setAnalyticsId(analyticsId);
    final traits = RudderTraits();

    final birthDateTime = profile.birthdate == null ? null : DateTime.tryParse(profile.birthdate!);
    final ageDuration = birthDateTime == null ? null : DateTime.now().difference(birthDateTime);
    int? age;
    if (ageDuration != null) {
      age = (ageDuration.inDays / 365.25).floor();
      traits.put('ageGroup', getAgeGroup(age));
    }
    traits.put('country', profile.customClaims?['https://login.bcc.no/claims/CountryIso2Code']);
    traits.put('churchId', profile.customClaims?['https://login.bcc.no/claims/churchId']?.toString());
    if (profile.gender != null) {
      traits.putGender(profile.gender!);
    }

    RudderController.instance.identify(analyticsId, traits: traits);
  }

  void screen(screenName, {Map<String, Object?>? properties}) {
    RudderController.instance.screen(screenName, properties: getCommonData().putValue(map: properties));
  }
}
