import 'package:auto_route/auto_route.dart';
import 'package:bccm_core/platform.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../components/nav/custom_back_button.dart';
import '../../l10n/app_localizations.dart';

@RoutePage<void>()
class PrivacyPolicyScreen extends ConsumerWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final manager = useWebView(Uri.parse('https://bcc.media/privacy'));
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 92,
        leading: const CustomBackButton(),
        title: Text(S.of(context).privacyPolicy),
      ),
      body: manager == null
          ? null
          : WebViewWidget(
              controller: manager.controller,
            ),
    );
  }
}
