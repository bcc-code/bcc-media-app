import 'package:bccm_core/bccm_core.dart';
import 'package:bccm_core/platform.dart';
import 'package:bccm_core/design_system.dart';
import 'package:brunstadtv_app/helpers/constants.dart';
import 'package:firebase_messaging_platform_interface/src/types.dart';
import 'package:kids/components/buttons/notification_promt_dismiss_button.dart';
import 'package:kids/helpers/svg_icons.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';

class NotificationPrompt extends HookConsumerWidget {
  const NotificationPrompt({super.key, this.onDismiss});

  final Function? onDismiss;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final design = DesignSystem.of(context);
    final bp = ResponsiveBreakpoints.of(context);
    final isSmall = bp.smallerThan(TABLET);

    return AspectRatio(
      aspectRatio: 392 / 582,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(isSmall ? 16 : 40),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(isSmall ? 20 : 40),
              color: design.colors.tint1Dark,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: isSmall ? 8 : 20,
                    children: [
                      SvgPicture.string(
                        SvgIcons.notification,
                        colorFilter: ColorFilter.mode(design.colors.label1, BlendMode.srcIn),
                        width: isSmall ? 32 : 72,
                      ),
                      Text(
                        S.of(context).kidsNotificationReminderTitle,
                        style: isSmall ? design.textStyles.title1 : design.textStyles.headline2,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                design.buttons.responsive(
                  variant: ButtonVariant.primary,
                  labelText: isSmall ? S.of(context).kidsNotificationReminderCtaShort : S.of(context).kidsNotificationReminderCtaLong,
                  onPressed: () async {
                    final analytics = ref.read(analyticsProvider);
                    analytics.notificationPromptClicked(NotificationPromptClickedEvent());
                    final permissions = await ref.read(notificationServiceProvider).requestPermissionAndSetup();
                    if (permissions == null) {
                      debugPrint('notification permission null');
                      return;
                    }

                    switch (permissions.authorizationStatus) {
                      case AuthorizationStatus.authorized:
                        debugPrint('notification permission status: accepted');
                        analytics.notificationPromptAccepted(NotificationPromptAcceptedEvent());
                      case AuthorizationStatus.denied:
                        debugPrint('notification permission status: denied');
                        analytics.notificationPromptDenied(NotificationPromptDeniedEvent());
                      case AuthorizationStatus.notDetermined:
                        debugPrint('notification permission status: not determined');
                      case AuthorizationStatus.provisional:
                        debugPrint('notification permission status: provisional');
                    }
                  },
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: NotificationPromtDismissButton(
              onPressed: () {
                final sharedPrefs = ref.read(sharedPreferencesProvider);
                final analytics = ref.read(analyticsProvider);
                try {
                  final dismissedCount = sharedPrefs.getInt(PrefKeys.notificationPromptDismissedCount) ?? 0;
                  final newDismissedCount = dismissedCount + 1;

                  sharedPrefs.setInt(PrefKeys.notificationPromptDismissedCount, newDismissedCount);
                  analytics.notificationPromptDismissed(NotificationPromptDismissedEvent(timesDismissed: newDismissedCount));
                  sharedPrefs.setInt(PrefKeys.notificationPromptLastDismissedAt, DateTime.now().millisecondsSinceEpoch);
                } catch (e) {
                  debugPrint(e.toString());
                  analytics.log(LogEvent(name: 'notification prompt dismiss error', message: e.toString()));
                }

                onDismiss?.call();
              },
            ),
          ),
        ],
      ),
    );
  }
}
