import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/providers/auth_state/auth_state.dart';
import 'package:brunstadtv_app/providers/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:focusable_control_builder/focusable_control_builder.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kids/components/buttons/button_base.dart';
import 'package:kids/components/settings/setting_list.dart';
import 'package:kids/helpers/orientation_utils.dart';
import 'package:kids/helpers/svg_icons.dart';
import 'package:kids/router/router.gr.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:brunstadtv_app/components/web/dialog_on_web.dart';
import 'package:brunstadtv_app/helpers/languages.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';

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
            leadingWidth: 84,
            leading: FocusableControlBuilder(
              cursor: SystemMouseCursors.click,
              actions: {
                ActivateIntent: CallbackAction<ActivateIntent>(onInvoke: (intent) {
                  return context.router.pop();
                }),
              },
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
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 500),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                        child: ButtonBase(
                          height: 100,
                          elevationHeight: 2,
                          borderRadius: BorderRadius.circular(16),
                          color: design.colors.tint1,
                          activeColor: design.colors.tint1,
                          shadowColor: design.colors.label1.withOpacity(0.1),
                          sideColor: const Color(0xFFF1B826),
                          onPressed: () => launchUrlString(
                            'https://www.paypal.com/donate/?hosted_button_id=M5HU747LQCRQC',
                            mode: LaunchMode.externalApplication,
                          ),
                          builder: (context, pressed) => Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 24),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Support Bible Kids', style: design.textStyles.headline3.copyWith(color: design.colors.onTint)),
                                      Text('Donate via PayPal', style: design.textStyles.body1.copyWith(color: design.colors.onTint)),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 24),
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Stack(
                                    children: [
                                      if (!pressed)
                                        Transform.translate(
                                          offset: Offset(0, 3),
                                          child: SvgPicture.string(
                                            SvgIcons.logoFlame,
                                            height: 48,
                                            colorFilter: ColorFilter.mode(const Color(0xFFCA9100), BlendMode.srcIn),
                                            width: 48,
                                          ),
                                        ),
                                      SvgPicture.string(
                                        SvgIcons.logoFlame,
                                        height: 48,
                                        width: 48,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SettingList(
                        items: [
                          SettingListItem(
                            title: S.of(context).appLanguage,
                            rightSlot: Text(
                              getLanguageName(settings.appLanguage.languageCode) ?? '',
                              style: design.textStyles.body1.copyWith(color: design.colors.label1),
                            ),
                            onPressed: () {
                              //context.router.push(const AppLanguageScreenRoute());
                            },
                          ),
                          SettingListItem(
                            title: S.of(context).audioLanguage,
                            rightSlot: Text(
                              getLanguageName(settings.audioLanguage) ?? '',
                              style: design.textStyles.body1.copyWith(color: design.colors.label1),
                            ),
                            onPressed: () {
                              //context.router.push(const AudioLanguageScreenRoute());
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      SettingList(
                        items: [
                          SettingListItem(
                            title: S.of(context).faq,
                            onPressed: () {
                              context.router.push(const FAQScreenRoute());
                            },
                          ),
                          SettingListItem(
                            title: S.of(context).contactSupport,
                            onPressed: () {
                              context.router.push(const ContactScreenRoute());
                            },
                          ),
                          if (!ref.read(authStateProvider).guestMode) ...[
                            SettingListItem(
                              title: S.of(context).userVoice,
                              onPressed: () {
                                launchUrlString('https://uservoice.bcc.no/?tags=bcc-media', mode: LaunchMode.externalApplication);
                              },
                            )
                          ],
                          SettingListItem(
                            title: S.of(context).about,
                            onPressed: () {
                              context.router.push(const AboutScreenRoute());
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Builder(
                        builder: (context) {
                          return SettingList(
                            items: [
                              SettingListItem(
                                title: S.of(context).privacyPolicy,
                                onPressed: () => context.router.push(const PrivacyPolicyScreenRoute()),
                              ),
                              SettingListItem(
                                title: S.of(context).termsOfUse,
                                onPressed: () => context.router.push(const TermsOfUseScreenRoute()),
                              ),
                            ],
                          );
                        },
                      ),
                      const SizedBox(height: 48),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
