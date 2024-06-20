import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:bccm_core/platform.dart';
import 'package:bccm_core/design_system.dart';
import '../../../../helpers/webview/main_js_channel.dart';

class WebSection extends StatefulWidget {
  final Fragment$Section$$WebSection data;

  const WebSection(this.data, {super.key});

  @override
  State<WebSection> createState() => _WebSectionState();
}

class _WebSectionState extends State<WebSection> {
  InAppWebViewController? webViewController;
  WebResourceError? error;
  bool loading = true;
  double? height;

  void onWebViewCreated(InAppWebViewController controller) {
    setState(() {
      webViewController = controller;
    });
    final uri = Uri.tryParse(widget.data.url);
    if (uri != null) {
      webViewController?.loadUrl(
        urlRequest: URLRequest(
          url: WebUri.uri(uri),
          allowsCellularAccess: true,
          allowsConstrainedNetworkAccess: true,
          allowsExpensiveNetworkAccess: true,
        ),
      );
    }
    MainJsChannel.register(context, controller, enableAuth: true);
  }

  Widget _heightOrAspectRatio({double? height, required double aspectRatio, required Widget child}) {
    if (height != null) {
      return ConstrainedBox(constraints: BoxConstraints.loose(Size.fromHeight(height)), child: child);
    } else if (aspectRatio != 0) {
      return AspectRatio(aspectRatio: aspectRatio, child: child);
    } else {
      return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 500),
        child: _heightOrAspectRatio(
          height: widget.data.height?.toDouble(),
          aspectRatio: widget.data.widthRatio,
          child: Stack(
            children: [
              InAppWebView(
                initialSettings: InAppWebViewSettings(
                  useHybridComposition: false,
                  isInspectable: kDebugMode,
                  transparentBackground: true,
                  verticalScrollBarEnabled: false,
                  useShouldOverrideUrlLoading: true,
                  horizontalScrollBarEnabled: false,
                  allowsInlineMediaPlayback: true,
                  mediaPlaybackRequiresUserGesture: false,
                  iframeAllowFullscreen: true,
                ),
                onWebViewCreated: onWebViewCreated,
                onLoadStop: (controller, url) {
                  Future.delayed(const Duration(seconds: 0), () => setState(() => loading = false));
                },
                shouldOverrideUrlLoading: (controller, navigationAction) async {
                  if (navigationAction.isForMainFrame) return NavigationActionPolicy.ALLOW;
                  var originalUri = Uri.tryParse(widget.data.url);
                  var navigationUri = navigationAction.request.url?.uriValue;
                  if (originalUri != null &&
                      navigationAction.request.url?.host == originalUri.host &&
                      navigationAction.request.url?.queryParameters['launch_url'] != 'true') {
                    return NavigationActionPolicy.ALLOW;
                  }

                  if (navigationUri != null && await canLaunchUrl(navigationUri)) {
                    await launchUrl(navigationUri, mode: LaunchMode.externalApplication);
                    return NavigationActionPolicy.CANCEL;
                  }
                  debugPrint("Error: Couldn't launch the url in the view.");
                  return NavigationActionPolicy.CANCEL;
                },
              ),
              Positioned.fill(
                child: IgnorePointer(
                  ignoring: !loading,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    switchInCurve: Curves.easeInOut,
                    switchOutCurve: Curves.easeInOut,
                    child: loading
                        ? Shimmer.fromColors(
                            period: const Duration(milliseconds: 1000),
                            baseColor: design.colors.background1,
                            highlightColor: design.colors.background2,
                            child: Container(
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(9), color: design.colors.background2),
                            ),
                          )
                        : null,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
