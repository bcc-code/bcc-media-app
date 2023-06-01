import 'package:brunstadtv_app/components/app_version.dart';
import 'package:brunstadtv_app/components/developer_options.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../components/custom_back_button.dart';
import '../../components/web/dialog_on_web.dart';
import '../../flavors.dart';
import '../../l10n/app_localizations.dart';
import '../../theme/design_system/design_system.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DialogOnWeb(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 44,
          leadingWidth: 92,
          leading: const CustomBackButton(),
          title: Text(S.of(context).about),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      DeveloperOptionsTrigger(
                        child: SizedBox(
                          child: Image(
                            image: FlavorConfig.current.images.logo,
                            height: FlavorConfig.current.images.logoHeight,
                            gaplessPlayback: true,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 16),
                        child: Text(
                          FlavorConfig.current.strings(context).aboutText,
                          style: DesignSystem.of(context).textStyles.body2,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          await launchUrl(
                            FlavorConfig.current.strings(context).contactWebsite,
                            mode: LaunchMode.externalApplication,
                          ); // We do not particularly care if this fails.
                        },
                        child: Text(
                          FlavorConfig.current.strings(context).contactWebsite.host,
                          style: DesignSystem.of(context).textStyles.body2,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        '${S.of(context).youCanContactUsAt} ${FlavorConfig.current.strings(context).contactEmail}',
                        style: DesignSystem.of(context).textStyles.body2,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                AppVersion()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
