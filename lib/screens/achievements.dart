import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/components/loading_generic.dart';
import 'package:brunstadtv_app/components/achievement_list.dart';
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
import '../components/error_generic.dart';
import '../components/page_section.dart';
import '../components/see_more.dart';
import '../env/env.dart';
import '../graphql/queries/studies.graphql.dart';
import '../helpers/btv_buttons.dart';
import '../helpers/btv_colors.dart';
import '../helpers/svg_icons.dart';
import '../helpers/webview/main_js_channel.dart';
import '../l10n/app_localizations.dart';
import '../router/router.gr.dart';

class AchievementsScreen extends ConsumerStatefulWidget {
  const AchievementsScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<AchievementsScreen> createState() => AchievementsScreenState();
}

class AchievementsScreenState extends ConsumerState<AchievementsScreen> {
  InAppWebViewController? webViewController;
  bool loading = false;

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
          title: Text(S.of(context).achievements),
        ),
        body: Query$getAchievementGroups$Widget(
          options: Options$Query$getAchievementGroups(variables: Variables$Query$getAchievementGroups(first: 100, achievementsFirst: 6)),
          builder: ((result, {fetchMore, refetch}) {
            if (result.isLoading) {
              return const LoadingGeneric();
            } else if (result.hasException || result.parsedData == null) {
              return ErrorGeneric(
                details: result.exception?.toString(),
                onRetry: () {
                  if (refetch != null) refetch();
                },
              );
            }
            return ListView(
              children: result.parsedData!.achievementGroups.items.map(
                (achievementGroup) {
                  return PageSection(
                    title: achievementGroup.title,
                    rightSlot: SeeMoreSlot(onTap: () => context.router.navigate(AchievementGroupScreenRoute(groupId: achievementGroup.id))),
                    child: AchievementList(
                      achievements: achievementGroup.achievements.items,
                    ),
                  );
                },
              ).toList(),
            );
          }),
        ));
  }
}
