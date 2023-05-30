import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/helpers/ui/btv_buttons.dart';
import 'package:brunstadtv_app/router/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GamesListScreen extends HookConsumerWidget {
  const GamesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text("Games")),
      body: ListView(
        children: [
          // Card representing a game with a placeholder image and a button to start the game
          GestureDetector(
            onTap: () => context.router.navigate(const GameScreenRoute()),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Column(
                  children: [
                    // Unsplash image
                    Image.network(
                      'https://source.unsplash.com/random/?games&w=1000&q=80',
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
