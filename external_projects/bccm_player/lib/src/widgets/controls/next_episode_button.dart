import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';

import '../../helpers/ui/svg_icons.dart';

class NextEpiosodeButton extends HookWidget {
  const NextEpiosodeButton({
    super.key,
    required this.action,
    this.text,
    this.waitDuration = const Duration(seconds: 5),
  });

  final VoidCallback? action;
  final String? text;
  final Duration waitDuration;

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(duration: waitDuration);
    controller.forward().whenComplete(action ?? () {});

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: action,
      child: FocusableActionDetector(
        mouseCursor: MaterialStateMouseCursor.clickable,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              Positioned.fill(
                child: Container(color: Colors.blue.withOpacity(0.75)),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: SizeTransition(
                    axis: Axis.horizontal,
                    sizeFactor: controller,
                    child: Container(color: Colors.blue),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 8),
                      child: SvgPicture.string(
                        SvgIcons.play,
                        width: 20,
                        height: 20,
                      ),
                    ),
                    Text(
                      text ?? 'Next Episode',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium,
                    )
                  ],
                ),
              ),
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white.withOpacity(0.2), width: 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
