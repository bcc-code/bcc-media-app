import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class RouterJsChannel {
  final StackRouter router;
  RouterJsChannel._(this.router);

  static void register(BuildContext context, InAppWebViewController controller) {
    controller.addJavaScriptHandler(
      handlerName: 'flutter_router_channel',
      callback: RouterJsChannel._(context.router).handleMessage,
    );
  }

  void handleMessage(List<dynamic> arguments) {
    if (arguments[0] == 'navigate' && arguments[1] is String) {
      router.navigateNamed(arguments[1]);
    }
  }
}
