import 'package:flutter/material.dart';

import '../../theme/design_system/design_system.dart';

class IconBadge extends StatelessWidget {
  final String label;
  final Color color;
  final Widget icon;
  final bool disableIconPadding;
  final double iconHeight;

  const IconBadge({
    super.key,
    required this.icon,
    required this.label,
    required this.color,
    this.disableIconPadding = false,
    this.iconHeight = 9,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: disableIconPadding
                  ? const EdgeInsets.all(0)
                  : const EdgeInsets.only(
                      left: 10,
                      top: 8,
                      right: 5,
                      bottom: 8,
                    ),
              child: SizedBox(
                height: iconHeight,
                child: icon,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 1, bottom: 3, right: 9),
              child: Text(
                label,
                style: DesignSystem.of(context).textStyles.overline.copyWith(color: DesignSystem.of(context).colors.onTint),
              ),
            ),
          ],
        )
      ],
    );
  }
}
