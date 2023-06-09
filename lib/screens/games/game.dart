import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/components/custom_back_button.dart';
import 'package:brunstadtv_app/components/status_indicators/loading_generic.dart';
import 'package:brunstadtv_app/graphql/queries/games.graphql.dart';
import 'package:brunstadtv_app/models/analytics/game_closed.dart';
import 'package:brunstadtv_app/providers/analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../components/status_indicators/error_generic.dart';
import '../../flavors.dart';
import '../../theme/design_system/design_system.dart';

class GameScreen extends HookConsumerWidget {
  const GameScreen({
    Key? key,
    @PathParam() required this.gameId,
  }) : super(key: key);

  final String gameId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = AutoTabsRouter.of(context);
    useEffect(() {
      void tabListener() {
        if (router.topPage?.child != this) {
          Navigator.maybePop(context);
        }
      }

      router.addListener(tabListener);
      return () => router.removeListener(tabListener);
    }, [router]);

    final design = DesignSystem.of(context);
    final gameQuery = useQuery$GetGame(Options$Query$GetGame(variables: Variables$Query$GetGame(id: gameId)));
    final firstLoadDone = useState(false);
    final openedAt = useMemoized(DateTime.now, [gameId]);

    String toCSSRGBA(Color color) {
      return 'rgba(${color.red}, ${color.green}, ${color.blue}, ${color.opacity})';
    }

    if (gameQuery.result.isLoading) {
      return const Scaffold(body: LoadingGeneric());
    }
    final game = gameQuery.result.parsedData?.game;
    if (game == null) {
      final exception = gameQuery.result.exception;
      return Scaffold(
        body: ErrorGeneric(
          onRetry: gameQuery.refetch,
          details: exception?.toString(),
        ),
      );
    }

    final uri = WebUri(game.url);
    uri.replace(queryParameters: {
      'appCode': FlavorConfig.current.applicationCode,
      ...uri.queryParameters,
    });

    debugPrint('Opening game "${game.title}" with url: $uri');

    return WillPopScope(
      onWillPop: () async {
        final timeSpent = DateTime.now().difference(openedAt).inSeconds;
        ref.read(analyticsProvider).gameClosed(GameClosedEvent(gameId: gameId, timeSpent: timeSpent));
        return true;
      },
      child: Scaffold(
        appBar: AppBar(leading: const CustomBackButton(), leadingWidth: 92, title: Text(game.title)),
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
                initialUrlRequest: URLRequest(url: uri),
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
      ),
    );
  }
}
