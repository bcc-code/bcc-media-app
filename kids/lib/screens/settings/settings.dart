import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/components/misc/parental_gate.dart';
import 'package:brunstadtv_app/providers/auth_state/auth_state.dart';
import 'package:brunstadtv_app/providers/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kids/components/buttons/button_base.dart';
import 'package:kids/components/buttons/stack_close_button.dart';
import 'package:kids/components/settings/setting_list.dart';
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

    Future<void> checkParentalGateOrPop() async {
      SchedulerBinding.instance.scheduleFrameCallback((timeStamp) async {
        if (!context.mounted) return;
        if (!await checkParentalGate(context)) {
          SchedulerBinding.instance.scheduleFrameCallback((timeStamp) {
            if (!context.mounted) return;
            Navigator.of(context).pop();
          });
        }
      });
    }

    final readyToDisplay = useState(false);
    useEffect(() {
      // set portrait for mobile
      if (bp.smallerThan(TABLET)) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
        Future.delayed(const Duration(milliseconds: 300), () {
          if (!context.mounted) return;
          readyToDisplay.value = true;
          checkParentalGateOrPop();
        });
      } else {
        readyToDisplay.value = true;
        checkParentalGateOrPop();
      }
      return () {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,
        ]);
      };
    }, [bp.smallerThan(TABLET)]);

    final double spacingBetweenSections = bp.smallerThan(TABLET) ? 24 : 20;

    return DialogOnWeb(
      child: CupertinoScaffold(
        body: !readyToDisplay.value
            ? Container(
                color: design.colors.background1,
                child: Center(
                  child: SvgPicture.string(SvgIcons.logoFlame, height: 48, width: 48).animate(delay: 50.ms).fadeIn(),
                ),
              )
            : Scaffold(
                resizeToAvoidBottomInset: false,
                body: Stack(
                  children: [
                    SingleChildScrollView(
                      child: SafeArea(
                        child: Container(
                          alignment: Alignment.center,
                          width: double.infinity,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            constraints: const BoxConstraints(maxWidth: 544),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(top: bp.smallerThan(TABLET) ? 20 : 20),
                                  child: Container(
                                    margin: EdgeInsets.symmetric(vertical: bp.smallerThan(TABLET) ? 11 : 30),
                                    alignment: Alignment.center,
                                    height: bp.smallerThan(TABLET) ? 25.5 : 51,
                                    child: Image.asset(
                                      'assets/flavors/prod/logo_neg.png',
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: spacingBetweenSections),
                                  child: const DonationButton(),
                                ),
                                SettingList(
                                  items: [
                                    SettingListItem(
                                      title: bp.smallerThan(TABLET) ? S.of(context).appLanguageShort : S.of(context).appLanguage,
                                      rightText: getLanguageName(settings.appLanguage.languageCode) ?? '',
                                      onPressed: () {
                                        context.router.push(const AppLanguageScreenRoute());
                                      },
                                    ),
                                    SettingListItem(
                                      title: bp.smallerThan(TABLET) ? S.of(context).contentLanguageShort : S.of(context).contentLanguage,
                                      rightText: settings.audioLanguages.map(getLanguageName).join(', '),
                                      onPressed: () {
                                        context.router.push(const ContentLanguageScreenRoute());
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(height: spacingBetweenSections),
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
                                SizedBox(height: spacingBetweenSections),
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
                                SizedBox(height: spacingBetweenSections * 2),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const StackCloseButton(),
                  ],
                ),
              ),
      ),
    );
  }
}

class DonationButton extends StatelessWidget {
  const DonationButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    final bp = ResponsiveBreakpoints.of(context);
    final small = bp.smallerThan(TABLET);
    return ButtonBase(
      height: small ? 80 : 100,
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
              padding: small ? const EdgeInsets.only(left: 20, right: 8) : const EdgeInsets.only(left: 24, right: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).supportBibleKids,
                    style: (small ? design.textStyles.title1 : design.textStyles.headline3).copyWith(color: design.colors.onTint),
                  ),
                  Text(
                    S.of(context).donateViaPaypal,
                    style: (small ? design.textStyles.body2 : design.textStyles.body1).copyWith(color: design.colors.onTint),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: Container(
              alignment: Alignment.center,
              child: Stack(
                children: [
                  if (!pressed)
                    Transform.translate(
                      offset: const Offset(0, 3),
                      child: SvgPicture.string(
                        SvgIcons.logoFlame,
                        height: 48,
                        colorFilter: const ColorFilter.mode(Color(0xFFCA9100), BlendMode.srcIn),
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
    );
  }
}
