import 'package:brunstadtv_app/providers/audio_only_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AudioOnlyButton extends HookConsumerWidget {
  const AudioOnlyButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final audioOnly = ref.watch(audioOnlyProvider);
    return IconButton(
      icon: Icon(
        audioOnly ? Icons.videocam_outlined : Icons.videocam_off_outlined,
        color: Colors.white,
        size: 24,
      ),
      onPressed: () {
        ref.read(audioOnlyProvider.notifier).setValue(!audioOnly);
      },
    );
  }
}
