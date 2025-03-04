import 'package:bccm_core/bccm_core.dart';
import 'package:bccm_core/platform.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:brunstadtv_app/components/misc/app_update_dialog.dart';

class AppRootInner extends HookConsumerWidget {
  const AppRootInner({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(appConfigProvider, (prev, next) {
      if (next == null) return;
      final packageInfo = ref.read(packageInfoProvider);
      if (isOldAppVersion(current: packageInfo.version, minimum: next.application.clientVersion)) {
        final navigatorContext = globalNavigatorKey.currentState?.overlay?.context;
        if (navigatorContext != null) {
          showDialog(
            context: navigatorContext,
            builder: (context) => const AppUpdateDialog(),
          );
        }
      }
    });
    return child;
  }
}
