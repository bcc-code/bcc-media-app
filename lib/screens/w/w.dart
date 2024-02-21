import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/components/status/error_generic.dart';
import 'package:brunstadtv_app/components/status/loading_generic.dart';
import 'package:bccm_core/platform.dart';
import 'package:brunstadtv_app/helpers/constants.dart';
import 'package:brunstadtv_app/helpers/webview/should_override_url_loading.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../components/nav/custom_back_button.dart';
import '../../helpers/webview/main_js_channel.dart';

@RoutePage<void>()
class WebviewScreen extends HookConsumerWidget {
  final String redirectCode;

  const WebviewScreen({
    super.key,
    @PathParam() required this.redirectCode,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final webViewController = useState<InAppWebViewController?>(null);
    final firstLoadDone = useState(false);

    getRedirect() async {
      final gqlClient = ref.read(bccmGraphQLProvider);
      final redirect =
          await gqlClient.query$GetRedirectUrl(Options$Query$GetRedirectUrl(variables: Variables$Query$GetRedirectUrl(id: redirectCode)));
      return redirect.parsedData?.redirect;
    }

    final redirectFuture = useState(useMemoized(getRedirect));
    final redirectSnapshot = useFuture(redirectFuture.value);

    void onWebViewCreated(InAppWebViewController controller) async {
      final data = redirectSnapshot.data;
      MainJsChannel.register(context, controller, enableAuth: data?.requiresAuthentication ?? false);
      webViewController.value = controller;
    }

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 92,
        leading: const CustomBackButton(),
      ),
      body: Stack(
        children: [
          if (redirectSnapshot.connectionState == ConnectionState.waiting)
            const LoadingGeneric()
          else if (!redirectSnapshot.hasData)
            ErrorGeneric(onRetry: () {
              redirectFuture.value = getRedirect();
            })
          else ...[
            Opacity(
              opacity: firstLoadDone.value ? 1 : 0,
              child: InAppWebView(
                initialUrlRequest: URLRequest(
                  url: WebUri.uri(Uri.parse(redirectSnapshot.data!.url)),
                  allowsCellularAccess: true,
                  allowsConstrainedNetworkAccess: true,
                  allowsExpensiveNetworkAccess: true,
                ),
                gestureRecognizers: {Factory<VerticalDragGestureRecognizer>(() => VerticalDragGestureRecognizer())},
                initialSettings: InAppWebViewSettings(
                  useHybridComposition: false,
                  transparentBackground: true,
                  verticalScrollBarEnabled: false,
                  useShouldOverrideUrlLoading: true,
                  allowsInlineMediaPlayback: true,
                  mediaPlaybackRequiresUserGesture: false,
                  isInspectable: kDebugMode,
                  iframeAllowFullscreen: true,
                ),
                onWebViewCreated: onWebViewCreated,
                onLoadStop: (controller, url) {
                  firstLoadDone.value = true;
                },
                shouldOverrideUrlLoading: shouldOverrideUrlLoading(redirectSnapshot.data!.url),
              ),
            ),
            if (!firstLoadDone.value) const LoadingGeneric(),
          ],
        ],
      ),
    );
  }
}
