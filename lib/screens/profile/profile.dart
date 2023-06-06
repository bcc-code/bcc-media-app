import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/components/parents/parental_gate.dart';
import 'package:brunstadtv_app/helpers/ui/btv_buttons.dart';
import 'package:brunstadtv_app/helpers/ui/svg_icons.dart';
import 'package:brunstadtv_app/providers/auth_state/auth_state.dart';
import 'package:brunstadtv_app/providers/feature_flags.dart';
import 'package:brunstadtv_app/providers/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:universal_io/io.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../components/custom_back_button.dart';
import '../../components/web/dialog_on_web.dart';
import '../../flavors.dart';
import '../../helpers/languages.dart';
import '../../l10n/app_localizations.dart';
import '../../router/router.gr.dart';
import '../../components/profile/avatar.dart';
import '../../components/profile/setting_list.dart';

import '../../helpers/version.dart';
import '../../helpers/extensions.dart';
import '../../theme/design_system/design_system.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileState();
}

class _ProfileState extends ConsumerState<ProfileScreen> {
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
    final contactEmail = FlavorConfig.current.strings(context).contactEmail;
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
      path: contactEmail,
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
    final authEnabled = ref.watch(featureFlagsProvider).auth;
    final user = ref.read(authStateProvider.select((value) => value.user));
    final settings = ref.watch(settingsProvider);
    return DialogOnWeb(
      child: CupertinoScaffold(
        body: Scaffold(
          appBar: AppBar(
            elevation: 0,
            toolbarHeight: 44,
            leadingWidth: 92,
            leading: const CustomBackButton(),
            title: authEnabled ? Text(S.of(context).profileTab) : Text(S.of(context).settings),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    if (authEnabled) ...[
                      if (user != null)
                        const Avatar()
                      else
                        Padding(
                          padding: const EdgeInsets.only(top: 24, bottom: 16),
                          child: Padding(
                            padding: const EdgeInsets.all(6),
                            child: SvgPicture.string(
                              SvgIcons.avatar,
                              color: DesignSystem.of(context).colors.tint1,
                            ),
                          ),
                        ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (user != null)
                              GestureDetector(
                                onLongPress: () => ref.read(authStateProvider.notifier).logout(manual: false),
                                child: DesignSystem.of(context).buttons.smallSecondary(
                                      onPressed: () => {ref.read(authStateProvider.notifier).logout()},
                                      labelText: S.of(context).logOutButton,
                                    ),
                              )
                            else
                              DesignSystem.of(context).buttons.small(
                                    onPressed: () => context.router.navigate(OnboardingScreenRoute()),
                                    labelText: S.of(context).signInOrSignUp,
                                  )
                          ],
                        ),
                      ),
                    ] else ...[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 48),
                        child: Image(
                          image: FlavorConfig.current.images.logo,
                          height: 25,
                          gaplessPlayback: true,
                        ),
                      ),
                    ],
                    Column(
                      children: [
                        SettingList(
                          buttons: [
                            OptionButton(
                              optionName: S.of(context).appLanguage,
                              currentSelection: getLanguageName(settings.appLanguage.languageCode),
                              onPressed: () {
                                context.router.push(const AppLanguageScreenRoute());
                              },
                            ),
                            OptionButton(
                              optionName: S.of(context).audioLanguage,
                              currentSelection: getLanguageName(settings.audioLanguage),
                              onPressed: () {
                                context.router.push(const AudioLanguageScreenRoute());
                              },
                            ),
                            OptionButton(
                              optionName: S.of(context).subtitleLanguage,
                              currentSelection: settings.subtitleLanguage == null ? S.of(context).none : getLanguageName(settings.subtitleLanguage),
                              onPressed: () {
                                context.router.push(const SubtitleLanguageScreenRoute());
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        SettingList(
                          buttons: [
                            OptionButton(
                              optionName: S.of(context).faq,
                              onPressed: () => context.router.push(const FAQScreenRoute()),
                            ),
                            if (!ref.read(authStateProvider).guestMode) ...[
                              OptionButton(
                                optionName: S.of(context).contactSupport,
                                onPressed: () {
                                  context.router.push(const ContactSupportScreenRoute());
                                },
                              ),
                              OptionButton(
                                optionName: S.of(context).userVoice,
                                onPressed: () {
                                  launchUrlString('https://uservoice.bcc.no/?tags=bcc-media', mode: LaunchMode.externalApplication);
                                },
                              )
                            ] else if (FlavorConfig.current.flavor != Flavor.kids) ...[
                              OptionButton(
                                optionName: S.of(context).contactSupport,
                                onPressed: () => _contactSupportEmail(),
                              ),
                            ],
                            if (FlavorConfig.current.flavor == Flavor.kids)
                              OptionButton(
                                optionName: S.of(context).makeDonation,
                                onPressed: () async {
                                  if (!await checkParentalGate(context) || !context.mounted) {
                                    return;
                                  }
                                  launchUrlString('https://biblekids.io/${S.of(context).localeName}/support-our-work',
                                      mode: LaunchMode.externalApplication);
                                },
                              ),
                            OptionButton(
                              optionName: S.of(context).about,
                              onPressed: () async {
                                if (!await checkParentalGate(context) || !context.mounted) {
                                  return;
                                }
                                context.router.push(const AboutScreenRoute());
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        Builder(
                          builder: (context) {
                            return SettingList(
                              buttons: [
                                OptionButton(
                                  optionName: S.of(context).privacyPolicy,
                                  onPressed: () async {
                                    if (!await checkParentalGate(context) || !context.mounted) {
                                      return;
                                    }
                                    context.router.push(const PrivacyPolicyScreenRoute());
                                  },
                                ),
                              ],
                            );
                          },
                        ),
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
      ),
    );
  }
}
