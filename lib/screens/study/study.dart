import 'package:auto_route/auto_route.dart';
import 'package:bccm_core/design_system.dart';
import 'package:bmm_api/bmm_api.dart';
import 'package:brunstadtv_app/api/bmm.dart';
import 'package:brunstadtv_app/components/achievements/achievement_dialog.dart';
import 'package:brunstadtv_app/components/misc/dialog_with_image.dart';
import 'package:brunstadtv_app/components/status/error_generic.dart';
import 'package:brunstadtv_app/components/status/loading_generic.dart';
import 'package:bccm_core/platform.dart';
import 'package:brunstadtv_app/helpers/constants.dart';
import 'package:brunstadtv_app/helpers/main_js_channel.dart';
import 'package:built_collection/built_collection.dart';
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

@RoutePage()
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
    final titleFuture = useMemoized(() {
      return ref
          .read(bccmGraphQLProvider)
          .query$GetLessonTitle(Options$Query$GetLessonTitle(variables: Variables$Query$GetLessonTitle(id: lessonId)));
    });
    final titleSnapshot = useFuture(titleFuture);

    Future handleMessage(List<dynamic> arguments) async {
      if (arguments[0] == 'tasks_completed') {
        _handleTasksCompleted(
          context,
          ref,
          answers: arguments[1],
        );
      }
    }

    final uri = useMemoized(() => Uri.parse('${getWebUrl(ref)}/embed/episode/$episodeId/lesson/$lessonId'));
    final manager = useWebViewManager(uri, setup: (m) {
      MainJsChannel.register(context, m, enableAuth: true);
      m.js.registerSimpleHandler('study', handleMessage);
    });

    final loading = useListenableSelector(manager?.navigation.initialLoadDone, () => manager?.navigation.initialLoadDone.value != true);
    final design = DesignSystem.of(context);
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 92,
        leading: const CustomBackButton(),
        title: Text(titleSnapshot.data?.parsedData?.studyLesson.title ?? ''),
      ),
      body: Stack(
        children: [
          if (manager != null)
            WebViewWidget(
              controller: manager.controller,
              gestureRecognizers: {Factory<EagerGestureRecognizer>(() => EagerGestureRecognizer())},
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

Future _handleTasksCompleted(
  BuildContext context,
  WidgetRef ref, {
  List<dynamic>? answers,
}) async {
  final navigatorContext = Navigator.of(context).context;
  final gqlClient = ref.read(bccmGraphQLProvider);
  final achievements = await gqlClient.query$getPendingAchievements();
  final hasPending = achievements.parsedData != null && achievements.parsedData!.pendingAchievements.isNotEmpty;
  if (!hasPending && navigatorContext.mounted) {
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
    gqlClient.mutate$confirmAchievement(Options$Mutation$confirmAchievement(variables: Variables$Mutation$confirmAchievement(id: achievement.id)));
  }

  debugPrint('answers: $answers');
  if (answers != null && answers.isNotEmpty) {
    final bmmApi = ref.read(bmmApiProvider).getQuestionApi();
    bmmApi.questionAnswersPost(
        handleBccmAnswerCommandBccmAnswer: answers
            .map(
              (answer) => HandleBccmAnswerCommandBccmAnswer((b) {
                b.questionId = answer['questionId'];
                b.selectedAnswerId = answer['answerId'];
                b.answeredCorrectly = answer['answeredCorrectly'];
              }),
            )
            .toBuiltList());
  }
}
