import "dart:async";
import 'package:bccm_core/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kids/helpers/svg_icons.dart';

class CountdownCircle extends HookConsumerWidget {
  final int duration;

  CountdownCircle({
    super.key,
    required this.duration,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final design = DesignSystem.of(context);
    Timer timer;

    // Progress in percent
    var progress = useState(0.0);

    useEffect(() {
      timer = Timer.periodic(const Duration(milliseconds: 1), (timer) {
        progress.value = timer.tick * (1 / duration) / 1000;
      });

      return timer.cancel;
    }, []);

    return Stack(
      children: [
        Center(child: _RadialProgress(progress: progress.value)),
        Center(
          child: design.buttons.small(
            onPressed: () {},
            variant: ButtonVariant.secondary,
            image: SvgPicture.string(SvgIcons.next),
          ),
        ),
      ],
    );
  }
}

class _RadialProgress extends StatelessWidget {
  const _RadialProgress({
    required this.progress,
  });

  final double progress;

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);

    return SizedBox(
      width: 56,
      height: 56,
      child: CircularProgressIndicator(
        value: progress,
        color: design.colors.background1,
        strokeWidth: 3,
      ),
    );
  }
}
