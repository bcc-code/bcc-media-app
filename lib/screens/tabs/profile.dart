import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:bccm_player/bccm_player.dart';
import 'package:brunstadtv_app/components/misc/horizontal_slider.dart';
import 'package:brunstadtv_app/components/misc/parental_gate.dart';
import 'package:brunstadtv_app/components/pages/sections/section_with_header.dart';
import 'package:brunstadtv_app/components/profile/avatar.dart';
import 'package:brunstadtv_app/components/profile/empty_info.dart';
import 'package:brunstadtv_app/components/thumbnails/episode_thumbnail.dart';
import 'package:brunstadtv_app/flavors.dart';
import 'package:brunstadtv_app/graphql/client.dart';
import 'package:brunstadtv_app/helpers/hooks/use_route_aware.dart';
import 'package:brunstadtv_app/providers/auth_state/auth_state.dart';
import 'package:brunstadtv_app/providers/downloads.dart';
import 'package:brunstadtv_app/providers/feature_flags.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';
import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simple_shadow/simple_shadow.dart';

import '../../components/misc/custom_grid_view.dart';
import '../../components/offline/downloaded_videos.dart';
import '../../helpers/event_bus.dart';
import '../../helpers/watch_progress_bottom_sheet.dart';
import '../../components/status/error_generic.dart';
import '../../components/status/loading_generic.dart';
import '../../components/thumbnails/grid/thumbnail_grid_episode.dart';
import '../../graphql/queries/my_list.graphql.dart';
import '../../helpers/svg_icons.dart';
import '../../models/analytics/sections.dart';
import '../../models/episode_thumbnail_data.dart';
import '../../models/events/watch_progress.dart';
import '../../providers/analytics.dart';
import '../../providers/inherited_data.dart';
import '../../router/router.gr.dart';
import '../../helpers/extensions.dart';
import '../../theme/design_system/design_system.dart';

@RoutePage<void>()
class ProfileScreen extends HookConsumerWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.read(authStateProvider.select((value) => value.user));

    getMyList() {
      if (user == null) {
        return Future.value(null);
      }
      return ref.read(gqlClientProvider).query$MyList(Options$Query$MyList(errorPolicy: ErrorPolicy.all));
    }

    final myListFuture = useState(useMemoized(getMyList));
    onFavoritesRefresh() => myListFuture.value = getMyList();

    useIsTabActive(onChange: (active) {
      if (active) {
        myListFuture.value = getMyList();
      }
    });

    final design = DesignSystem.of(context);
    final downloadedVideosCount = ref.watch(downloadsProvider.select((value) => value.valueOrNull?.length ?? 0));

    return Scaffold(
      appBar: AppBar(
        title: Image(
          image: FlavorConfig.current.bccmImages!.logo,
          height: FlavorConfig.current.bccmImages!.logoHeight,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: ConstrainedBox(
              constraints: BoxConstraints.loose(const Size(24, 24)),
              child: CastButton(color: design.colors.tint1),
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Avatar(),
                  if (user != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Text(
                        user.name,
                        style: design.textStyles.headline2,
                      ),
                    )
                  else if (ref.watch(authEnabledProvider))
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: design.buttons.small(
                        onPressed: () => context.router.navigate(OnboardingScreenRoute()),
                        labelText: S.of(context).signInOrSignUp,
                      ),
                    ),
                  Container(
                    margin: const EdgeInsets.only(top: 12),
                    child: design.buttons.small(
                      variant: ButtonVariant.secondary,
                      onPressed: () async {
                        if ((FlavorConfig.current.flavor == Flavor.kids && !await checkParentalGate(context))) {
                          return;
                        }
                        if (!context.mounted) return;
                        context.router.pushNamed('/settings');
                      },
                      labelText: S.of(context).settings,
                      image: SvgPicture.string(
                        SvgIcons.settings,
                        height: 20,
                        colorFilter: ColorFilter.mode(design.colors.label1, BlendMode.srcIn),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (user != null) ...[
            SliverToBoxAdapter(
              child: SectionWithHeader(
                title: S.of(context).yourFavorites,
                child: FutureBuilder(
                  future: myListFuture.value,
                  builder: (context, snapshot) {
                    Widget child = const SizedBox.shrink();
                    final items =
                        snapshot.data?.parsedData?.myList.entries.items.where((el) => el.item is Fragment$MyListEntry$item$$Episode).toList();
                    if (snapshot.connectionState != ConnectionState.done) {
                      child = const SizedBox(height: 250, child: LoadingGeneric());
                    } else if (snapshot.hasError || items == null) {
                      child = SizedBox(height: 200, child: ErrorGeneric(onRetry: onFavoritesRefresh));
                    } else if (items.isEmpty) {
                      child = Container(
                        padding: const EdgeInsets.all(16),
                        width: double.infinity,
                        child: EmptyInfo(
                          icon: SvgPicture.string(
                            SvgIcons.heartFilled,
                            height: 36,
                          ),
                          title: S.of(context).saveYourFavorites,
                          details: S.of(context).saveYourFavoritesDescription,
                        ),
                      );
                    } else {
                      child = _EpisodeFavorites(items);
                    }
                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 250),
                      child: child,
                    );
                  },
                ),
              ),
            ),
            if (ref.watch(featureFlagsProvider.select((value) => value.shorts)))
              SliverToBoxAdapter(
                child: SectionWithHeader(
                  title: S.of(context).likedShorts,
                  child: FutureBuilder(
                    future: myListFuture.value,
                    builder: (context, snapshot) {
                      Widget child = const SizedBox.shrink();
                      final items =
                          snapshot.data?.parsedData?.myList.entries.items.where((el) => el.item is Fragment$MyListEntry$item$$Short).toList();
                      if (snapshot.connectionState != ConnectionState.done) {
                        child = const SizedBox(height: 250, child: LoadingGeneric());
                      } else if (snapshot.hasError || items == null) {
                        child = SizedBox(height: 200, child: ErrorGeneric(onRetry: onFavoritesRefresh));
                      } else if (items.isEmpty) {
                        child = Container(
                          padding: const EdgeInsets.all(16),
                          width: double.infinity,
                          child: EmptyInfo(
                            icon: SvgPicture.string(
                              SvgIcons.heartFilled,
                              height: 36,
                            ),
                            title: S.of(context).saveYourFavoriteShorts,
                            details: S.of(context).saveYourFavoritesDescription,
                          ),
                        );
                      } else {
                        child = _ShortFavorites(items);
                      }
                      return AnimatedSwitcher(
                        duration: const Duration(milliseconds: 250),
                        child: child,
                      );
                    },
                  ),
                ),
              ),
          ],
          if (downloadedVideosCount > 0 || ref.watch(downloadsEnabledProvider))
            const SliverToBoxAdapter(
              child: DownloadedVideosSection(),
            ),
          const SliverToBoxAdapter(child: SizedBox(height: 32)),
        ],
      ),
    );
  }
}

