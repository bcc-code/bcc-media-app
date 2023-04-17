import 'package:flutter/material.dart';

import '../../components/feature_badge.dart';
import '../../l10n/app_localizations.dart';
import '../../theme/bccm_colors.dart';
import '../episode_state.dart';

// Parse color from hex string in the formats "aabbcc", "#aabbcc", "ffaabbcc", "#ffaabbcc"
Color? getColorFromHex(String hexString) {
  final buffer = StringBuffer();
  hexString = hexString.replaceFirst('#', '');
  if (hexString.length != 6 && hexString.length != 8) {
    return null;
  }
  if (hexString.length == 6) {
    buffer.write('ff');
  }
  buffer.write(hexString);
  final color = int.tryParse(buffer.toString(), radix: 16);
  if (color == null) {
    return null;
  }
  return Color(color);
}

Widget? getFeaturedTag({
  required BuildContext context,
  required String? publishDate,
  required bool locked,
  bool watched = false,
  bool isLive = false,
}) {
  if (isLive && locked) {
    return FeatureBadge(
      label: S.of(context).liveNow,
      color: BccmColors.tint2,
    );
  } else if (isComingSoon(publishDate: publishDate, locked: locked)) {
    return FeatureBadge(
      label: S.of(context).comingSoon,
      color: BccmColors.background2,
    );
  } else if (isNewEpisode(publishDate) && !watched) {
    return FeatureBadge(
      label: S.of(context).newEpisode,
      color: BccmColors.tint2,
    );
  }
  return null;
}
