import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/providers/auth_state/auth_state.dart';
import 'package:brunstadtv_app/providers/feature_flags.dart';
import 'package:brunstadtv_app/providers/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:focusable_control_builder/focusable_control_builder.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kids/helpers/orientation_utils.dart';
import 'package:kids/helpers/svg_icons.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:brunstadtv_app/components/web/dialog_on_web.dart';
import 'package:brunstadtv_app/helpers/languages.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';
import 'package:brunstadtv_app/components/profile/setting_list.dart';

import 'package:brunstadtv_app/theme/design_system/design_system.dart';

@RoutePage<void>()
class SettingsScreen extends HookConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);
    final design = DesignSystem.of(context);
    final bp = ResponsiveBreakpoints.of(context);

    usePortrait(!bp.isTablet);

    return DialogOnWeb(
      child: CupertinoScaffold(
        body: Scaffold(
          appBar: AppBar(
            elevation: 0,
            toolbarHeight: 56,
            leadingWidth: 84,
            leading: FocusableControlBuilder(
              onPressed: () {
                context.router.pop();
              },
              builder: (context, control) => Container(
                padding: const EdgeInsets.only(left: 20),
                width: double.infinity,
                alignment: Alignment.centerLeft,
                child: design.buttons.small(
                  labelText: '',
                  image: SizedBox(
                    height: 24,
                    width: 24,
                    child: Center(
                      child: SvgPicture.string(SvgIcons.close),
                    ),
                  ),
                  onPressed: () {
                    context.router.pop();
                  },
                ),
              ),
            ),
            title: Container(
              alignment: Alignment.centerLeft,
              height: 25,
              child: Image.asset(
                'assets/flavors/prod/logo_neg.png',
              ),
            ),
            centerTitle: false,
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                      child: design.buttons.large(
                        labelText: S.of(context).makeDonation,
                        image: SizedBox(
                          height: 24,
                          width: 24,
                          child: Center(
                            child: SvgPicture.string(SvgIcons.magic),
                          ),
                        ),
                        onPressed: () => launchUrlString(
                          'https://www.paypal.com/donate/?hosted_button_id=M5HU747LQCRQC',
                          mode: LaunchMode.externalApplication,
                        ),
                      ),
                    ),
                    SettingList(
                      buttons: [
                        OptionButton(
                          optionName: S.of(context).appLanguage,
                          currentSelection: getLanguageName(settings.appLanguage.languageCode),
                          onPressed: () {
                            //context.router.push(const AppLanguageScreenRoute());
                          },
                        ),
                        OptionButton(
                          optionName: S.of(context).audioLanguage,
                          currentSelection: getLanguageName(settings.audioLanguage),
                          onPressed: () {
                            //context.router.push(const AudioLanguageScreenRoute());
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    SettingList(
                      buttons: [
                        OptionButton(
                          optionName: S.of(context).faq,
                          onPressed: () {
                            // context.router.push(const FAQScreenRoute());
                          },
                        ),
                        OptionButton(
                          optionName: S.of(context).contactSupport,
                          onPressed: () {
                            // context.router.push(const ContactPublicScreenRoute());
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
                        OptionButton(
                          optionName: S.of(context).about,
                          onPressed: () {
                            // context.router.push(const AboutScreenRoute());
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    /* Builder(
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
                    ), */
                    const SizedBox(height: 48),
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
