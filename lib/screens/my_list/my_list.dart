import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';

import '../../helpers/ui/btv_buttons.dart';
import '../../helpers/ui/svg_icons.dart';
import '../../theme/bccm_colors.dart';
import '../../theme/bccm_typography.dart';

class MyList extends StatelessWidget {
  const MyList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My List In Progress'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 2),
              child: SvgPicture.string(SvgIcons.heartInfo),
            ),
            Text(
              S.of(context).didYouKnowTitle,
              style: BccmTextStyles.headline1,
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 42),
              child: Text(
                S.of(context).didYouKnowContent,
                textAlign: TextAlign.center,
                style: BccmTextStyles.body1.copyWith(color: BccmColors.label3),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 2, left: 8, right: 8),
              child: BtvButton.large(
                labelText: S.of(context).exploreContent,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
