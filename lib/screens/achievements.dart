import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/components/loading_generic.dart';
import 'package:brunstadtv_app/components/achievement_group_section.dart';
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
          builder: ((result, {fetchMore, refetch}) {
            if (result.isLoading) {
              return LoadingGeneric();
            } else if (result.hasException || result.parsedData == null) {
              return ErrorGeneric(
                  details: result.exception?.toString(),
                  onRetry: () {
                    if (refetch != null) refetch();
                  });
            }
            return ListView(
              children: result.parsedData!.achievementGroups.items.map(
                (achievementGroup) {
                  return PageSection(
                    title: achievementGroup.title,
                    rightSlot: GestureDetector(
                      onTap: () {
                        context.router.navigate(AchievementGroupScreenRoute(groupId: achievementGroup.id));
                      },
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text('See All', style: BtvTextStyles.button2),
                            SvgPicture.string(SvgIcons.right),
                          ],
                        ),
                      ),
                    ),
                    child: AchievementGroupSection(
                      achievementGroup: achievementGroup,
                    ),
                  );
                },
              ).toList(),
            );
          }),
        ));
  }
}
