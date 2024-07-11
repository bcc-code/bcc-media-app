import 'package:bccm_core/design_system.dart';
import 'package:bccm_core/platform.dart';
import 'package:brunstadtv_app/helpers/svg_icons.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SkipButton extends HookConsumerWidget {
  const SkipButton({
    super.key,
    required this.chapter,
    required this.onTap,
  });

  final Fragment$EpisodeChapter chapter;
  final void Function() onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final design = DesignSystem.of(context);
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: FocusableActionDetector(
        mouseCursor: WidgetStateMouseCursor.clickable,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              Positioned.fill(
                child: Container(color: design.colors.background1),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 8),
                      child: SvgPicture.string(
                        SvgIcons.play,
                        width: 16,
                        height: 16,
                        colorFilter: ColorFilter.mode(Theme.of(context).textTheme.titleMedium?.color ?? Colors.white, BlendMode.srcIn),
                      ),
                    ),
                    Text(
                      S.of(context).skipTo(chapter.title),
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
