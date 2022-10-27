import 'package:brunstadtv_app/components/section.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebSection extends StatefulWidget {
  const WebSection(this.uri, {super.key});

  final Uri uri;

  @override
  State<WebSection> createState() => _WebSectionState();
}

class _WebSectionState extends State<WebSection> {
  WebViewController? webViewController;
  WebResourceError? error;

  void refresh() {
    webViewController?.reload();
  }

  @override
  Widget build(BuildContext context) {
    return Section(
      title: 'Web section',
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: WebView(
            onWebViewCreated: ((controller) {
              webViewController = controller;
            }),
            javascriptChannels: {
              JavascriptChannel(
                name: 'default',
                onMessageReceived: (message) {
                  if (message.message == 'refresh') {}
                },
              )
            },
            onWebResourceError: (error) => this.error = error,
            backgroundColor: const Color(0x00000000),
            initialUrl: widget.uri.toString(),
            javascriptMode: JavascriptMode.unrestricted,
            navigationDelegate: (navigation) async {
              if (navigation.url
                      .toLowerCase()
                      .startsWith('${widget.uri.scheme}:${widget.uri.host}') &&
                  !navigation.url.toLowerCase().contains('launch_url=true')) {
                return NavigationDecision.navigate;
              }
              if (await canLaunchUrlString(navigation.url)) {
                await launchUrlString(navigation.url);
                return NavigationDecision.prevent;
              }
              debugPrint("Error: Couldn't launch the url in the view.");
              return NavigationDecision.prevent;
            }),
      ),
    );
  }
}
