import 'package:auto_route/annotations.dart';
import 'package:brunstadtv_app/components/status_indicators/loading_generic.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../theme/design_system/design_system.dart';

//https://app.bcc.media/game-embeds/v1

const baseUrl = 'https://app.bcc.media/game-embeds/v2/';

const gameUrls = {
  'heart-defense': '$baseUrl?game=heart-defense',
  'cable-connector': '$baseUrl?game=cable-connector',
};

class GameScreen extends HookConsumerWidget {
  const GameScreen({
    Key? key,
    @PathParam() required this.gameId,
  }) : super(key: key);

  final String gameId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final design = DesignSystem.of(context);
    final gameFuture = useMemoized(() {
      return Future.delayed(const Duration(milliseconds: 500), () => gameUrls[gameId]);
    }, [gameId]);
    final gameSnapshot = useFuture(gameFuture);
    final firstLoadDone = useState(false);

    String toCSSRGBA(Color color) {
      return 'rgba(${color.red}, ${color.green}, ${color.blue}, ${color.opacity})';
    }

    if (gameSnapshot.connectionState == ConnectionState.waiting) {
      return Scaffold(appBar: AppBar(title: Text("Game")), body: LoadingGeneric());
    }

    return Scaffold(
      appBar: AppBar(title: Text("Game")),
      body: Stack(
        children: [
          Opacity(
            opacity: firstLoadDone.value ? 1 : 0,
            child: InAppWebView(
              initialSettings: InAppWebViewSettings(
                useHybridComposition: false,
                transparentBackground: true,
                verticalScrollBarEnabled: false,
                useShouldOverrideUrlLoading: true,
              ),
              gestureRecognizers: {
                Factory<VerticalDragGestureRecognizer>(() => VerticalDragGestureRecognizer()),
                Factory<HorizontalDragGestureRecognizer>(() => HorizontalDragGestureRecognizer()),
                Factory<ScaleGestureRecognizer>(() => ScaleGestureRecognizer()),
                Factory<TapGestureRecognizer>(() => TapGestureRecognizer()),
                Factory<LongPressGestureRecognizer>(() => LongPressGestureRecognizer()),
                Factory<PanGestureRecognizer>(() => PanGestureRecognizer()),
                Factory<ForcePressGestureRecognizer>(() => ForcePressGestureRecognizer()),
              },
              preventGestureDelay: true,
              initialUrlRequest: URLRequest(url: WebUri(gameSnapshot.data!)),
              onLoadResource: (controller, url) async {
                await controller.injectCSSCode(source: '''
                    :root {
                      --gradient-dark: linear-gradient(90deg, ${toCSSRGBA(design.colors.background1)}, ${toCSSRGBA(design.colors.background1)});
                    }
                  ''');
              },
              onLoadStop: (controller, url) {
                firstLoadDone.value = true;
              },
            ),
          ),
          if (!firstLoadDone.value) const LoadingGeneric(),
        ],
      ),
    );
  }
}
