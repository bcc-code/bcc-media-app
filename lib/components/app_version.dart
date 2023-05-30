import 'package:brunstadtv_app/components/developer_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../components/custom_back_button.dart';
import '../../components/web/dialog_on_web.dart';
import '../../flavors.dart';
import '../../helpers/version.dart';

import '../../l10n/app_localizations.dart';
import '../../theme/design_system/design_system.dart';

class AppVersion extends HookWidget {
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
