import 'package:brunstadtv_app/helpers/transparent_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../graphql/queries/achievements.graphql.dart';
import '../helpers/btv_buttons.dart';
import '../helpers/btv_colors.dart';
import '../helpers/btv_typography.dart';
import '../helpers/image_utils.dart';
import '../l10n/app_localizations.dart';
import 'dialog_with_image.dart';

class AchievementDialog extends StatelessWidget {
  const AchievementDialog({super.key, required this.achievement, this.dismissButtonText});

  final Fragment$AchievementTitleImage achievement;
  final String? dismissButtonText;

  @override
  Widget build(BuildContext context) {
    final image = achievement.image;
    return DialogWithImage(
      image: image == null ? const SizedBox.shrink() : SizedBox(height: 180, child: simpleFadeInImage(url: image)),
      title: achievement.title,
      description: S.of(context).videoCompletedText,
      dismissButtonText: dismissButtonText,
    );
  }
}
