import 'package:flutter/material.dart';

import '../../helpers/ui/conditional_parent.dart';
import '../../l10n/app_localizations.dart';
import '../../theme/bccm_colors.dart';
import '../../theme/bccm_typography.dart';
import 'package:local_hero/local_hero.dart';

class SignupPageWrapper extends StatelessWidget {
  const SignupPageWrapper({super.key, required this.children, required this.bottomArea, this.title, this.description, this.heroTitleTag});

  final List<Widget> children;
  final List<Widget> bottomArea;
  final String? title;
  final String? description;
  final String? heroTitleTag;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      child: AnimatedSize(
        duration: Duration(milliseconds: 500),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  if (title != null)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: ConditionalParentWidget(
                        condition: heroTitleTag != null,
                        conditionalBuilder: (child) => LocalHero(tag: 'signup-title', child: child),
                        child: Text(title!, style: BccmTextStyles.headline1),
                      ),
                    ),
                  if (description != null)
                    Text(
                      description!,
                      style: BccmTextStyles.body1.copyWith(color: BccmColors.label3),
                    ),
                  ...children
                ],
              ),
            ),
            ...bottomArea
          ],
        ),
      ),
    ));
  }
}
