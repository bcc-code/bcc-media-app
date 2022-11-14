import 'package:brunstadtv_app/helpers/btv_typography.dart';
import 'package:brunstadtv_app/helpers/utils.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:webview_flutter/webview_flutter.dart';

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

  void onWebViewCreated(WebViewController controller) {
    setState(() {
      webViewController = controller;
    });
    webViewController?.loadUrl(widget.data.url);
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
            Container(
              child: Text(
                widget.data.title!,
                style: BtvTextStyles.title2,
              ),
            ),
          AspectRatio(
            aspectRatio: 16 / 9,
            child: WebView(
              backgroundColor: Colors.transparent,
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: onWebViewCreated,
              initialUrl: widget.data.url,
            ),
          )
        ],
      ),
    );
  }
}
