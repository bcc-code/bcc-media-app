import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/helpers/btv_buttons.dart';
import 'package:brunstadtv_app/helpers/svg_icons.dart';
import 'package:brunstadtv_app/providers/auth_state.dart';
import 'package:brunstadtv_app/providers/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../components/custom_back_button.dart';
import '../../helpers/languages.dart';
import '../../l10n/app_localizations.dart';
import '../../router/router.gr.dart';
import './avatar.dart';
import '../../components/setting_list.dart';

class Profile extends ConsumerStatefulWidget {
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
            }),
      OptionButton(
          optionName: S.of(context).about,
          onPressed: () {
            context.router.push(const AboutScreenRoute());
          })
    ];
  }

  List<OptionButton> get _termsAndPrivacyOptions {
    return [
      OptionButton(
          optionName: S.of(context).privacyPolicy,
          currentSelection: '(external page)',
          onPressed: () {
            launchUrlString('https://bcc.media/privacy');
            // TODO: Terms & conditions
          }),
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
    if (success) {
      context.router.root.popUntil((route) => false);
      context.router.root.push(const TabsRootScreenRoute());
    } else {
      //loginError = 'Login failed';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 44,
        leadingWidth: 92,
        leading: const CustomBackButton(),
        title: Text(S.of(context).profileTab),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                if (!ref.read(authStateProvider).guestMode)
                  const Avatar()
                else
                  Padding(
                    padding: EdgeInsets.only(top: 24, bottom: 16),
                    child: Padding(padding: EdgeInsets.all(6), child: SvgPicture.string(SvgIcons.avatar)),
                  ),
                Container(
                  margin: const EdgeInsets.only(bottom: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (!ref.read(authStateProvider).guestMode)
                        BtvButton.smallSecondary(
                          onPressed: () => ref.read(authStateProvider.notifier).logout(),
                          labelText: S.of(context).logOutButton,
                        )
                      else
                        BtvButton.small(
                          onPressed: () => loginAction(context),
                          labelText: S.of(context).signInButton,
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
                    const SizedBox(height: 24),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
