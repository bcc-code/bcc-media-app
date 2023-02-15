import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/bccm_typography.dart';
import '../helpers/svg_icons.dart';
import '../l10n/app_localizations.dart';

class SeeMoreSlot extends StatelessWidget {
  const SeeMoreSlot({super.key, required this.onTap});

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Align(
        alignment: Alignment.bottomRight,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(S.of(context).seeMore, style: BccmTextStyles.button2),
            SvgPicture.string(SvgIcons.right),
          ],
        ),
      ),
    );
  }
}
