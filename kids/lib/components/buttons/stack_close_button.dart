import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/theme/design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kids/helpers/svg_icons.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

class StackCloseButton extends StatelessWidget {
  const StackCloseButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bp = ResponsiveBreakpoints.of(context);
    final design = DesignSystem.of(context);
    return Positioned(
      top: 0,
      left: 0,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(bp.smallerThan(TABLET) ? 20 : 40),
          child: design.buttons.responsive(
            labelText: '',
            onPressed: () => context.router.pop(),
            image: SvgPicture.string(SvgIcons.close),
          ),
        ),
      ),
    );
  }
}
