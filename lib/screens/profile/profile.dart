import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/helpers/ui/btv_buttons.dart';
import 'package:brunstadtv_app/helpers/ui/svg_icons.dart';
import 'package:brunstadtv_app/providers/auth_state/auth_state.dart';
import 'package:brunstadtv_app/providers/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:universal_io/io.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../components/custom_back_button.dart';
import '../../components/web/dialog_on_web.dart';
import '../../helpers/languages.dart';
import '../../l10n/app_localizations.dart';
import '../../router/router.gr.dart';
import '../../components/avatar.dart';
import '../../components/setting_list.dart';

import '../../helpers/version.dart';
import '../../helpers/extensions.dart';

class Profile extends ConsumerStatefulWidget {
  const Profile({super.key});

  @override
  ConsumerState<Profile> createState() => _ProfileState();
}

class _ProfileState extends ConsumerState<Profile> {
  List<OptionButton> get _supportButtons {
    return [
      if (!ref.read(authStateProvider).guestMode)
        OptionButton(
            optionName: S.of(context).contactSupport,
            onPressed: () {
              context.router.push(const ContactSupportRoute());
            })
      else
        OptionButton(
          optionName: S.of(context).contactSupport,
          onPressed: () => _contactSupportEmail(),
        ),
      OptionButton(
          optionName: S.of(context).about,
          onPressed: () {
            context.router.push(const AboutScreenRoute());
          }),
    ];
  }

  List<OptionButton> get _termsAndPrivacyOptions {
    return [
      OptionButton(
        optionName: S.of(context).privacyPolicy,
        currentSelection: '(external page)',
        onPressed: () {
          launchUrlString('https://bcc.media/privacy', mode: LaunchMode.externalApplication);
        },
      ),

      // TODO: Terms & conditions
    ];
  }

  List<OptionButton> get _settingsOptions {
    var settings = ref.watch(settingsProvider);
    return [
      OptionButton(
          optionName: S.of(context).appLanguage,
          currentSelection: getLanguageName(settings.appLanguage.languageCode),
          onPressed: () {
            context.router.push(const AppLanguageScreenRoute());
          }),
      OptionButton(
          optionName: S.of(context).audioLanguage,
          currentSelection: getLanguageName(settings.audioLanguage),
          onPressed: () {
            context.router.push(const AppAudioLanguageRoute());
          }),
      OptionButton(
          optionName: S.of(context).subtitleLanguage,
          currentSelection: settings.subtitleLanguage == null ? S.of(context).none : getLanguageName(settings.subtitleLanguage),
          onPressed: () {
            context.router.push(const AppSubtitleLanguageRoute());
          })
    ];
  }

  Future<void> loginAction(BuildContext context) async {
    final success = await ref.read(authStateProvider.notifier).login();
    if (success && context.mounted) {
      context.router.root.popUntil((route) => false);
      context.router.root.push(const TabsRootScreenRoute());
    } else {
      //loginError = 'Login failed';
    }
  }

  Future<void> _contactSupportEmail() async {
    String? deviceModel, manufacturer, os, screenSize, appVer, userId;
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    final screenWidth = WidgetsBinding.instance.window.physicalSize.width.toInt().toString();
    final screenHeight = WidgetsBinding.instance.window.physicalSize.height.toInt().toString();
    screenSize = '${screenHeight}x$screenWidth';
    appVer = formatAppVersion(packageInfo);

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await DeviceInfoPlugin().androidInfo;
      os = '${Platform.operatingSystem.capitalized} ${androidInfo.version.release}';
      deviceModel = androidInfo.model;
      manufacturer = androidInfo.manufacturer;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await DeviceInfoPlugin().iosInfo;
      os = '${Platform.operatingSystem.capitalized} ${iosInfo.systemVersion}';
      deviceModel = iosInfo.model;
      manufacturer = 'Apple';
    } else {
      //Windows or Chrome or Linux
    }

    final Uri mailtoUri = Uri(
      scheme: 'mailto',
      path: 'support@bcc.media',
      query: 'subject=App Support&body='
          '\n\n\n\n\n\n-- Technical details -- \n'
          'Device Model: $deviceModel\n'
          'Manufacturer: $manufacturer\n'
          'Operating System: $os\n'
          'Screen Size: $screenSize\n'
          'App Version: $appVer',
    );
    if (!await launchUrl(mailtoUri)) {
      debugPrint('Could not launchUrl $mailtoUri');
      throw Exception('Could not launch $mailtoUri');
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.read(authStateProvider.select((value) => value.user));
    return DialogOnWeb(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 44,
          leadingWidth: 92,
          leading: const CustomBackButton(),
          title: Text(S.of(context).profileTab),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  if (user != null)
                    const Avatar()
                  else
                    Padding(
                      padding: const EdgeInsets.only(top: 24, bottom: 16),
                      child: Padding(padding: const EdgeInsets.all(6), child: SvgPicture.string(SvgIcons.avatar)),
                    ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (user != null)
                          GestureDetector(
                            onLongPress: () => ref.read(authStateProvider.notifier).logout(manual: false),
                            child: BtvButton.smallSecondary(
                              onPressed: () => {ref.read(authStateProvider.notifier).logout()},
                              labelText: S.of(context).logOutButton,
                            ),
                          )
                        else
                          BtvButton.small(
                            onPressed: () => context.router.navigate(OnboardingScreenRoute()),
                            labelText: S.of(context).signInOrSignUp,
                          )
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      SettingList(buttons: _settingsOptions),
                      const SizedBox(height: 24),
                      SettingList(buttons: _supportButtons),
                      const SizedBox(height: 24),
                      SettingList(buttons: _termsAndPrivacyOptions),
                      const SizedBox(height: 48),
                      if (user != null)
                        SettingList(
                          buttons: [
                            OptionButton(
                              optionName: S.of(context).deleteMyAccount,
                              onPressed: () => context.router.navigate(const AccountDeletionScreenRoute()),
                            ),
                          ],
                        )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
