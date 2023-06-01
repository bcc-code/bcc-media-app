import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../theme/design_system/design_system.dart';

const games = {
  'heart-defense': 'https://app.bcc.media/game-embeds/heart-defense-v2',
};

class GameScreen extends HookConsumerWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final design = DesignSystem.of(context);

    String toCSSRGBA(Color color) {
      return 'rgba(${color.red}, ${color.green}, ${color.blue}, ${color.opacity})';
    }

    return Scaffold(
      appBar: AppBar(title: Text("Game")),
      body: Stack(
        children: [
          InAppWebView(
            preventGestureDelay: true,
            initialUrlRequest: URLRequest(url: WebUri(games['heart-defense']!)),
            onLoadResource: (controller, resource) {
              controller.injectCSSCode(source: '''
                  :root {
                    --gradient-dark: linear-gradient(90deg, ${toCSSRGBA(design.colors.background1)}, ${toCSSRGBA(design.colors.background1)});
                  }
                ''');
            },
          ),
        ],
      ),
    );
  }
}
