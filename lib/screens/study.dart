import 'package:brunstadtv_app/components/achievement_dialog.dart';
import 'package:brunstadtv_app/components/dialog_with_image.dart';
import 'package:brunstadtv_app/components/loading_generic.dart';
import 'package:brunstadtv_app/graphql/client.dart';
import 'package:brunstadtv_app/graphql/queries/achievements.graphql.dart';
import 'package:brunstadtv_app/helpers/btv_typography.dart';
import 'package:brunstadtv_app/helpers/constants.dart';
import 'package:brunstadtv_app/helpers/webview/should_override_url_loading.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/custom_back_button.dart';
import '../env/env.dart';
import '../graphql/queries/studies.graphql.dart';
import '../helpers/btv_buttons.dart';
import '../helpers/btv_colors.dart';
import '../helpers/svg_icons.dart';
import '../helpers/webview/main_js_channel.dart';
import '../l10n/app_localizations.dart';

class StudyScreen extends ConsumerStatefulWidget {
  final String episodeId;
  final String lessonId;

  StudyScreen({
    Key? key,
    required this.episodeId,
    required this.lessonId,
  }) : super(key: key ?? GlobalKey<StudyScreenState>());

  @override
  ConsumerState<StudyScreen> createState() => StudyScreenState();
}

class StudyScreenState extends ConsumerState<StudyScreen> {
  String pageTitle = '';
  String url = '';
  InAppWebViewController? webViewController;
  WebResourceError? error;
  bool loading = true;
  double? height;

  @override
  void initState() {
    super.initState();
    getTitle();
  }

  Future getTitle() async {
    final value = await ref
        .read(gqlClientProvider)
        .query$GetLessonTitle(Options$Query$GetLessonTitle(variables: Variables$Query$GetLessonTitle(id: widget.lessonId)));
    setState(() {
      pageTitle = value.parsedData?.studyLesson.title ?? '';
    });
  }

  void onWebViewCreated(InAppWebViewController controller) async {
    setState(() {
      webViewController = controller;
    });
    MainJsChannel.register(context, controller);
    controller.addJavaScriptHandler(handlerName: 'flutter_study', callback: handleMessage);
    final webUrl = await getWebUrl();
    url = '$webUrl/embed/episode/${widget.episodeId}/lesson/${widget.lessonId}';
    final uri = Uri.tryParse(url);
    if (uri != null) {
      webViewController?.loadUrl(
        urlRequest: URLRequest(
          url: WebUri.uri(uri),
          allowsCellularAccess: true,
          allowsConstrainedNetworkAccess: true,
          allowsExpensiveNetworkAccess: true,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 92,
        leading: const CustomBackButton(),
        title: Text(pageTitle),
      ),
      body: Stack(
        children: [
          Opacity(
            opacity: loading ? 0 : 1,
            child: InAppWebView(
              gestureRecognizers: {Factory<VerticalDragGestureRecognizer>(() => VerticalDragGestureRecognizer())},
              initialSettings: InAppWebViewSettings(useHybridComposition: false, transparentBackground: true, verticalScrollBarEnabled: false),
              onWebViewCreated: onWebViewCreated,
              onConsoleMessage: (_, msg) => debugPrint(msg.message),
              onLoadStop: (controller, url) {
                Future.delayed(const Duration(seconds: 0), () => setState(() => loading = false));
              },
              shouldOverrideUrlLoading: shouldOverrideUrlLoading(url),
            ),
          ),
          if (loading) const LoadingGeneric()
        ],
      ),
    );
  }

  Future handleMessage(List<dynamic> arguments) async {
    if (arguments[0] == 'tasks_completed') {
      handleTasksCompleted();
    }
  }

  Future handleTasksCompleted() async {
    final navigatorContext = Navigator.of(context).context;
    final gqlClient = ref.read(gqlClientProvider);
    final achievements = await gqlClient.query$getPendingAchievements();

    if (achievements.parsedData?.pendingAchievements.isNotEmpty != true) {
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
      await showDialog(
        barrierDismissible: false,
        context: navigatorContext,
        builder: (context) => AchievementDialog(
          achievement: achievement,
          dismissButtonText: S.of(context).continueButton,
        ),
      );
      //gqlClient.mutate$confirmAchievement(Options$Mutation$confirmAchievement(variables: Variables$Mutation$confirmAchievement(id: achievement.id)));
    }
  }
}
