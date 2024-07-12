import 'package:bccm_core/bccm_core.dart';
import 'package:bccm_core/design_system.dart';
import 'package:bccm_core/platform.dart';
import 'package:bccm_player/controls.dart';
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
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 300),
      child: design.buttons.small(
        image: SvgPicture.string(SvgIcons.play, width: 12, height: 12),
        labelText: S.of(context).skipTo(chapter.title),
        onPressed: onTap,
        variant: ButtonVariant.dark,
      ),
    );
  }
}
