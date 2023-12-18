import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/helpers/svg_icons.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';
import 'package:brunstadtv_app/providers/tabs.dart';
import 'package:brunstadtv_app/router/router.gr.dart';
import 'package:brunstadtv_app/screens/tabs/profile.dart';
import 'package:brunstadtv_app/theme/design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

TutorialCoachMark createFavoriteShortsGuide(
  BuildContext context, {
  VoidCallback? onFinish,
  VoidCallback? onSkip,
  VoidCallback? onContinue,
}) {
  final design = DesignSystem.of(context);
  final tabInfos = ProviderScope.containerOf(context).read(tabInfosProvider);
  final iconKey = tabInfos.profile.iconKey;
  return TutorialCoachMark(
    targets: [
      TargetFocus(
        identify: 'profile',
        keyTarget: iconKey,
        alignSkip: Alignment.topRight,
        enableOverlayTab: true,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, controller) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SvgPicture.string(
                    SvgIcons.heartFilled,
                    colorFilter: ColorFilter.mode(design.colors.label1, BlendMode.srcATop),
                    width: 24,
                    height: 24,
                  ),
                  Text(
                    S.of(context).likedAndSaved,
                    style: design.textStyles.title2,
                  ),
                  Text(
                    S.of(context).shortsLikedAndSavedDescription,
                    style: design.textStyles.body2.copyWith(color: design.colors.label1),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    ],
    colorShadow: design.colors.tint1,
    skipWidget: design.buttons.small(variant: ButtonVariant.secondary, onPressed: () {}, labelText: S.of(context).close),
    paddingFocus: 15,
    opacityShadow: 0.7,
    imageFilter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
    onFinish: onFinish,
    onClickTarget: (target) {
      print('GUIDE: onClickTarget: $target');
      onContinue?.call();
      if (target.identify == 'profile') {
        context.navigateTo(ProfileWrapperScreenRoute(children: [ProfileScreenRoute(scroll: kProfileScrollQueryLikedShorts)]));
      }
    },
    onClickTargetWithTapPosition: (target, tapDetails) {
      print("GUIDE: target: $target");
      print("GUIDE: clicked at position local: ${tapDetails.localPosition} - global: ${tapDetails.globalPosition}");
    },
    focusAnimationDuration: 300.ms,
    pulseAnimationDuration: 600.ms,
    unFocusAnimationDuration: 300.ms,
    onClickOverlay: (_) => onSkip,
    onSkip: () {
      print("GUIDE: skip");
      onSkip?.call();
      return true;
    },
  );
}
