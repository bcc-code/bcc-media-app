import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../helpers/version.dart';

import '../../../l10n/app_localizations.dart';
import 'package:bccm_core/design_system.dart';

class AppVersion extends HookWidget {
  const AppVersion({super.key});

  @override
  Widget build(BuildContext context) {
    final snapshot = useFuture(useMemoized(() => PackageInfo.fromPlatform().then((value) => formatAppVersion(value))));
    if (snapshot.hasData) {
      return SelectableText(
        '${S.of(context).version}: ${snapshot.data!}',
        style: DesignSystem.of(context).textStyles.caption1,
        textAlign: TextAlign.center,
      );
    } else {
      return const Text('');
    }
  }
}
