import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../components/nav/custom_back_button.dart';
import '../../l10n/app_localizations.dart';

@RoutePage<void>()
class PrivacyPolicyScreen extends ConsumerWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initialUri = Uri.parse('https://bcc.media/privacy');
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 92,
        leading: const CustomBackButton(),
        title: Text(S.of(context).privacyPolicy),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: WebUri.uri(initialUri),
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
        ),
        shouldOverrideUrlLoading: (c, navigationAction) async {
          if (navigationAction.request.url?.host == initialUri.host && navigationAction.request.url?.path.contains('privacy') == true) {
            return NavigationActionPolicy.ALLOW;
          }
          return NavigationActionPolicy.CANCEL;
        },
      ),
    );
  }
}
