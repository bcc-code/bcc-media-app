import 'package:brunstadtv_app/components/bottom_sheet_select.dart';
import 'package:brunstadtv_app/providers/auth_state/auth_state.dart';
import 'package:brunstadtv_app/providers/feature_flags.dart';
import 'package:brunstadtv_app/providers/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restart_app/restart_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../providers/notification_service.dart';
import '../theme/bccm_typography.dart';
import '../helpers/constants.dart';
import 'option_list.dart';

class DeveloperOptions extends ConsumerWidget {
  const DeveloperOptions({super.key});

  void showOverrideEnvModal(BuildContext context) async {
    var currentEnvOverride = (await SharedPreferences.getInstance()).getString(PrefKeys.envOverride);
    // ignore: use_build_context_synchronously
    showDialog(
      useRootNavigator: true,
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: const Text(
            'Choose environment override',
            style: BccmTextStyles.title3,
          ),
          children: [EnvironmentOverride.none, EnvironmentOverride.dev, EnvironmentOverride.sta, EnvironmentOverride.prod]
              .map((env) => SimpleDialogOption(
                    onPressed: () async {
                      var prefs = await SharedPreferences.getInstance();
                      await prefs.setString(PrefKeys.envOverride, env);
                      Restart.restartApp();
                    },
                    child: currentEnvOverride != env
                        ? Text(env)
                        : Text(
                            env,
                            style: BccmTextStyles.body1.copyWith(fontWeight: FontWeight.bold),
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
            title: const Text(
              'Technical details',
              style: BccmTextStyles.title3,
            ),
            children: [
              SelectionArea(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  alignment: Alignment.topLeft,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    const Text('idToken: '),
                    TextField(controller: TextEditingController()..text = auth.idToken.toString()),
                    const Text('accessToken: '),
                    TextField(controller: TextEditingController()..text = auth.auth0AccessToken.toString()),
                    const Text('fcmToken: '),
                    TextField(controller: TextEditingController()..text = notificationService.fcmToken.toString()),
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
      items: [Option(id: 'override_env', title: 'Override environment'), Option(id: 'show_technical_details', title: 'Show technical details')],
      showSelection: false,
      onSelectionChanged: (id) async {
        WidgetsBinding.instance.scheduleFrameCallback((d) {
          switch (id) {
            case 'override_env':
              showOverrideEnvModal(context);
              break;
            case 'show_technical_details':
              showTechnicalDetails(context, ref);
              break;
          }
        });
      },
    );
  }
}
