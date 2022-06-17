
import 'package:flutter/material.dart';
import 'package:my_app/components/player.dart';

class EpisodeScreen extends StatelessWidget {
  const EpisodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Episode'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: SizedBox(width: double.infinity, height: 250, child: BccmPlayer()),
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
      ),
    );
  }
}