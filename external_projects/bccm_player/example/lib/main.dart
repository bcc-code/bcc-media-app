import 'package:bccm_player/bccm_player.dart';
import 'package:bccm_player/plugins/riverpod.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await BccmPlayerInterface.instance.setup();
  final providerContainer = ProviderContainer();
  runApp(
    UncontrolledProviderScope(
      container: providerContainer,
      child: const MyApp(),
    ),
  );
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final player = ref.watch(primaryPlayerProvider);
    if (player == null) {
      return const Center(child: const Text('Player id not set'));
    }
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: [
              Text(player.playerId),
              Text(player.playbackSpeed.toString()),
              VideoPlayerView(
                id: player.playerId,
                useNativeControls: false,
              ),
              ElevatedButton(
                onPressed: () {
                  BccmPlayerInterface.instance.replaceCurrentMediaItem(
                    player.playerId,
                    MediaItem(
                      url:
                          'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
                      mimeType: 'video/mp4',
                    ),
                  );
                },
                child: const Text('Play video'),
              ),
              ...[0.5, 1.0, 2.0].map(
                (speed) => ElevatedButton(
                  onPressed: () {
                    BccmPlayerInterface.instance.setPlaybackSpeed(
                      player.playerId,
                      speed,
                    );
                  },
                  child: Text('playbackSpeed $speed'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
