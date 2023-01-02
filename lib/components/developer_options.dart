import 'package:brunstadtv_app/components/bottom_sheet_select.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restart_app/restart_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helpers/btv_typography.dart';
import '../helpers/constants.dart';
import 'option_list.dart';

class DeveloperOptions extends ConsumerWidget {
  const DeveloperOptions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BottomSheetSelect(
      title: 'Developer options',
      selectedId: 'fromStart',
      items: [Option(id: 'override_env', title: 'Override environment')],
      showSelection: false,
      onSelectionChanged: (id) async {
        var currentEnvOverride = (await SharedPreferences.getInstance()).getString(PrefKeys.envOverride);
        if (id == 'override_env') {
          WidgetsBinding.instance.scheduleFrameCallback((d) {
            showDialog(
                useRootNavigator: true,
                context: context,
                builder: (context) {
                  return SimpleDialog(
                    title: const Text(
                      'Choose environment override',
                      style: BtvTextStyles.title3,
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
                                      style: BtvTextStyles.body1.copyWith(fontWeight: FontWeight.bold),
                                    ),
                            ))
                        .toList(),
                  );
                });
          });
        }
      },
    );
  }
}
