import 'package:brunstadtv_app/api/brunstadtv.dart';
import 'package:brunstadtv_app/components/loading_generic.dart';
import 'package:brunstadtv_app/helpers/page_mixin.dart';
import 'package:brunstadtv_app/helpers/utils.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../components/custom_back_button.dart';
import '../env/env.dart';

class StudyScreen extends ConsumerStatefulWidget {
  final String episodeId = '';

  StudyScreen({
    Key? key,
  }) : super(key: key ?? GlobalKey<StudyScreenState>());

  @override
  ConsumerState<StudyScreen> createState() => StudyScreenState();
}

class StudyScreenState extends ConsumerState<StudyScreen> {
  String pageTitle = 'Matthew 1, 2';
  String url = Env.studyUrl;
  WebViewController? webViewController;
  WebResourceError? error;
  bool loading = true;
  double? height;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 92,
        leading: const CustomBackButton(),
        title: Text(pageTitle),
      ),
      body: Stack(
        children: [
          Opacity(
            opacity: loading ? 0 : 1,
            child: WebView(
              backgroundColor: Colors.transparent,
              javascriptMode: JavascriptMode.unrestricted,
              initialUrl: url,
              javascriptChannels: {
                JavascriptChannel(
                  name: 'default',
                  onMessageReceived: (message) {
                    if (message.message == 'refresh') {}
                  },
                ),
                JavascriptChannel(
                    name: 'Router',
                    onMessageReceived: (JavascriptMessage message) {
                      if (message.message.startsWith('navigate:')) {
                        final path = message.message.substring('navigate:'.length);
                        context.router.navigateNamed(path);
                      }
                    })
              },
              onPageFinished: (_) {
                Future.delayed(const Duration(seconds: 0), () => setState(() => loading = false));
              },
              onWebResourceError: (error) => setState(() => this.error = error),
              navigationDelegate: (navigation) async {
                if (navigation.isForMainFrame) return NavigationDecision.navigate;
                var uri = Uri.tryParse(url);
                if (uri != null &&
                    navigation.url.toLowerCase().startsWith('${uri.scheme}:${uri.host}') &&
                    !navigation.url.toLowerCase().contains('launch_url=true')) {
                  return NavigationDecision.navigate;
                }

                if (uri != null && await canLaunchUrlString(navigation.url)) {
                  await launchUrlString(navigation.url, mode: LaunchMode.externalApplication);
                  return NavigationDecision.prevent;
                }
                debugPrint("Error: Couldn't launch the url in the view.");
                return NavigationDecision.prevent;
              },
            ),
          ),
          if (loading) const LoadingGeneric()
        ],
      ),
    );
  }
}
