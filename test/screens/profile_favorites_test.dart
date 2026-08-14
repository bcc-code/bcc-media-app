import 'package:bccm_core/design_system.dart';
import 'package:bccm_core/platform.dart';
import 'package:brunstadtv_app/components/profile/unavailable_favorite.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';
import 'package:brunstadtv_app/screens/tabs/profile.dart';
import 'package:brunstadtv_app/theme/design_system/bccmedia/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../utils/basic_init.dart';

Fragment$MyListEntry$item$$Episode episodeItem({String id = 'ep1'}) =>
    Fragment$MyListEntry$item$$Episode(id: id, title: 'An episode', duration: 600, locked: false, publishDate: '2026-01-01T00:00:00Z');

Fragment$MyListEntry$item$$Short shortItem({String id = 'short1'}) => Fragment$MyListEntry$item$$Short(id: id, title: 'A short');

Fragment$MyListEntry entry({String id = 'entry1', String? title = 'Some title', bool available = true, Fragment$MyListEntry$item? item}) =>
    Fragment$MyListEntry(id: id, title: title, available: available, item: item);

void main() {
  basicInit();

  // The favorites grid deliberately keeps entries whose item no longer resolves, so
  // users see *something* where a favorite used to be instead of it silently vanishing.
  group('belongsInFavoritesGrid', () {
    test('keeps an available episode', () {
      expect(belongsInFavoritesGrid(entry(item: episodeItem())), isTrue);
    });

    test('keeps an unavailable entry that still has a title', () {
      expect(belongsInFavoritesGrid(entry(available: false, item: null)), isTrue);
    });

    test('drops an unavailable entry whose item was deleted (no title)', () {
      expect(belongsInFavoritesGrid(entry(available: false, title: null, item: null)), isFalse);
    });

    test('drops an available short, which belongs in the liked shorts row', () {
      expect(belongsInFavoritesGrid(entry(item: shortItem())), isFalse);
    });

    test('drops an available entry of an unhandled type, e.g. a show', () {
      expect(belongsInFavoritesGrid(entry(item: Fragment$MyListEntry$item$$Show())), isFalse);
    });
  });

  group('UnavailableFavorite', () {
    Widget wrap(Widget child) {
      final design = BccMediaDesignSystem();
      return ProviderScope(
        child: DesignSystem(
          designSystem: design,
          builder: (context) => MaterialApp(
            locale: const Locale('en'),
            localizationsDelegates: S.localizationsDelegates,
            home: Scaffold(body: SizedBox(width: 200, child: child)),
          ),
        ),
      );
    }

    testWidgets('shows the entry title alongside the unavailable label', (t) async {
      await t.pumpWidget(
        wrap(
          UnavailableFavorite(
            entry: entry(title: '9th October', available: false),
            onRemoved: () {},
          ),
        ),
      );
      await t.pumpAndSettle();

      // The title survives on the entry even though the episode itself is gone —
      // that's the whole point of selecting `title` on UserCollectionEntry.
      expect(find.text('9th October'), findsOneWidget);
      expect(find.text('Unavailable'), findsOneWidget);
    });

    testWidgets('opens the bottom sheet with a remove action when tapped', (t) async {
      await t.pumpWidget(
        wrap(
          UnavailableFavorite(
            entry: entry(title: '9th October', available: false),
            onRemoved: () {},
          ),
        ),
      );
      await t.pumpAndSettle();

      await t.tap(find.byType(UnavailableFavorite));
      await t.pumpAndSettle();

      expect(find.text('No longer available'), findsOneWidget);
      expect(find.text('Remove from favorites'), findsOneWidget);
    });
  });
}
