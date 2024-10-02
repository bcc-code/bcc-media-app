import 'package:auto_route/auto_route.dart';
import 'package:bccm_core/platform.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../components/nav/custom_back_button.dart';
import '../../l10n/app_localizations.dart';

@RoutePage()
class TermsOfUseScreen extends HookConsumerWidget {
  const TermsOfUseScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final manager = useWebViewManager(Uri.parse('https://bcc.media/terms-of-use/'), strictUriCheck: (u) {
      return u.path.contains('/terms-of-use');
    });
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 92,
        leading: const CustomBackButton(),
        title: Text(S.of(context).termsOfUse),
      ),
      body: manager == null
          ? null
          : WebViewWidget(
              controller: manager.controller,
              gestureRecognizers: {Factory<VerticalDragGestureRecognizer>(() => VerticalDragGestureRecognizer())},
            ),
    );
  }
}
