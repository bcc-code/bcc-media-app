import 'package:brunstadtv_app/theme/design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:focusable_control_builder/focusable_control_builder.dart';
import 'package:auto_route/auto_route.dart';

import 'package:kids/helpers/svg_icons.dart';

class AppBarCloseButton extends StatelessWidget {
  const AppBarCloseButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    return FocusableControlBuilder(
      onPressed: () {
        context.router.pop();
      },
      builder: (context, control) => Container(
        padding: const EdgeInsets.only(left: 20),
        width: double.infinity,
        alignment: Alignment.centerLeft,
        child: design.buttons.small(
          labelText: '',
          image: SvgPicture.string(SvgIcons.close),
          onPressed: () {
            context.router.pop();
          },
        ),
      ),
    );
  }
}
