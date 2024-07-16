import 'package:auto_route/auto_route.dart';
import 'package:bccm_core/design_system.dart';
import 'package:brunstadtv_app/components/achievements/achievement_dialog.dart';
import 'package:brunstadtv_app/components/misc/dialog_with_image.dart';
import 'package:brunstadtv_app/components/status/error_generic.dart';
import 'package:brunstadtv_app/components/status/loading_generic.dart';
import 'package:bccm_core/platform.dart';
import 'package:brunstadtv_app/helpers/constants.dart';
import 'package:brunstadtv_app/helpers/main_js_channel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../components/nav/custom_back_button.dart';
import '../../helpers/svg_icons.dart';
import '../../l10n/app_localizations.dart';

@RoutePage<void>()
class StudyScreen extends HookConsumerWidget {
  final String episodeId;
  final String lessonId;

  const StudyScreen({
    super.key,
    required this.episodeId,
    required this.lessonId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initialUrl = useState('${getWebUrl(ref)}/embed/episode/$episodeId/lesson/$lessonId?webview_delayed_type=flutter_webview_manager');

    Future handleTasksCompleted() async {
      final navigatorContext = Navigator.of(context).context;
      final gqlClient = ref.read(bccmGraphQLProvider);
      final achievements = await gqlClient.query$getPendingAchievements();

      if (achievements.parsedData?.pendingAchievements.isNotEmpty != true && navigatorContext.mounted) {
        await showDialog(
          barrierDismissible: false,
          context: navigatorContext,
          builder: (context) => DialogWithImage(
            image: SvgPicture.string(SvgIcons.tasksCompleted),
            title: S.of(context).wellDone,
            description: S.of(context).videoCompletedText,
            dismissButtonText: S.of(context).continueButton,
          ),
        );
      }

      for (final achievement in achievements.parsedData!.pendingAchievements) {
        // ignore: use_build_context_synchronously
        if (!navigatorContext.mounted) return;
        await showDialog(
          barrierDismissible: false,
          context: navigatorContext,
          builder: (context) => AchievementDialog(
            achievement: achievement,
            dismissButtonText: S.of(context).continueButton,
          ),
        );
        gqlClient
            .mutate$confirmAchievement(Options$Mutation$confirmAchievement(variables: Variables$Mutation$confirmAchievement(id: achievement.id)));
      }
    }

    Future handleMessage(List<dynamic> arguments) async {
      if (arguments[0] == 'tasks_completed') {
        handleTasksCompleted();
      }
    }

    final uri = useMemoized(() => Uri.tryParse(initialUrl.value), [initialUrl]);
    final manager = useState<WebViewManager?>(null);
    useWebView(uri, setup: (m) {
      MainJsChannel.register(context, m, enableAuth: true);
      m.js.registerSimpleHandler('flutter_study', handleMessage);
    });

    final loading = useListenableSelector(manager.value?.navigation.initialLoadDone, () => manager.value?.navigation.initialLoadDone.value != true);
    debugPrint('ag loading: $loading');
    final design = DesignSystem.of(context);
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 92,
        leading: const CustomBackButton(),
        //title: Text(titleSnapshot.valueOrNull),
      ),
      body: Stack(
        children: [
          if (manager.value != null)
            WebViewWidget(
              controller: manager.value!.controller,
              gestureRecognizers: {Factory<VerticalDragGestureRecognizer>(() => VerticalDragGestureRecognizer())},
            )
          else
            const ErrorGeneric(),
          if (loading)
            Container(
              color: design.colors.background1.withAlpha(100),
              child: const LoadingGeneric(),
            ),
        ],
      ),
    );
  }
}
