import 'package:flutter/widgets.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:url_launcher/url_launcher.dart';

Future<NavigationActionPolicy> Function(InAppWebViewController, NavigationAction)? shouldOverrideUrlLoading(String originalUrl) =>
    (controller, navigationAction) async {
      //if (navigationAction.isForMainFrame) return NavigationActionPolicy.ALLOW;
      var originalUri = Uri.tryParse(originalUrl);
      var navigationUri = navigationAction.request.url?.uriValue;
      if (navigationAction.request.url?.queryParameters['load_in_app']?.toLowerCase() == 'true' ||
          originalUri != null &&
              navigationAction.request.url?.host == originalUri.host &&
              navigationAction.request.url?.queryParameters['launch_url'] != 'true') {
        return NavigationActionPolicy.ALLOW;
      }

      if (navigationUri != null && navigationAction.request.url?.queryParameters['launch_url'] == 'true' && await canLaunchUrl(navigationUri)) {
        await launchUrl(navigationUri, mode: LaunchMode.externalApplication);
        return NavigationActionPolicy.CANCEL;
      }
      debugPrint("Error: Couldn't launch the url in the view.");
      return NavigationActionPolicy.CANCEL;
    };
