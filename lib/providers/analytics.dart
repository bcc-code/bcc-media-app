import 'package:brunstadtv_app/env/env.dart';
import 'package:brunstadtv_app/flavors.dart';
import 'package:brunstadtv_app/models/analytics/achievement_clicked.dart';
import 'package:brunstadtv_app/models/analytics/downloads.dart';
import 'package:brunstadtv_app/models/auth0/auth0_id_token.dart';
import 'package:brunstadtv_app/providers/androidtv_provider.dart';
import 'package:brunstadtv_app/providers/inherited_data.dart';
import 'package:brunstadtv_app/providers/settings.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:rudder_sdk_flutter/RudderController.dart';
import 'package:rudder_sdk_flutter_platform_interface/platform.dart';

import '../helpers/version.dart';
import '../models/analytics/achievement_shared.dart';
import '../models/analytics/audio_only_clicked.dart';
import '../models/analytics/calendar_day_clicked.dart';
import '../models/analytics/chapter_clicked.dart';
import '../models/analytics/deep_link_opened.dart';
import '../models/analytics/game_closed.dart';
import '../models/analytics/language_changed.dart';
import '../models/analytics/search_performed.dart';
import '../models/analytics/search_result_clicked.dart';
import '../models/analytics/sections.dart';
import '../models/analytics/content_shared.dart';

const kMinimumSessionTimeout = Duration(minutes: 30);

final analyticsProvider = Provider<Analytics>((ref) {
  return RudderAnalytics(ref: ref);
});

class Analytics {
  @mustBeOverridden
  void checkSession() {}
  @mustBeOverridden
  void heyJustHereToTellYouIBelieveTheSessionIsStillAlive() {}
  @mustBeOverridden
  void sectionItemClicked(BuildContext context) {}
  @mustBeOverridden
  void myListTabEntryClicked(BuildContext context) {}
  @mustBeOverridden
  void searchPerformed(SearchPerformedEvent event) {}
  @mustBeOverridden
  void searchResultClicked(BuildContext context) {}
  @mustBeOverridden
  void deepLinkOpened(DeepLinkOpenedEvent event) {}
  @mustBeOverridden
  void languageChanged(LanguageChangedEvent event) {}
  @mustBeOverridden
  void contentShared(ContentSharedEvent event) {}
  @mustBeOverridden
  void achievementClicked(AchievementClickedEvent event) {}
  @mustBeOverridden
  void achievementShared(AchievementSharedEvent event) {}
  @mustBeOverridden
  void chapterClicked(ChapterClickedEvent event) {}
  @mustBeOverridden
  void identify(Auth0IdToken profile, String analyticsId) {}
  @mustBeOverridden
  void screen(String screenName, {Map<String, Object?>? properties}) {}
  @mustBeOverridden
  void audioOnlyClicked(AudioOnlyClickedEvent event) {}
  @mustBeOverridden
  void calendarDayClicked(CalendarDayClickedEvent event) {}
  @mustBeOverridden
  void gameClosed(GameClosedEvent event) {}
  @mustBeOverridden
  void videoDownloadStarted(VideoDownloadStartedEvent event) {}
  @mustBeOverridden
  void videoDownloadRemoved(VideoDownloadRemovedEvent event) {}
  @mustBeOverridden
  void videoDownloadPlayed(VideoDownloadPlayedEvent event) {}
}

class RudderAnalytics extends Analytics {
  PackageInfo? packageInfo;
  final Ref ref;
  DateTime _lastAlive = DateTime.now();

  RudderAnalytics({required this.ref}) {
    final RudderController controller = RudderController.instance;
    RudderLogger.init(RudderLogger.VERBOSE);
    RudderConfigBuilder builder = RudderConfigBuilder();
    builder.withDataPlaneUrl('https://rs.bcc.media/');
    builder.withMobileConfig(MobileConfig(
      recordScreenViews: true,
      collectDeviceId: FlavorConfig.current.strictAnonymousAnalytics != true,
    ));
    controller.initialize(Env.rudderstackWriteKey, config: builder.build());
    PackageInfo.fromPlatform().then((value) => packageInfo = value);
  }

  @override
  void checkSession() {
    final now = DateTime.now();
    final shouldRefreshSession = now.difference(_lastAlive) > kMinimumSessionTimeout;

    if (shouldRefreshSession) {
      print('Analytics: Session dead, refreshing sessionId. Now: ${now.toIso8601String()}, lastAlive: ${_lastAlive.toIso8601String()}.');
      ref.read(settingsProvider.notifier).refreshSessionId();
    }
    _lastAlive = now;
    debugPrint('checkSession _lastAlive: $_lastAlive');
  }

  @override
  void heyJustHereToTellYouIBelieveTheSessionIsStillAlive() {
    _lastAlive = DateTime.now();
  }

  RudderProperty getCommonData() {
    checkSession();
    final settings = ref.read(settingsProvider);
    final androidTv = ref.read(isAndroidTvProvider);
    var commonData = RudderProperty.fromMap({
      'channel': androidTv ? 'androidtv' : 'mobile',
      'appLanguage': settings.appLanguage.languageCode,
      'releaseVersion': packageInfo == null ? null : formatAppVersion(packageInfo!),
      'sessionId': settings.sessionId
    });

    return commonData;
  }

  @override
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

