import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/components/web/dialog_on_web.dart';
import 'package:brunstadtv_app/components/buttons/btv_buttons.dart';
import 'package:flutter/material.dart';

import '../../components/contact/device_info_table.dart';
import '../../l10n/app_localizations.dart';
import '../../theme/design_system/design_system.dart';
import '../../components/nav/general_app_bar.dart';

@RoutePage<void>()
class DeviceInfoScreen extends StatelessWidget {
  const DeviceInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    return DialogOnWeb(
      child: Scaffold(
        appBar: GeneralAppBar(
          leftActions: [
            BtvButton(
              labelText: S.of(context).close,
              onPressed: () => context.router.pop(),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: Text(
                  S.of(context).deviceInfo,
                  style: design.textStyles.headline1,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 9),
                child: Text(
                  S.of(context).deviceInfoPageDesc,
                  style: design.textStyles.body2.copyWith(color: design.colors.label1),
                ),
              ),
              const DeviceInfoTable(),
            ],
          ),
        ),
      ),
    );
  }
}
