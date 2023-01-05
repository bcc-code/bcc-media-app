import 'package:flutter/material.dart';

import '../graphql/queries/achievements.graphql.dart';
import '../helpers/image_utils.dart';
import 'dialog_with_image.dart';

class AchievementDialog extends StatelessWidget {
  const AchievementDialog({super.key, required this.achievement, this.dismissButtonText});

  final Fragment$Achievement achievement;
  final String? dismissButtonText;

  @override
  Widget build(BuildContext context) {
    final image = achievement.image;
    return DialogWithImage(
      image: image == null ? const SizedBox.shrink() : SizedBox(height: 180, child: simpleFadeInImage(url: image)),
      title: achievement.title,
      description: achievement.description,
      dismissButtonText: dismissButtonText,
    );
  }
}
