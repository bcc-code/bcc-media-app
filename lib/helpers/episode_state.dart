import 'package:flutter/material.dart';

import '../../components/badges/feature_badge.dart';
import '../../l10n/app_localizations.dart';
import 'package:bccm_core/design_system.dart';

bool isUnavailable(String? publishDate, {DateTime? now}) {
  if (publishDate == null) {
    return false;
  }
  final parsedDateTime = DateTime.tryParse(publishDate);
  if (parsedDateTime == null) {
    return false;
  }
  return (now ?? DateTime.now()).isBefore(parsedDateTime);
}

/// True if episode is not available yet but will be available before 2 days from now
bool isComingSoon({required String? publishDate, required bool locked, DateTime? now}) {
  if (publishDate == null) {
    return false;
  }
  final publishDateTime = DateTime.tryParse(publishDate);
  if (publishDateTime == null) {
    return false;
  }
  final effectiveNow = now ?? DateTime.now();
  // Not available yet (publish date is in the future) but within the next 2 days.
  return locked && effectiveNow.isBefore(publishDateTime) && effectiveNow.add(const Duration(days: 2)).isAfter(publishDateTime);
}

/// True if publishDate > (now - 7 days)
bool isNewEpisode(String? publishDate, bool locked, {DateTime? now}) {
  if (locked) {
    return false;
  }
  if (publishDate == null) {
    return false;
  }
  final publishDateTime = DateTime.tryParse(publishDate);
  if (publishDateTime == null) {
    return false;
  }
  final effectiveNow = now ?? DateTime.now();
  // Already published (not in the future) and within the last 7 days.
  return !effectiveNow.isBefore(publishDateTime) && publishDateTime.isAfter(effectiveNow.subtract(const Duration(days: 7)));
}

Widget? getFeatureBadge({required BuildContext context, required String? publishDate, required bool locked, bool watched = false}) {
  if (isComingSoon(publishDate: publishDate, locked: locked)) {
    return FeatureBadge(label: S.of(context).comingSoon, color: DesignSystem.of(context).colors.background2);
  } else if (isNewEpisode(publishDate, locked) && !watched) {
    return FeatureBadge(label: S.of(context).newEpisode, color: DesignSystem.of(context).colors.tint2);
  }
  return null;
}
