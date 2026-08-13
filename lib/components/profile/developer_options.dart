import 'package:bccm_core/platform.dart';
import 'package:brunstadtv_app/components/menus/bottom_sheet_select.dart';
import 'package:bccm_core/bccm_core.dart';
import 'package:brunstadtv_app/components/profile/technical_details_sheet.dart';
import 'package:brunstadtv_app/providers/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restart_app/restart_app.dart';

import '../../helpers/constants.dart';
import 'package:bccm_core/design_system.dart';
import '../menus/option_list.dart';

String _onOff(bool? value) => value == true ? 'On' : 'Off';

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
    final currentEnvOverride = ref.read(sharedPreferencesProvider).getString(PrefKeys.envOverride) ?? 'none';
    showModalBottomSheet(
      useRootNavigator: true,
      context: context,
      builder: (context) {
        return BottomSheetSelect<String>(
          title: 'Override environment',
          description: Container(
            margin: const EdgeInsets.only(bottom: 24),
            child: Text('The app will restart.', textAlign: TextAlign.center, style: DesignSystem.of(context).textStyles.caption1),
          ),
          selectedId: currentEnvOverride,
          items: [
            Option(id: 'none', title: 'None (default)'),
            Option(id: EnvironmentOverride.dev, title: 'Dev'),
            Option(id: EnvironmentOverride.sta, title: 'Staging'),
            Option(id: EnvironmentOverride.prod, title: 'Production'),
          ],
          onSelectionChanged: (env) async {
            if (env == 'none') {
              await ref.read(sharedPreferencesProvider).remove(PrefKeys.envOverride);
            } else {
              await ref.read(sharedPreferencesProvider).setString(PrefKeys.envOverride, env);
            }
            Restart.restartApp();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);
    return BottomSheetSelect<String>(
      title: 'Developer options',
      selectedId: 'fromStart',
      items: [
        Option(id: 'override_env', title: 'Override environment'),
        Option(id: 'show_technical_details', title: 'Show technical details'),
        Option(id: 'reset_settings', title: 'Reset settings'),
        Option(id: 'toggle_native_player', title: 'Use native player: ${_onOff(settings.useNativePlayer)}'),
        Option(id: 'toggle_betatester', title: 'Betatester mode: ${_onOff(settings.isBetaTester)}'),
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
              showTechnicalDetailsSheet(context);
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
