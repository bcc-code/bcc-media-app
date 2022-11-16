import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/helpers/btv_buttons.dart';
import 'package:brunstadtv_app/providers/auth_state.dart';
import 'package:brunstadtv_app/providers/settings_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

  List<OptionButton> get _termsaAndPrivacyOptions {
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
          currentSelection: getLanguageName(settings.subtitleLanguage),
          onPressed: () {
            context.router.push(const AppSubtitleLanguageRoute());
          })
    ];
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
                const Avatar(),
                Container(
                  margin: const EdgeInsets.only(bottom: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BtvButton.smallSecondary(
                        onPressed: () => ref.read(authStateProvider.notifier).logoutAndNavigate(context),
                        labelText: S.of(context).logOutButton,
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    SettingList(buttons: _settingsOptions),
                    const SizedBox(height: 24),
                    SettingList(buttons: _supportButtons),
                    const SizedBox(height: 24),
                    SettingList(buttons: _termsaAndPrivacyOptions),
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
