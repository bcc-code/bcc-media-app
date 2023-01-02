import 'package:brunstadtv_app/components/loading_generic.dart';
import 'package:brunstadtv_app/graphql/client.dart';
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

  void handleMessage(List<dynamic> arguments) {
    if (arguments[0] == 'tasks_completed') {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => const _WellDoneDialog(),
      );
    }
  }
}

class _WellDoneDialog extends StatelessWidget {
  const _WellDoneDialog();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.only(left: 32, right: 32, top: 40, bottom: 32),
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Well done!', style: BtvTextStyles.headline1),
            Text('Great job on completing the video.', style: BtvTextStyles.caption1.copyWith(color: BtvColors.label3)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: SvgPicture.string(SvgIcons.tasksCompleted),
            ),
            Text(
              'Watch the episode again and explore other available resources to deepen your understanding.',
              textAlign: TextAlign.center,
              style: BtvTextStyles.caption1.copyWith(color: BtvColors.label3),
            ),
            Container(
              padding: const EdgeInsets.only(top: 24),
              width: double.infinity,
              child: BtvButton.large(
                onPressed: () {
                  Navigator.pop(context);
                },
                labelText: 'Ok',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
