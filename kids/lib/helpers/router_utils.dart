import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/graphql/queries/page.graphql.dart';
import 'package:brunstadtv_app/helpers/extensions.dart';
import 'package:brunstadtv_app/helpers/router/navigation_override.dart';
import 'package:brunstadtv_app/providers/analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kids/router/router.gr.dart';

Future<dynamic>? handleSectionItemClick(BuildContext context, Fragment$ItemSectionItem$item item, {String? collectionId}) {
  final ref = ProviderScope.containerOf(context, listen: false);
  final analytics = ref.read(analyticsProvider);
  analytics.sectionItemClicked(context);

  final navigationOverride = NavigationOverride.of(context);
  final episodeItem = item.asOrNull<Fragment$ItemSectionItem$item$$Episode>();
  if (episodeItem != null && !episodeItem.locked) {
    return context.router.push(ShowScreenRoute(showId: episodeItem.id));
  }
  final showItem = item.asOrNull<Fragment$ItemSectionItem$item$$Show>();
  if (showItem != null) {
    return context.router.push(ShowScreenRoute(showId: showItem.id));
  }
  return showDialog(context: context, builder: (context) => SimpleDialog(title: Text('Clicked ${item.$__typename} ')));
}
