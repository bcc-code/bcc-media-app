import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/components/status_indicators/error_generic.dart';
import 'package:brunstadtv_app/components/status_indicators/loading_generic.dart';
import 'package:brunstadtv_app/components/achievements/achievement_list.dart';
import 'package:brunstadtv_app/graphql/queries/achievements.graphql.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../components/custom_back_button.dart';
import '../../l10n/app_localizations.dart';

class AchievementGroupScreen extends ConsumerStatefulWidget {
  const AchievementGroupScreen({
    Key? key,
    @PathParam() required this.groupId,
  }) : super(key: key);

  final String groupId;

  @override
  ConsumerState<AchievementGroupScreen> createState() => AchievementGroupState();
}

class AchievementGroupState extends ConsumerState<AchievementGroupScreen> {
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
  void didChangeDependencies() {
    super.didChangeDependencies();
    S.of(context).achievements;
  }

  @override
  Widget build(BuildContext context) {
    return Query$getAchievementGroup$Widget(
        options: Options$Query$getAchievementGroup(variables: Variables$Query$getAchievementGroup(id: widget.groupId, achievementsFirst: 100)),
        builder: (result, {fetchMore, refetch}) {
          return Scaffold(
            appBar: AppBar(
              leadingWidth: 92,
              leading: const CustomBackButton(),
              title: Text(result.parsedData?.achievementGroup.title ?? ''),
            ),
            body: Builder(builder: (context) {
              if (result.isLoading) {
                return const LoadingGeneric();
              } else if (result.hasException || result.parsedData == null) {
                return ErrorGeneric(onRetry: () {
                  if (refetch != null) refetch();
                });
              }
              return AchievementList(
                achievements: result.parsedData!.achievementGroup.achievements.items,
              );
            }),
          );
        });
  }
}
