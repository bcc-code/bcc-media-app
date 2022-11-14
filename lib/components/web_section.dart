import 'package:brunstadtv_app/helpers/btv_typography.dart';
import 'package:brunstadtv_app/helpers/utils.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:shimmer/shimmer.dart';
import 'package:brunstadtv_app/helpers/transparent_image.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../helpers/btv_colors.dart';
import 'category_button.dart';
import 'horizontal_slider.dart';
import '../router/router.gr.dart';
import '../graphql/queries/page.graphql.dart';

class WebSection extends StatefulWidget {
  final Fragment$Section$$WebSection data;

  const WebSection(this.data, {super.key});

  @override
  State<WebSection> createState() => _WebSectionState();
}

class _WebSectionState extends State<WebSection> {
  WebViewController? webViewController;
  WebResourceError? error;
  bool loading = true;
  double? height;

  void onWebViewCreated(WebViewController controller) {
    setState(() {
      webViewController = controller;
    });
    webViewController?.loadUrl(widget.data.url);
  }

  void updateHeight() async {
    if (webViewController == null) return;
    double height = double.parse(await webViewController!.runJavascriptReturningResult('document.documentElement.scrollHeight;'));

    if (this.height != height) {
      setState(() {
        this.height = height;
      });
    }
  }

  Widget _heightOrAspectRatio({double? height, required double aspectRatio, required Widget child}) {
    if (height != null) {
      return ConstrainedBox(constraints: BoxConstraints.loose(Size.fromHeight(height)), child: child);
    } else {
      return AspectRatio(aspectRatio: aspectRatio, child: child);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.data.title != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text(
                widget.data.title!,
                style: BtvTextStyles.title2,
              ),
            ),
          _heightOrAspectRatio(
            height: height,
            aspectRatio: widget.data.widthRatio,
            child: Stack(
              children: [
                WebView(
                    backgroundColor: Colors.transparent,
                    javascriptMode: JavascriptMode.unrestricted,
                    onWebViewCreated: onWebViewCreated,
                    initialUrl: widget.data.url,
                    javascriptChannels: {
                      JavascriptChannel(
                        name: 'default',
                        onMessageReceived: (message) {
                          if (message.message == 'refresh') {}
                        },
                      ),
                      JavascriptChannel(
                          name: "Resize",
                          onMessageReceived: (JavascriptMessage message) {
                            updateHeight();
                          }),
                      JavascriptChannel(
                          name: "Router",
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
                      var uri = Uri.tryParse(widget.data.url);
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
                    }),
                IgnorePointer(
                  ignoring: !loading,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: loading ? 1 : 0,
                    curve: Curves.easeInOut,
                    child: Shimmer.fromColors(
                        enabled: loading,
                        baseColor: BtvColors.background1,
                        highlightColor: BtvColors.background2,
                        child: Positioned.fill(
                            child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(9), color: BtvColors.background2)))),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
