import 'dart:async';

import 'package:bccm_core/platform.dart';
import 'package:bccm_core/bccm_core.dart';
import 'package:flutter/material.dart';

import '../models/events/watch_progress.dart';

mixin WatchProgressOverrides<T extends StatefulWidget> on State<T> {
  StreamSubscription? _watchProgressChanged;
  Map<String, int> watchProgressOverrides = {};

  @override
  void initState() {
    super.initState();
    debugPrint('watchProgress.initState');
    _watchProgressChanged = globalEventBus.on<WatchProgressUpdatedEvent>().listen((event) {
      setState(() {
        watchProgressOverrides[event.episodeId] = event.progress ?? 0;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _watchProgressChanged?.cancel();
  }
}

/// TODO: Needs a refactor!!
Query$Page$page replaceProgressForEpisodeId(Query$Page$page page, String episodeId, int? progress) {
  var sections = page.sections.items.map<Fragment$Section>((s) {
    if (s is! Fragment$ItemSection) return s;

    final defaultSection = s.asOrNull<Fragment$Section$$DefaultSection>();
    if (defaultSection != null) {
      return defaultSection.copyWith(
        items: defaultSection.items.copyWith(
          items: defaultSection.items.items.map((item) {
            if (item.id != episodeId) return item;
            final episodeItem = item.item.asOrNull<Fragment$Section$$DefaultSection$items$items$item$$Episode>();
            if (episodeItem == null) return item;
            return item.copyWith(
              item: episodeItem.copyWith(progress: progress),
            );
          }).toList(),
        ),
      );
    }
    final posterSection = s.asOrNull<Fragment$Section$$PosterSection>();
    if (posterSection != null) {
      return posterSection.copyWith(
        items: posterSection.items.copyWith(
          items: posterSection.items.items.map((item) {
            if (item.id != episodeId) return item;
            final episodeItem = item.item.asOrNull<Fragment$Section$$PosterSection$items$items$item$$Episode>();
            if (episodeItem == null) return item;
            return item.copyWith(
              item: episodeItem.copyWith(progress: progress),
            );
          }).toList(),
        ),
      );
    }
    final defaultGridSection = s.asOrNull<Fragment$Section$$DefaultGridSection>();
    if (defaultGridSection != null) {
      return defaultGridSection.copyWith(
        items: defaultGridSection.items.copyWith(
          items: defaultGridSection.items.items.map((item) {
            if (item.id != episodeId) return item;
            final episodeItem = item.item.asOrNull<Fragment$Section$$DefaultGridSection$items$items$item$$Episode>();
            if (episodeItem == null) return item;
            return item.copyWith(
              item: episodeItem.copyWith(progress: progress),
            );
          }).toList(),
        ),
      );
    }
    final posterGridSection = s.asOrNull<Fragment$Section$$PosterGridSection>();
    if (posterGridSection != null) {
      return posterGridSection.copyWith(
        items: posterGridSection.items.copyWith(
          items: posterGridSection.items.items.map((item) {
            if (item.id != episodeId) return item;
            final episodeItem = item.item.asOrNull<Fragment$Section$$PosterGridSection$items$items$item$$Episode>();
            if (episodeItem == null) return item;
            return item.copyWith(
              item: episodeItem.copyWith(progress: progress),
            );
          }).toList(),
        ),
      );
    }
    final featuredSection = s.asOrNull<Fragment$Section$$FeaturedSection>();
    if (featuredSection != null) {
      return featuredSection.copyWith(
        items: featuredSection.items.copyWith(
          items: featuredSection.items.items.map((item) {
            if (item.id != episodeId) return item;
            final episodeItem = item.item.asOrNull<Fragment$Section$$FeaturedSection$items$items$item$$Episode>();
            if (episodeItem == null) return item;
            return item.copyWith(
              item: episodeItem.copyWith(progress: progress),
            );
          }).toList(),
        ),
      );
    }
    final iconGridSection = s.asOrNull<Fragment$Section$$IconGridSection>();
    if (iconGridSection != null) {
      return iconGridSection.copyWith(
        items: iconGridSection.items.copyWith(
          items: iconGridSection.items.items.map((item) {
            if (item.id != episodeId) return item;
            final episodeItem = item.item.asOrNull<Fragment$Section$$IconGridSection$items$items$item$$Episode>();
            if (episodeItem == null) return item;
            return item.copyWith(
              item: episodeItem.copyWith(progress: progress),
            );
          }).toList(),
        ),
      );
    }
    final listSection = s.asOrNull<Fragment$Section$$ListSection>();
    if (listSection != null) {
      return listSection.copyWith(
        items: listSection.items.copyWith(
          items: listSection.items.items.map((item) {
            if (item.id != episodeId) return item;
            final episodeItem = item.item.asOrNull<Fragment$Section$$ListSection$items$items$item$$Episode>();
            if (episodeItem == null) return item;
            return item.copyWith(
              item: episodeItem.copyWith(progress: progress),
            );
          }).toList(),
        ),
      );
    }
    return s;
  }).toList();

  return page.copyWith(
    sections: page.sections.copyWith(items: sections),
  );
}
