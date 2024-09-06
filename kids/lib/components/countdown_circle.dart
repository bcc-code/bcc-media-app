import 'package:bccm_core/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kids/helpers/svg_icons.dart';

class CountdownCircle extends HookConsumerWidget {
  // Total time in milliseconds
  final int total;
  // Current time in milliseconds
  final int value;
  // Callback when pressing the button
  final void Function() onPressed;

  const CountdownCircle({
    super.key,
    required this.total,
    required this.value,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final design = DesignSystem.of(context);

    return Stack(
      children: [
        Center(
          child: SizedBox(
            width: 56,
            height: 56,
            child: CircularProgressIndicator(
              value: 1 - value / total,
              color: design.colors.background1,
              strokeWidth: 3,
            ),
          ),
        ),
        Center(
          child: design.buttons.small(
            onPressed: onPressed,
            variant: ButtonVariant.secondary,
            image: SvgPicture.string(SvgIcons.next),
          ),
        ),
      ],
    );
  }
}
