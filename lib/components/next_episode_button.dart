import 'package:brunstadtv_app/helpers/ui/svg_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';

import '../l10n/app_localizations.dart';
import '../theme/design_system/design_system.dart';

class NextEpiosodeButton extends HookWidget {
  const NextEpiosodeButton({
    super.key,
    required this.action,
  });

  final VoidCallback action;
  final waitDuration = const Duration(seconds: 5);

  @override
  Widget build(BuildContext context) {
    final progressOverlayWidth = useState(0.0);

    // ignore: exhaustive_keys
    useMemoized(
      () => SchedulerBinding.instance.scheduleFrameCallback(
        (_) {
          progressOverlayWidth.value = double.infinity;
          Future.delayed(waitDuration, action);
        },
      ),
    );

    final design = DesignSystem.of(context);
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
                child: Container(color: design.colors.tint1.withOpacity(0.75)),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: AnimatedSize(
                    duration: waitDuration,
                    child: Container(
                      width: progressOverlayWidth.value,
                      color: design.colors.tint1,
                    ),
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
                      child: SvgPicture.string(SvgIcons.play, width: 20, height: 20),
                    ),
                    Text(
                      S.of(context).nextEpisode,
                      textAlign: TextAlign.center,
                      style: design.textStyles.button1.copyWith(color: design.colors.label1),
                    )
                  ],
                ),
              ),
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: design.colors.onTint.withOpacity(0.2), width: 1),
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
