import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/providers/auth.dart';
import 'package:brunstadtv_app/providers/feature_flags.dart';
import 'package:brunstadtv_app/providers/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:focusable_control_builder/focusable_control_builder.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../components/web/dialog_on_web.dart';
import '../../flavors.dart';
import '../../helpers/languages.dart';
import '../../l10n/app_localizations.dart';
import '../../router/router.gr.dart';
import '../../components/profile/avatar.dart';
import '../../components/profile/setting_list.dart';

import 'package:bccm_core/design_system.dart';

@RoutePage<void>()
class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsState();
}

class _SettingsState extends ConsumerState<SettingsScreen> {
  Future<void> loginAction(BuildContext context) async {
    final success = await ref.read(authStateProvider.notifier).login();
    if (success && context.mounted) {
      context.router.root.popUntil((route) => false);
      context.router.root.push(const TabsRootScreenRoute());
    } else {
      //loginError = 'Login failed';
    }
  }

  @override
  Widget build(BuildContext context) {
    final authEnabled = ref.watch(featureFlagsProvider.select((value) => value.auth));
    final user = ref.read(authStateProvider.select((value) => value.user));
    final settings = ref.watch(settingsProvider);
    final design = DesignSystem.of(context);
    return DialogOnWeb(
      child: CupertinoScaffold(
        body: Scaffold(
          appBar: AppBar(
            elevation: 0,
            toolbarHeight: 56,
            leadingWidth: 92,
            leading: FocusableControlBuilder(
              onPressed: () {
                context.router.pop();
              },
              builder: (context, control) => Container(
                padding: const EdgeInsets.only(left: 16),
                width: double.infinity,
                alignment: Alignment.centerLeft,
                child: Text(
                  S.of(context).back,
                  style: !control.isFocused
                      ? design.textStyles.button2
                      : design.textStyles.button2.copyWith(shadows: [
                          Shadow(
                            color: Theme.of(context).brightness == Brightness.dark ? Colors.white30 : Colors.black26,
                            blurRadius: 8,
                            offset: const Offset(0, 0),
                          )
                        ]),
                ),
              ),
            ),
            title: Text(S.of(context).settings),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    if (authEnabled && user != null)
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                        decoration: BoxDecoration(
                          color: design.colors.background2,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        foregroundDecoration: BoxDecoration(
                          border: Border.all(color: design.colors.separatorOnLight, width: 1),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Row(children: [
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: Avatar(
                              width: 52,
                              backgroundColor: design.colors.background1,
                            ),
                          ),
                          Text(user.name, style: design.textStyles.title3.copyWith(color: design.colors.label1))
                        ]),
                      )
                    else if (!authEnabled)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 48),
                        child: Image(
                          image: FlavorConfig.current.bccmImages!.logo,
                          height: 25,
                          gaplessPlayback: true,
                        ),
                      )
                    else
                      Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: SettingList(
                          buttons: [
                            OptionButton(
                              optionName: S.of(context).signInButton,
                              onPressed: () {
                                context.router.navigate(OnboardingScreenRoute());
                              },
                            ),
                          ],
                        ),
                      ),
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
                              currentSelection: getLanguageName(settings.audioLanguages.firstOrNull),
                              onPressed: () {
                                context.router.push(const AudioLanguageScreenRoute());
                              },
                            ),
                            OptionButton(
                              optionName: S.of(context).subtitleLanguage,
                              currentSelection:
                                  settings.subtitleLanguages.isEmpty ? S.of(context).none : getLanguageName(settings.subtitleLanguages.firstOrNull),
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
                            OptionButton(
                              optionName: S.of(context).contactSupport,
                              onPressed: () {
                                context.router.push(
                                  ref.read(authStateProvider).guestMode ? const ContactPublicScreenRoute() : const ContactScreenRoute(),
                                );
                              },
                            ),
                            if (!ref.read(authStateProvider).guestMode) ...[
                              OptionButton(
                                optionName: S.of(context).userVoice,
                                onPressed: () {
                                  launchUrlString('https://uservoice.bcc.no/?tags=bcc-media', mode: LaunchMode.externalApplication);
                                },
                              )
                            ],
                            if (FlavorConfig.current.flavor == Flavor.kids)
                              OptionButton(
                                optionName: S.of(context).makeDonation,
                                onPressed: () => launchUrlString(
                                  'https://www.paypal.com/donate/?hosted_button_id=M5HU747LQCRQC',
                                  mode: LaunchMode.externalApplication,
                                ),
                              ),
                            OptionButton(
                              optionName: S.of(context).about,
                              onPressed: () => context.router.push(const AboutScreenRoute()),
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
                                  onPressed: () => context.router.push(const PrivacyPolicyScreenRoute()),
                                ),
                                OptionButton(
                                  optionName: S.of(context).termsOfUse,
                                  onPressed: () => context.router.push(const TermsOfUseScreenRoute()),
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
                              OptionButton(
                                optionName: S.of(context).logOutButton,
                                onPressed: () {
                                  ref.read(authStateProvider.notifier).logout();
                                },
                              ),
                            ],
                          ),
                        const SizedBox(height: 48),
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
