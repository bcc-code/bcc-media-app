import 'package:bccm_player/bccm_player.dart';
import 'package:brunstadtv_app/components/featured_section.dart';
import 'package:brunstadtv_app/helpers/widget_keys.dart';
import 'package:brunstadtv_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';
import 'package:brunstadtv_app/main_prod.dart' as prod;

void main() {
  patrolTest(
    'play episode and ensure miniplayer title is correct',
    nativeAutomatorConfig: const NativeAutomatorConfig(
      packageName: 'tv.brunstad.app',
      bundleId: 'tv.brunstad.app',
    ),
    nativeAutomation: true,
    ($) async {
      await $.tester.runAsync(prod.main);
      await $.tester.pumpAndSettle();

      final context = navigatorKey.currentContext;
      if (context == null) {
        throw Exception('Context was null');
      }

      // Explore and click a section item
      await $.tap($(WidgetKeys.exploreButton));
      await $.tap($(FeaturedSection).$(GestureDetector));
      expect($(WidgetKeys.playPoster), findsOneWidget);

      // Store episode title
      final episodeTitle = $(WidgetKeys.episodePageEpisodeTitle).text;
      assert(episodeTitle != null);

      // Start playback and wait until player is visible
      await $(WidgetKeys.playPoster).$(GestureDetector).tap();
      await $(BccmPlayer).waitUntilVisible();

      // Go back and ensure miniplayer
      await $.tap($(WidgetKeys.backButton));
      expect($(WidgetKeys.bottomSheetMiniPlayer), findsOneWidget);

      // Ensure title same as on episode page
      assert($(WidgetKeys.bottomSheetMiniPlayer).$(WidgetKeys.miniPlayerTitle).text == episodeTitle);
    },
  );
}
