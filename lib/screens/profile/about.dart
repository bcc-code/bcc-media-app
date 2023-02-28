import 'package:brunstadtv_app/components/developer_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../components/custom_back_button.dart';
import '../../helpers/version.dart';
import '../../theme/bccm_typography.dart';
import '../../l10n/app_localizations.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  int timesPressedLogo = 0;

  Future<String> get appVersion async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return formatAppVersion(packageInfo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    GestureDetector(
                      onTap: () {
                        timesPressedLogo++;
                        if (timesPressedLogo == 7) {
                          timesPressedLogo = 0;
                          HapticFeedback.heavyImpact();
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return const DeveloperOptions();
                            },
                          );
                        }
                      },
                      child: SizedBox(
                        width: 200,
                        child: Image.asset('assets/images/logo.png', fit: BoxFit.fitWidth),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        S.of(context).bccMediaCenter,
                        style: BccmTextStyles.body2,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const InkWell(
                      onTap: _launchUrl,
                      child: Text(
                        'bcc.media',
                        style: BccmTextStyles.body2,
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
              FutureBuilder<String>(
                future: appVersion,
                builder: (context, snapshot) {
                  return snapshot.hasData
                      ? SelectableText(
                          '${S.of(context).version}: ${snapshot.data!}',
                          style: BccmTextStyles.caption1,
                          textAlign: TextAlign.center,
                        )
                      : const Text('');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final Uri _url = Uri.parse('https://bcc.media');
Future<void> _launchUrl() async {
  await launchUrl(_url, mode: LaunchMode.externalApplication); // We do not particularly care if this fails.
}