  @override
  void myListTabEntryClicked(BuildContext context) {
    var sectionItemAnalytics = InheritedData.read<SectionItemAnalytics>(context);
    if (sectionItemAnalytics == null) {
      FirebaseCrashlytics.instance.recordError(Exception('Missing sectionItemAnalytics.'), StackTrace.current);
      return;
    }

    var event = SectionClickedEvent(
      sectionId: 'my-list',
      sectionName: 'My-List',
      sectionPosition: 0,
      sectionType: '',
      pageCode: 'my-list',
      elementName: sectionItemAnalytics.name,
      elementPosition: sectionItemAnalytics.position,
      elementType: sectionItemAnalytics.type,
      elementId: sectionItemAnalytics.id,
    );
    RudderController.instance.track('section_clicked', properties: getCommonData().putValue(map: event.toJson()));
  }

  @override
  void searchPerformed(SearchPerformedEvent event) {
    RudderController.instance.track('search_performed', properties: getCommonData().putValue(map: event.toJson()));
  }

  @override
  void searchResultClicked(BuildContext context) {
    final searchAnalytics = InheritedData.read<SearchAnalytics>(context);
    if (searchAnalytics == null) {
      FirebaseCrashlytics.instance.recordError(Exception('Missing SearchAnalytics.'), StackTrace.current);
      return;
    }
    final searchItemAnalytics = InheritedData.read<SearchItemAnalytics>(context);
    if (searchItemAnalytics == null) {
      FirebaseCrashlytics.instance.recordError(Exception('Missing SearchItemAnalytics.'), StackTrace.current);
      return;
    }

    final event = SearchResultClickedEvent(
      searchText: searchAnalytics.searchText,
      elementPosition: searchItemAnalytics.position,
      elementType: searchItemAnalytics.type,
      elementId: searchItemAnalytics.id,
      group: searchItemAnalytics.group,
    );

    RudderController.instance.track('searchresult_clicked', properties: getCommonData().putValue(map: event.toJson()));
  }

  @override
  void deepLinkOpened(DeepLinkOpenedEvent event) {
    RudderController.instance.track('deep_link_opened', properties: getCommonData().putValue(map: event.toJson()));
  }

  @override
  void languageChanged(LanguageChangedEvent event) {
    RudderController.instance.track('language_changed', properties: getCommonData().putValue(map: event.toJson()));
  }

  @override
  void contentShared(ContentSharedEvent event) {
    RudderController.instance.track('content_shared', properties: getCommonData().putValue(map: event.toJson()));
  }

  @override
  void achievementClicked(AchievementClickedEvent event) {
    RudderController.instance.track('achievement_clicked', properties: getCommonData().putValue(map: event.toJson()));
  }

  @override
  void achievementShared(AchievementSharedEvent event) {
    RudderController.instance.track('achievement_shared', properties: getCommonData().putValue(map: event.toJson()));
  }

  @override
  void chapterClicked(ChapterClickedEvent event) {
    RudderController.instance.track('chapter_clicked', properties: getCommonData().putValue(map: event.toJson()));
  }

  @override
  void identify(Auth0IdToken profile, String analyticsId) {
    ref.read(settingsProvider.notifier).setAnalyticsId(analyticsId);
    final traits = RudderTraits();

    final birthDateTime = profile.birthdate == null ? null : DateTime.tryParse(profile.birthdate!);
    final ageDuration = birthDateTime == null ? null : DateTime.now().difference(birthDateTime);
    int? age;
    if (ageDuration != null) {
      age = (ageDuration.inDays / 365.25).floor();
      traits.put('ageGroup', _getAgeGroup(age));
    }
    traits.put('country', profile.countryIso2Code);
    traits.put('churchId', profile.churchId.toString());
    if (profile.gender != null) {
      traits.putGender(profile.gender!);
    }

    RudderController.instance.identify(analyticsId, traits: traits);
  }

  @override
  void screen(String screenName, {Map<String, Object?>? properties}) {
    RudderController.instance.screen(screenName, properties: getCommonData().putValue(map: properties));
  }

  @override
  void audioOnlyClicked(AudioOnlyClickedEvent event) {
    RudderController.instance.track('audioonly_clicked', properties: getCommonData().putValue(map: event.toJson()));
  }

  @override
  void calendarDayClicked(CalendarDayClickedEvent event) {
    RudderController.instance.track('calendarday_clicked', properties: getCommonData().putValue(map: event.toJson()));
  }

  @override
  void gameClosed(GameClosedEvent event) {
    RudderController.instance.track('game_closed', properties: getCommonData().putValue(map: event.toJson()));
  }

  @override
  void videoDownloadStarted(VideoDownloadStartedEvent event) {
    RudderController.instance.track('video_download_started', properties: getCommonData().putValue(map: event.toJson()));
  }

  @override
  void videoDownloadRemoved(VideoDownloadRemovedEvent event) {
    RudderController.instance.track('video_download_removed', properties: getCommonData().putValue(map: event.toJson()));
  }

  @override
  void videoDownloadPlayed(VideoDownloadPlayedEvent event) {
    RudderController.instance.track('video_download_played', properties: getCommonData().putValue(map: event.toJson()));
  }

  String _getAgeGroup(int? age) {
    if (age == null) {
      return 'UNKNOWN';
    }
    if (age >= 65) {
      return '65+';
    } else if (age >= 51) {
      return '51 - 64';
    } else if (age >= 37) {
      return '37 - 50';
    } else if (age >= 26) {
      return '26 - 36';
    } else if (age >= 19) {
      return '19 - 25';
    } else if (age >= 13) {
      return '13 - 18';
    } else if (age >= 10) {
      return '10 - 12';
    } else {
      return '< 10';
    }
  }
}
