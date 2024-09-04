import 'package:bccm_core/design_system.dart';
import 'package:bccm_core/platform.dart';
import 'package:bccm_player/bccm_player.dart';
import 'package:brunstadtv_app/helpers/svg_icons.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SkipButton extends HookConsumerWidget {
  const SkipButton({
    super.key,
    required this.controller,
    required this.chapter,
  });

  final BccmPlayerController controller;
  final Fragment$EpisodeChapter chapter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final design = DesignSystem.of(context);
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 300),
      child: design.buttons.small(
        image: SvgPicture.string(SvgIcons.play, width: 12, height: 12),
        labelText: S.of(context).skipTo(chapter.title),
        onPressed: () async {
          ref.read(analyticsProvider).interaction(
                InteractionEvent(
                  interaction: 'skip_to_first_relevant_chapter',
                  pageCode: 'episode',
                  contextElementId: chapter.id,
                  contextElementType: 'episode',
                ),
              );
          await controller.seekTo(Duration(seconds: chapter.start));
          controller.play();
        },
        variant: ButtonVariant.dark,
      ),
    );
  }
}
