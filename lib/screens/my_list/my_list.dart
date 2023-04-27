import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';

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
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.string(SvgIcons.heart),
              Text(S.of(context).didYouKnowTitle, style: BccmTextStyles.headline1),
              Padding(
                padding: EdgeInsets.only(top: 12, bottom: 42),
                child: Text(
                  S.of(context).didYouKnowContent,
                  textAlign: TextAlign.center,
                  style: BccmTextStyles.body1,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shadowColor: BccmColors.tint1,
                  shape: const RoundedRectangleBorder(
                    side: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                  ),
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: () {},
                child: Text(
                  S.of(context).exploreContent,
                  style: BccmTextStyles.button1.copyWith(color: BccmColors.onTint),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
