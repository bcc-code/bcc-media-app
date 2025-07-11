import 'package:auto_route/auto_route.dart';
import 'package:bccm_core/bccm_core.dart';
import 'package:bccm_core/platform.dart';
import 'package:brunstadtv_app/components/misc/parental_gate.dart';
import 'package:brunstadtv_app/providers/feature_flags.dart';
import 'package:brunstadtv_app/providers/settings.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kids/components/buttons/button.dart';
import 'package:kids/components/buttons/button_base.dart';
import 'package:kids/components/buttons/stack_close_button.dart';
import 'package:kids/components/settings/setting_list.dart';
import 'package:kids/components/settings/toggle_switch.dart';
import 'package:kids/helpers/svg_icons.dart';
import 'package:kids/providers/sound_effects.dart';
import 'package:kids/router/router.gr.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:brunstadtv_app/components/web/dialog_on_web.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';

import 'package:bccm_core/design_system.dart';

@RoutePage()
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

    final isNotificationEnabled = settings.notificationsEnabled ?? false;
    final notificationEnabledController = useState(false);
    useEffect(() {
      notificationEnabledController.value = isNotificationEnabled;
    }, [isNotificationEnabled]);

    final isOnlyPreferredLanguagesContentEnabled = settings.onlyPreferredLanguagesContentEnabled ?? true;
    final onlyPreferredLanguagesContentController = useState(false);
    useEffect(() {
      onlyPreferredLanguagesContentController.value = isOnlyPreferredLanguagesContentEnabled;
    }, [isOnlyPreferredLanguagesContentEnabled]);

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
                                SizedBox(height: spacingBetweenSections),
                                if (ref.watch(featureFlagsProvider.select((ff) => ff.kidsDonationLink))) ...[
                                  const DonationButton(),
                                  SizedBox(height: spacingBetweenSections),
                                ],
                                if (ref.watch(featureFlagsProvider.select((ff) => ff.kidsAuth))) ...[
                                  AuthenticationButton(),
                                  SizedBox(height: spacingBetweenSections),
                                ],
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
                                      title: S.of(context).onlyShowContentWithPreferredLanguages,
                                      onPressed: () {
                                        final value = isOnlyPreferredLanguagesContentEnabled;
                                        onlyPreferredLanguagesContentController.value = !value;
                                      },
                                      rightWidget: ToggleSwitch(
                                        controller: onlyPreferredLanguagesContentController,
                                        onChanged: (value) {
                                          ref.read(settingsProvider.notifier).setOnlyPreferredLanguagesContentEnabled(value);
                                          ref.read(soundEffectsProvider).queue(SoundEffects.buttonPush);
                                          CustomHapticFeedback.selectionClick();
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: spacingBetweenSections),
                                SettingList(
                                  items: [
                                    SettingListItem(
                                      title: S.of(context).notifications,
                                      onPressed: () {
                                        final value = isNotificationEnabled;
                                        notificationEnabledController.value = !value;
                                      },
                                      rightWidget: ToggleSwitch(
                                        controller: notificationEnabledController,
                                        onChanged: (value) async {
                                          final notifSetting = ref.read(settingsProvider).notificationsEnabled;
                                          if (value == true && notifSetting == null) {
                                            final permission = await ref.read(notificationServiceProvider).requestPermissionAndSetup();
                                            switch (permission?.authorizationStatus) {
                                              case AuthorizationStatus.authorized:
                                                ref.read(analyticsProvider).notificationPromptAccepted(NotificationPromptAcceptedEvent());
                                                break;
                                              case AuthorizationStatus.denied:
                                                ref.read(analyticsProvider).notificationPromptDenied(NotificationPromptDeniedEvent());
                                                break;
                                              default:
                                            }
                                          }

                                          ref.read(settingsProvider.notifier).setNotificationsEnabled(value);
                                          ref.read(analyticsProvider).notificationsSettingToggled(
                                                NotificationsSettingToggledEvent(enabled: value),
                                              );

                                          ref.read(soundEffectsProvider).queue(SoundEffects.buttonPush);
                                          CustomHapticFeedback.selectionClick();
                                        },
                                      ),
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
                                    if (ref.read(authStateProvider).isBccMember) ...[
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
  const DonationButton({super.key});

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
      shadowColor: design.colors.label1.withValues(alpha: 0.1),
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

class AuthenticationButton extends HookConsumerWidget {
  const AuthenticationButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final design = DesignSystem.of(context);
    final bp = ResponsiveBreakpoints.of(context);
    final isSmall = bp.smallerThan(TABLET);

    return SettingList(
      items: [
        if (!ref.watch(authStateProvider).isLoggedIn)
          SettingListItem(
            title: S.of(context).kidsLogInWithBCCTitle,
            onPressed: () async {
              final success = await ref.read(authStateProvider.notifier).login();
              if (!success) return;
              await tryCatchRecordErrorAsync(() async {
                await ref.read(featureFlagsProvider.notifier).activateFeatureFlags().timeout(const Duration(seconds: 2));
              });
              ref.invalidate(appConfigFutureProvider);
            },
            rightWidget: SvgPicture.string(
              SvgIcons.logoBCC,
              height: isSmall ? 24 : 44,
              width: isSmall ? 24 : 44,
            ),
          ),
        if (ref.watch(authStateProvider).isLoggedIn)
          SettingListItem(
            title: S.of(context).kidsLoggedInWithBCCTitle,
            subtitle: ref.read(authStateProvider).user?.email,
            onPressed: () async {},
            rightWidget: Button.raw(
              color: design.colors.background1,
              activeColor: design.colors.background1,
              shadowColor: design.colors.label1.withValues(alpha: 0.2),
              sideColor: const Color(0xFFE9ECF4),
              labelText: S.of(context).logOutButton,
              labelTextStyle: design.textStyles.title2,
              elevationHeight: 2,
              iconSize: 0,
              height: 40,
              paddings: const ButtonPaddings(
                fromLabelToSide: 20,
                fromLabelToSideWhenAlone: 20,
                fromIconToLabel: 20,
                fromIconToSide: 20,
                fromIconToSideWhenAlone: 20,
              ),
              onPressed: () async {
                await ref.read(authStateProvider.notifier).logout(manual: true);
                await tryCatchRecordErrorAsync(() async {
                  await ref.read(featureFlagsProvider.notifier).activateFeatureFlags().timeout(const Duration(seconds: 2));
                });
                ref.invalidate(appConfigFutureProvider);
              },
            ),
          ),
      ],
    );
  }
}
