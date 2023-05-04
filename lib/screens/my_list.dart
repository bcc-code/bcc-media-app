import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../api/brunstadtv.dart';
import '../components/custom_grid_view.dart';
import '../helpers/event_bus.dart';
import '../helpers/watch_progress_bottom_sheet.dart';
import '../components/error_generic.dart';
import '../components/loading_generic.dart';
import '../components/sections/thumbnail_grid/thumbnail_grid_episode.dart';
import '../graphql/queries/my_list.graphql.dart';
import '../helpers/ui/svg_icons.dart';
import '../models/analytics/sections.dart';
import '../models/episode_thumbnail_data.dart';
import '../models/events/watch_progress.dart';
import '../providers/analytics.dart';
import '../providers/inherited_data.dart';
import '../router/router.gr.dart';
import '../helpers/extensions.dart';
import '../theme/design_system/design_system.dart';

class MyListScreen extends HookConsumerWidget {
  const MyListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showAppBar = useState(false);
    final myListFuture = useState(ref.read(apiProvider).getMyList());

    useEffect(() {
      showAppBar.value = false;
      myListFuture.value.then((myList) => showAppBar.value = myList.entries.items.isNotEmpty);
      return null;
    }, [myListFuture.value]);

    onRefresh() => myListFuture.value = ref.read(apiProvider).getMyList();

    return Scaffold(
      appBar: showAppBar.value ? AppBar(title: Text(S.of(context).myList)) : null,
      body: FutureBuilder(
        future: myListFuture.value,
        builder: (context, AsyncSnapshot<Query$MyList$myList> snapshot) {
          Widget child = const SizedBox.shrink();
          if (snapshot.connectionState != ConnectionState.done) {
            child = const Center(child: LoadingGeneric());
          } else if (snapshot.hasError || snapshot.data == null) {
            print(snapshot.error);
            child = ErrorGeneric(onRetry: onRefresh);
          } else if (snapshot.data!.entries.items.isEmpty) {
            child = const _MyListEmptyInfo();
          } else {
            child = RefreshIndicator(
              onRefresh: onRefresh,
              child: _MyListContent(snapshot.data!.entries.items),
            );
          }
          return AnimatedSwitcher(duration: const Duration(milliseconds: 250), child: child);
        },
      ),
    );
  }
}

class _MyListContent extends HookConsumerWidget {
  const _MyListContent(this.items);

  final List<Fragment$MyListEntry> items;

  EpisodeThumbnailData getEpisodeThumbnailData(Fragment$MyListEntry$item$$Episode episode) {
    return EpisodeThumbnailData(
      title: episode.title,
      duration: episode.duration,
      image: episode.image,
      locked: episode.locked,
      progress: episode.progress,
      publishDate: episode.publishDate,
    );
  }

  StreamSubscription setEpisodeProgressUpdateSubscription(ValueNotifier<List<Fragment$MyListEntry>> myListEntries) {
    return globalEventBus.on<WatchProgressUpdatedEvent>().listen((event) async {
      myListEntries.value = myListEntries.value.map(
        (entry) {
          final episodeItem = entry.item.asOrNull<Fragment$MyListEntry$item$$Episode>();
          if (episodeItem != null && episodeItem.id == event.episodeId) {
            return entry.copyWith(
              item: episodeItem.copyWith(progress: event.progress),
            );
          }
          return entry;
        },
      ).toList();
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myListEntries = useState(items);

    useEffect(() {
      final subscription = setEpisodeProgressUpdateSubscription(myListEntries);
      return subscription.cancel;
    }, []);

    final episodeItems = myListEntries.value.map((item) => item.item).whereType<Fragment$MyListEntry$item$$Episode>();
    return CustomGridView(
      shrinkWrap: false,
      physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      children: episodeItems.mapIndexed((index, item) {
        return _MyListItemClickWrapper(
          item: item,
          analytics: SectionItemAnalytics(id: item.id, name: item.title, type: item.$__typename, position: index),
          child: ThumbnailGridEpisode(
            episode: getEpisodeThumbnailData(item),
            showSecondaryTitle: false,
            aspectRatio: 16 / 9,
          ),
        );
      }).toList(),
    );
  }
}

class _MyListEmptyInfo extends StatelessWidget {
  const _MyListEmptyInfo();

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 2),
            child: SvgPicture.string(SvgIcons.heartInfo),
          ),
          Text(
            S.of(context).didYouKnowTitle,
            style: design.textStyles.headline1,
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 42),
            child: Text(
              S.of(context).didYouKnowContent,
              textAlign: TextAlign.center,
              style: design.textStyles.body1.copyWith(color: design.colors.label3),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 2, left: 8, right: 8),
            child: design.buttons.large(
              labelText: S.of(context).exploreContent,
              onPressed: () => context.navigateTo(const HomeScreenWrapperRoute()),
            ),
          ),
        ],
      ),
    );
  }
}

class _MyListItemClickWrapper extends ConsumerWidget {
  const _MyListItemClickWrapper({required this.item, required this.child, required this.analytics});

  final Fragment$MyListEntry$item item;
  final SectionItemAnalytics analytics;
  final Widget child;

  onTap(BuildContext context, WidgetRef ref) {
    final episodeItem = item.asOrNull<Fragment$MyListEntry$item$$Episode>();
    if (episodeItem != null) {
      context.navigateTo(EpisodeScreenRoute(episodeId: episodeItem.id));
    }
    ref.read(analyticsProvider).myListTabEntryClicked(context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InheritedData<SectionItemAnalytics>(
      inheritedData: analytics,
      child: (context) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => onTap(context, ref),
        onLongPress: () {
          final episodeItem = item.asOrNull<Fragment$MyListEntry$item$$Episode>();
          if (episodeItem != null) {
            showWatchProgressBottomSheet(context, ref, episodeItem.id, episodeItem.progress);
          }
        },
        child: child,
      ),
    );
  }
}