class _ShortFavorites extends HookConsumerWidget {
  const _ShortFavorites(this.items);

  final List<Fragment$MyListEntry> items;

  EpisodeThumbnailData getEpisodeThumbnailData(Fragment$MyListEntry$item$$Short short) {
    return EpisodeThumbnailData(
      title: '',
      duration: null,
      image: short.image,
      locked: false,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myListEntries = useState(items);

    final design = DesignSystem.of(context);

    final shortItems = myListEntries.value.map((item) => item.item).whereType<Fragment$MyListEntry$item$$Short>();
    const double thumbnailHeight = 130;
    const double basePadding = 16;
    return HorizontalSlider(
      height: thumbnailHeight + basePadding * 2,
      padding: const EdgeInsets.all(basePadding),
      itemCount: shortItems.length,
      itemBuilder: (context, index) {
        final item = shortItems.elementAt(index);
        return _FavoriteItemClickWrapper(
          item: item,
          analytics: SectionItemAnalytics(
            id: item.id,
            name: item.title,
            type: item.$__typename,
            position: index,
          ),
          child: Align(
            alignment: Alignment.topCenter,
            child: ConstrainedBox(
              constraints: const BoxConstraints.tightFor(height: thumbnailHeight),
              child: Stack(
                children: [
                  EpisodeThumbnail.withSize(
                    episode: getEpisodeThumbnailData(item),
                    imageSize: const Size(88, thumbnailHeight),
                  ),
                  Positioned.fill(child: Container(color: design.colors.background1.withOpacity(0.3))),
                  Positioned.fill(
                    child: Center(child: SimpleShadow(offset: const Offset(0, 0), child: SvgPicture.string(SvgIcons.play, height: 24))),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _EpisodeFavorites extends HookConsumerWidget {
  const _EpisodeFavorites(this.items);

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
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: episodeItems.mapIndexed((index, item) {
        return _FavoriteItemClickWrapper(
          item: item,
          analytics: SectionItemAnalytics(
            id: item.id,
            name: item.title,
            type: item.$__typename,
            position: index,
          ),
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

class _FavoriteItemClickWrapper extends ConsumerWidget {
  const _FavoriteItemClickWrapper({required this.item, required this.child, required this.analytics});

  final Fragment$MyListEntry$item item;
  final SectionItemAnalytics analytics;
  final Widget child;

  onTap(BuildContext context, WidgetRef ref) {
    final episodeItem = item.asOrNull<Fragment$MyListEntry$item$$Episode>();
    if (episodeItem != null) {
      context.navigateTo(EpisodeScreenRoute(episodeId: episodeItem.id));
    }
    final shortItem = item.asOrNull<Fragment$MyListEntry$item$$Short>();
    if (shortItem != null) {
      context.router.navigate(ShortScreenRoute(id: shortItem.id));
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
