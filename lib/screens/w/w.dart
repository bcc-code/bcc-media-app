import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/components/status/error_generic.dart';
import 'package:brunstadtv_app/components/status/loading_generic.dart';
import 'package:bccm_core/platform.dart';
import 'package:brunstadtv_app/helpers/main_js_channel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../components/nav/custom_back_button.dart';

@RoutePage<void>()
class WebviewScreen extends HookConsumerWidget {
  final String redirectCode;

  const WebviewScreen({
    super.key,
    @PathParam() required this.redirectCode,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    getRedirect() async {
      final gqlClient = ref.read(bccmGraphQLProvider);
      final redirect =
          await gqlClient.query$GetRedirectUrl(Options$Query$GetRedirectUrl(variables: Variables$Query$GetRedirectUrl(id: redirectCode)));
      return redirect.parsedData?.redirect;
    }

    final redirectFuture = useState(useMemoized(getRedirect));
    final redirectSnapshot = useFuture(redirectFuture.value);

    final data = redirectSnapshot.data;
    final uri = useMemoized(() {
      return data == null ? null : Uri.tryParse(data.url);
    }, [data]);
    final manager = useWebView(uri, setup: (m) {
      MainJsChannel.register(context, m, enableAuth: data?.requiresAuthentication ?? false);
    });

    final firstLoadDone = useListenableSelector(manager?.navigation.initialLoadDone, () => manager?.navigation.initialLoadDone.value ?? false);

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
            if (manager != null)
              Opacity(
                opacity: firstLoadDone ? 1 : 0,
                child: WebViewWidget(
                  controller: manager.controller,
                  gestureRecognizers: {Factory<VerticalDragGestureRecognizer>(() => VerticalDragGestureRecognizer())},
                ),
              ),
            if (!firstLoadDone) const LoadingGeneric(),
          ],
        ],
      ),
    );
  }
}
