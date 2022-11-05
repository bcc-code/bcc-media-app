import 'dart:math';
import 'dart:ui';

import 'package:brunstadtv_app/helpers/svg_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../helpers/btv_colors.dart';
import '../helpers/btv_typography.dart';
import '../l10n/app_localizations.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key, this.color, this.onPressed});

  final Color? color;

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 17),
          child: Align(
            alignment: Alignment.topLeft,
            child: GestureDetector(
              onTap: () {
                if (onPressed != null) {
                  onPressed!();
                } else {
                  Navigator.maybePop(context);
                }
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SvgPicture.string(SvgIcons.chevronLeft, height: 16),
                  SizedBox(width: 8),
                  Center(
                      child: Text('Home',
                          style: BtvTextStyles.button2.copyWith(height: 1)))
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
