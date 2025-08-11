import 'package:brunstadtv_app/helpers/svg_icons.dart';
import 'package:brunstadtv_app/providers/audio_only_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AudioOnlyButton extends HookConsumerWidget {
  const AudioOnlyButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      icon: ref.watch(audioOnlyProvider) ? SvgPicture.string(SvgIcons.camera) : SvgPicture.string(SvgIcons.headset),
      onPressed: () {
        final audioOnly = ref.read(audioOnlyProvider);
        ref.read(audioOnlyProvider.notifier).setValue(!audioOnly);
      },
    );
  }
}
