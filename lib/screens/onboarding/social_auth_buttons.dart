import 'package:brunstadtv_app/providers/auth_state/auth_state.dart';
import 'package:brunstadtv_app/theme/design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../helpers/ui/svg_icons.dart';

class SocialAuthButtons extends ConsumerWidget {
  SocialAuthButtons({
    super.key,
    void Function(Future<bool>)? onLogin,
  }) : onLogin = onLogin ?? ((_) => {});

  final void Function(Future<bool>) onLogin;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Wrap(
      spacing: 12,
      children: [
        GestureDetector(
          onTap: () => onLogin(ref.read(authStateProvider.notifier).login(connection: 'apple')),
          child: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(shape: BoxShape.circle, color: DesignSystem.of(context).colors.label2),
            child: const Center(
              child: Padding(
                padding: EdgeInsets.only(right: 1, bottom: 2),
                child: Icon(
                  Icons.apple,
                  color: Colors.black,
                  size: 36,
                  grade: 14,
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => onLogin(ref.read(authStateProvider.notifier).login(connection: 'google-oauth2')),
          child: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(shape: BoxShape.circle, color: DesignSystem.of(context).colors.label2),
            child: Center(child: SvgPicture.string(SvgIcons.googleLogo, height: 32)),
          ),
        ),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => onLogin(ref.read(authStateProvider.notifier).login()),
          child: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(shape: BoxShape.circle, color: DesignSystem.of(context).colors.label2),
            child: Center(child: SvgPicture.string(SvgIcons.bccLogo, height: 32)),
          ),
        )
      ],
    );
  }
}
