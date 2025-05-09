import 'package:bccm_core/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kids/helpers/svg_icons.dart';
import 'package:responsive_framework/responsive_framework.dart';

class NotificationPromtDismissButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const NotificationPromtDismissButton({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final bp = ResponsiveBreakpoints.of(context);
    final design = DesignSystem.of(context);
    final isSmall = bp.smallerThan(TABLET);

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: isSmall
            ? SvgPicture.string(
                SvgIcons.close,
                colorFilter: ColorFilter.mode(design.colors.label1, BlendMode.srcIn),
                width: 24,
              )
            : design.buttons.small(
                variant: ButtonVariant.secondary,
                image: SvgPicture.string(SvgIcons.close),
                onPressed: () {},
              ),
      ),
      onTap: () => onPressed?.call(),
    );
  }
}
