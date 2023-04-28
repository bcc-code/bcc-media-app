import 'package:bccm_player/bccm_player.dart';
import 'package:bccm_player/plugins/riverpod.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';

final bccmPlayerInterface = Provider<BccmPlayerInterface>((ref) {
  return BccmPlayerInterface.instance;
});

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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: [
              Text(player?.playerId ?? 'Player id not set'),
              if (player?.playerId != null) BccmPlayer(id: player!.playerId),
            ],
          ),
        ),
      ),
    );
  }
}
