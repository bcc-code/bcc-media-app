import 'package:brunstadtv_app/components/menus/bottom_sheet_select.dart';
import 'package:brunstadtv_app/helpers/extensions.dart';
import 'package:brunstadtv_app/providers/auth_state/auth_state.dart';
import 'package:brunstadtv_app/providers/feature_flags.dart';
import 'package:brunstadtv_app/providers/settings.dart';
import 'package:brunstadtv_app/providers/shared_preferences.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restart_app/restart_app.dart';

import '../../providers/notification_service.dart';

import '../../helpers/constants.dart';
import '../../theme/design_system/design_system.dart';
import '../menus/option_list.dart';

class DeveloperOptionsTrigger extends HookWidget {
  const DeveloperOptionsTrigger({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final timesPressedLogo = useState(0);
    return GestureDetector(
      onTap: () {
        timesPressedLogo.value++;
        if (timesPressedLogo.value == 7) {
          timesPressedLogo.value = 0;
          HapticFeedback.heavyImpact();
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return const DeveloperOptions();
            },
          );
        }
      },
      child: child,
    );
  }
}

class DeveloperOptions extends ConsumerWidget {
  const DeveloperOptions({super.key});

  void showOverrideEnvModal(BuildContext context, WidgetRef ref) {
    var currentEnvOverride = ref.read(sharedPreferencesProvider).getString(PrefKeys.envOverride);
    // ignore: use_build_context_synchronously
    showDialog(
      useRootNavigator: true,
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text(
            'Choose environment override',
            style: DesignSystem.of(context).textStyles.title3,
          ),
          children: [EnvironmentOverride.none, EnvironmentOverride.dev, EnvironmentOverride.sta, EnvironmentOverride.prod]
              .map((env) => SimpleDialogOption(
                    onPressed: () async {
                      await ref.read(sharedPreferencesProvider).setString(PrefKeys.envOverride, env);
                      Restart.restartApp();
                    },
                    child: currentEnvOverride != env
                        ? Text(env)
                        : Text(
                            env,
                            style: DesignSystem.of(context).textStyles.body1.copyWith(fontWeight: FontWeight.bold),
                          ),
                  ))
              .toList(),
        );
      },
    );
  }

  void showTechnicalDetails(BuildContext context, WidgetRef ref) async {
    var auth = ref.read(authStateProvider);
    var settings = ref.read(settingsProvider);
    var notificationService = ref.read(notificationServiceProvider);
    showDialog(
      useRootNavigator: true,
      context: context,
      builder: (context) {
        return Consumer(builder: (context, ref, child) {
          return SimpleDialog(
            title: Text(
              'Technical details',
              style: DesignSystem.of(context).textStyles.title3,
            ),
            children: [
              SelectionArea(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: kIsWeb ? 80 : 16),
                  alignment: Alignment.topLeft,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    const Text('idToken: '),
                    TextField(controller: TextEditingController()..text = auth.idToken.toString()),
                    const Text('accessToken: '),
                    TextField(controller: TextEditingController()..text = auth.auth0AccessToken.toString()),
                    const Text('fcmToken: '),
                    TextField(
                        controller: TextEditingController()
                          ..text = notificationService.asOrNull<FcmNotificationService>()?.fcmToken.toString() ?? 'disabled'),
                    const SizedBox(height: 8),
                    Text('auth.expiresAt: ${auth.expiresAt}'),
                    Text('session_id: ${settings.sessionId}'),
                    Text('analytics_id (private): ${settings.analyticsId}'),
                    Text('featureFlags: ${ref.watch(featureFlagsProvider)}'),
                  ]),
                ),
              )
            ],
          );
        });
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BottomSheetSelect(
      title: 'Developer options',
      selectedId: 'fromStart',
      items: [
        Option(id: 'override_env', title: 'Override environment'),
        Option(id: 'show_technical_details', title: 'Show technical details'),
        Option(id: 'reset_settings', title: 'Reset settings'),
        Option(id: 'toggle_native_player', title: 'Use native player: ${ref.watch(settingsProvider).useNativePlayer}'),
        Option(id: 'toggle_betatester', title: 'Betatester mode: ${ref.watch(settingsProvider).isBetaTester}'),
      ],
      popOnChange: false,
      showSelection: false,
      onSelectionChanged: (id) async {
        WidgetsBinding.instance.scheduleFrameCallback((d) {
          switch (id) {
            case 'override_env':
              showOverrideEnvModal(context, ref);
              break;
            case 'show_technical_details':
              showTechnicalDetails(context, ref);
              break;
            case 'reset_settings':
              ref.read(sharedPreferencesProvider).clear();
              // ignore: unused_result
              ref.refresh(settingsProvider);
              debugPrint('cleared shared prefs');
              break;
            case 'toggle_betatester':
              final current = ref.read(settingsProvider).isBetaTester ?? false;
              ref.read(settingsProvider.notifier).setBetaTester(!current);
              break;
            case 'toggle_native_player':
              final current = ref.read(settingsProvider).useNativePlayer ?? false;
              ref.read(settingsProvider.notifier).setUseNativePlayer(!current);
              break;
          }
        });
      },
    );
  }
}
