import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GameScreen extends HookConsumerWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text("Game")),
      body: Stack(
        children: [
          InAppWebView(
            preventGestureDelay: true,
            initialUrlRequest: URLRequest(url: WebUri('')),
          ),
          Positioned(
            top: 200,
            left: 10,
            child: ElevatedButton(
              onPressed: () {
                debugPrint('Tapped');
              },
              child: Text('Tap me'),
            ),
          ),
        ],
      ),
    );
  }
}
