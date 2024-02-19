import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/components/achievements/achievement_dialog.dart';
import 'package:brunstadtv_app/components/misc/dialog_with_image.dart';
import 'package:brunstadtv_app/components/status/loading_generic.dart';
import 'package:bccm_core/platform.dart';
import 'package:brunstadtv_app/helpers/constants.dart';
import 'package:brunstadtv_app/helpers/webview/should_override_url_loading.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../components/nav/custom_back_button.dart';
import '../../helpers/svg_icons.dart';
import '../../helpers/webview/main_js_channel.dart';
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
    Future getTitle() async {
      final value = await ref
          .read(bccmGraphQLProvider)
          .query$GetLessonTitle(Options$Query$GetLessonTitle(variables: Variables$Query$GetLessonTitle(id: lessonId)));
      return value.parsedData?.studyLesson.title;
    }

    final titleFuture = useState(useMemoized(getTitle));
    final titleSnapshot = useFuture(titleFuture.value);
    final webViewController = useState<InAppWebViewController?>(null);
    final firstLoadDone = useState(false);
    final initialUrl = useState('${getWebUrl(ref)}/embed/episode/$episodeId/lesson/$lessonId');
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

    void onWebViewCreated(InAppWebViewController controller) async {
      MainJsChannel.register(context, controller, enableAuth: true);
      controller.addJavaScriptHandler(handlerName: 'flutter_study', callback: handleMessage);
      webViewController.value = controller;
    }

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 92,
        leading: const CustomBackButton(),
        //title: Text(titleSnapshot.valueOrNull),
      ),
      body: Stack(
        children: [
          Opacity(
            opacity: firstLoadDone.value ? 1 : 0,
            child: InAppWebView(
              initialUrlRequest: URLRequest(
                url: WebUri.uri(Uri.parse(initialUrl.value)),
                allowsCellularAccess: true,
                allowsConstrainedNetworkAccess: true,
                allowsExpensiveNetworkAccess: true,
              ),
              gestureRecognizers: {Factory<VerticalDragGestureRecognizer>(() => VerticalDragGestureRecognizer())},
              initialSettings: InAppWebViewSettings(
                useHybridComposition: false,
                transparentBackground: true,
                verticalScrollBarEnabled: false,
                useShouldOverrideUrlLoading: true,
                allowsInlineMediaPlayback: true,
                mediaPlaybackRequiresUserGesture: false,
                iframeAllowFullscreen: true,
              ),
              onWebViewCreated: onWebViewCreated,
              onLoadStop: (controller, url) {
                firstLoadDone.value = true;
              },
              shouldOverrideUrlLoading: shouldOverrideUrlLoading(initialUrl.value),
            ),
          ),
          if (!firstLoadDone.value) const LoadingGeneric()
        ],
      ),
    );
  }
}
