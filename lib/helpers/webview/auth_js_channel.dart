import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/providers/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthJsChannel {
  ProviderContainer ref;
  AuthJsChannel._(this.ref);

  static void register(BuildContext context, InAppWebViewController controller) {
    final ref = ProviderScope.containerOf(context, listen: false);
    controller.addJavaScriptHandler(
      handlerName: 'flutter_auth',
      callback: AuthJsChannel._(ref).handleMessage,
    );
    debugPrint('flutter_auth added');
  }

  dynamic handleMessage(List<dynamic> arguments) {
    debugPrint('ADJKSDHJKADJKSDHJKASADJKSDHJKASADJKSDHJKASADJKSDHJKASADJKSDHJKASADJKSDHJKASADJKSDHJKASADJKSDHJKASAS');
    if (arguments[0] == 'get_access_token') {
      return ref.read(authStateProvider).auth0AccessToken;
    }
  }
}
