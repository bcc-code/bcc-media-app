import 'package:brunstadtv_app/components/loading_generic.dart';
import 'package:brunstadtv_app/components/study_progess_achievements.dart';
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

class AchievementsScreen extends ConsumerStatefulWidget {
  const AchievementsScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<AchievementsScreen> createState() => AchievementsScreenState();
}

class AchievementsScreenState extends ConsumerState<AchievementsScreen> {
  String pageTitle = '';
  String url = '';
  InAppWebViewController? webViewController;
  WebResourceError? error;
  bool loading = false;
  double? height;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leadingWidth: 92,
          leading: const CustomBackButton(),
          title: Text(pageTitle),
        ),
        body: loading ? const LoadingGeneric() : StudyProgressAchievements());
  }
}
