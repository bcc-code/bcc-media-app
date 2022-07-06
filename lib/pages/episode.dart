
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_app/components/player.dart';

class EpisodePage extends StatelessWidget {
  final PlayerType playerType;
  const EpisodePage({super.key, required this.playerType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Episode'),
      ),
      body: ListView(
        children: [Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: BccmPlayer(type: playerType),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Navigate back to first screen when tapped.
                  Navigator.of(context).pop();
                },
                child: const Text('Go back!'),
              ),
            ),
          ],
        ),]
      ),
    );
  }
}