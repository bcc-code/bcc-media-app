import 'package:bccm_core/bccm_core.dart';
import 'package:brunstadtv_app/graphql/queries/application.graphql.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';
import 'package:bccm_core/design_system.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:universal_io/io.dart';
import 'package:url_launcher/url_launcher_string.dart';

int getExtendedVersionNumber(String version) {
  List versionCells = version.split('.');
  versionCells = versionCells.map((i) => int.parse(i)).toList();
  return versionCells[0] * 100000 + versionCells[1] * 1000 + versionCells[2];
}

String formatAppVersion(PackageInfo packageInfo) {
  return '${packageInfo.version}+${packageInfo.buildNumber}';
}

void showDialogIfOldAppVersion(BuildContext context, Query$Application appConfig) {
  final packageInfo = ProviderScope.containerOf(context).read(packageInfoProvider);
  final minVersionNumber = appConfig.application.clientVersion;
  final currentVersionNumber = packageInfo.version;
  if (getExtendedVersionNumber(minVersionNumber) > getExtendedVersionNumber(currentVersionNumber) && context.mounted) {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text(
              S.of(context).appUpdateTitle,
              style: DesignSystem.of(context).textStyles.title3,
            ),
            contentPadding: const EdgeInsets.all(24).copyWith(top: 8),
            children: [
              Padding(padding: const EdgeInsets.only(bottom: 16), child: Text(S.of(context).appUpdateRequest)),
              DesignSystem.of(context).buttons.medium(
                  onPressed: () {
                    if (Platform.isIOS) {
                      launchUrlString('itms-apps://itunes.apple.com', mode: LaunchMode.externalApplication);
                    } else if (Platform.isAndroid) {
                      launchUrlString('market://details?id=tv.brunstad.app', mode: LaunchMode.externalApplication);
                    }
                  },
                  labelText: S.of(context).appUpdateAccepted)
            ],
          );
        });
  }
}
