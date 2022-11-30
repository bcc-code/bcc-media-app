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
      title: 'Share video',
      selectedId: 'fromStart',
      items: [Option(id: 'override_env', title: 'Override environment')],
      showSelection: false,
      onSelectionChanged: (id) {
        if (id == 'override_env') {
          WidgetsBinding.instance.scheduleFrameCallback((d) {
            showDialog(
                useRootNavigator: true,
                context: context,
                builder: (context) {
                  return SimpleDialog(
                    title: const Text(
                      'Choose environment',
                      style: BtvTextStyles.title3,
                    ),
                    children: ['dev', 'staging', 'prod']
                        .map((env) => SimpleDialogOption(
                              onPressed: () async {
                                var prefs = await SharedPreferences.getInstance();
                                prefs.setString(PrefKeys.envOverride, env);
                                Restart.restartApp();
                              },
                              child: Text(env),
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
