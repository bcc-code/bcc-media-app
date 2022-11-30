import 'package:brunstadtv_app/components/developer_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../components/custom_back_button.dart';
import '../../helpers/btv_typography.dart';
import '../../helpers/utils.dart';
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
                        style: BtvTextStyles.body2,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const Text(
                      'www.brunstad.tv',
                      style: BtvTextStyles.body2,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              FutureBuilder<String>(
                future: appVersion,
                builder: (context, snapshot) {
                  return snapshot.hasData
                      ? Text(
                          '${S.of(context).version}: ${snapshot.data!}',
                          style: BtvTextStyles.caption1,
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
