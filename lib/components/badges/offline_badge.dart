import 'package:brunstadtv_app/components/badges/icon_badge.dart';
import 'package:brunstadtv_app/helpers/svg_icons.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';
import 'package:bccm_core/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OfflineBadge extends StatelessWidget {
  const OfflineBadge({super.key});

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    return IconBadge(
      icon: SvgPicture.string(
        SvgIcons.play,
        height: 8,
        colorFilter: ColorFilter.mode(design.colors.onTint.withOpacity(0.3), BlendMode.srcIn),
      ),
      label: S.of(context).offline.toUpperCase(),
      color: design.colors.onTint.withOpacity(0.2),
    );
  }
}
