//import 'dart:html';

import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:bccm_player/playback_platform_pigeon.g.dart';
import 'package:brunstadtv_app/components/error_generic.dart';
import 'package:brunstadtv_app/components/loading_indicator.dart';
import 'package:brunstadtv_app/components/season_episode_list.dart';
import 'package:brunstadtv_app/components/feature_badge.dart';
import 'package:brunstadtv_app/components/share_episode_sheet.dart';
import 'package:brunstadtv_app/graphql/client.dart';
import 'package:brunstadtv_app/graphql/schema/pages.graphql.dart';
import 'package:brunstadtv_app/helpers/navigation_override.dart';
import 'package:brunstadtv_app/helpers/svg_icons.dart';
import 'package:brunstadtv_app/router/router.gr.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:bccm_player/bccm_player.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:brunstadtv_app/graphql/queries/episode.graphql.dart';
import 'package:brunstadtv_app/providers/chromecast.dart';
import 'package:brunstadtv_app/services/playback_service.dart';
import 'package:brunstadtv_app/providers/video_state.dart';
import 'package:bccm_player/cast_button.dart';
import 'package:flutter_svg/svg.dart';
import 'package:brunstadtv_app/helpers/transparent_image.dart';
import 'package:graphql/client.dart';
import 'package:shimmer/shimmer.dart';
import 'package:collection/collection.dart';

import '../api/brunstadtv.dart';
import '../components/bottom_sheet_select.dart';
import '../components/custom_back_button.dart';
import '../components/episode_details.dart';
import '../components/episode_tab_selector.dart';
import '../components/error_no_access.dart';
import '../components/fade_indexed_stack.dart';
import '../components/option_list.dart';
import '../components/sections/thumbnail_grid/thumbnail_grid.dart';
import '../components/study_button.dart';
import '../env/env.dart';
import '../graphql/queries/studies.graphql.dart';
import '../helpers/btv_buttons.dart';
import '../theme/bccm_colors.dart';
import '../theme/bccm_typography.dart';
import '../helpers/utils.dart';
import '../helpers/widget_keys.dart';
import '../l10n/app_localizations.dart';

class EpisodePageArguments {
  int episodeId;
  EpisodePageArguments(this.episodeId);
}

class EpisodeScreen extends ConsumerStatefulWidget {
  final String episodeId;
  final bool autoplay;
  final int? queryParamStartPosition;
  final bool? hideBottomSection;
  const EpisodeScreen({
    super.key,
    @PathParam() required this.episodeId,
    @QueryParam() this.autoplay = false,
    @QueryParam('t') this.queryParamStartPosition,
    @QueryParam('hide_bottom_section') this.hideBottomSection,
  });

  @override
  ConsumerState<EpisodeScreen> createState() => _EpisodeScreenState();
}

class _EpisodeScreenState extends ConsumerState<EpisodeScreen> with AutoRouteAwareStateMixin<EpisodeScreen> {
  late Future<Query$FetchEpisode$episode?> episodeFuture;
  Future<Query$GetEpisodeLessonProgress?>? lessonProgressFuture;
  final scrollController = ScrollController();
  String? error;
  Completer? playerSetupCompleter;
  AnimationStatus? animationStatus;
  Completer? scrollCompleter;
  Animation? animation;
  StreamSubscription? chromecastSubscription;
  int selectedTab = 0;
  String? selectedSeasonId;
  Map<String, List<EpisodeListEpisodeData>?> seasonsMap = {};
  Map<String, Fragment$EpisodeLessonProgressOverview> lessonProgressMap = {};

  @override
  void didUpdateWidget(old) {
    super.didUpdateWidget(old);
    scrollCompleter = wrapInCompleter(scrollController.animateTo(0, duration: const Duration(milliseconds: 600), curve: Curves.easeOutExpo));
    if (old.episodeId == widget.episodeId) return;
    loadEpisode();
  }

  @override
  void initState() {
    super.initState();

    loadEpisode();

    chromecastSubscription = ref.read(chromecastListenerProvider).on<CastSessionUnavailable>().listen((event) async {
      var player = ref.read(primaryPlayerProvider);
      var episode = await episodeFuture;
      if (!mounted || episode == null) return;

      ref
          .read(playbackServiceProvider)
          .playEpisode(playerId: player!.playerId, autoplay: false, episode: episode, playbackPositionMs: event.playbackPositionMs);
    });
  }

  Future loadEpisode() async {
    setState(() {
      episodeFuture = ref.read(apiProvider).fetchEpisode(widget.episodeId.toString()).then(
        (result) {
          final episodeSeason = result?.season;
          if (mounted && episodeSeason != null) {
            loadLessonProgressForSeason(episodeSeason.id);
            setState(() {
              seasonsMap = <String, List<EpisodeListEpisodeData>?>{};
              for (var season in result!.season!.$show.seasons.items) {
                seasonsMap[season.id] = null;
              }
              seasonsMap[episodeSeason.id] = episodeSeason.episodes.items.map((ep) {
                return EpisodeListEpisodeData(
                    episodeId: ep.id,
                    ageRating: ep.ageRating,
                    duration: ep.duration,
                    publishDate: ep.publishDate,
                    locked: ep.locked,
                    title: ep.title,
                    image: ep.image,
                    seasonNumber: episodeSeason.number,
                    episodeNumber: ep.number);
              }).toList();
            });
          }
          if (mounted) setState(() => selectedSeasonId = result?.season?.id);
          return result;
        },
      );
      lessonProgressFuture = loadLessonsForEpisode();
    });

    await episodeFuture;
    if (widget.autoplay) {
      if (scrollCompleter == null) {
        setupPlayer();
      } else {
        scrollCompleter!.future.whenComplete(() {
          setupPlayer();
        });
      }
    }
  }

  Future<Query$GetEpisodeLessonProgress?> loadLessonsForEpisode() async {
    final value = await ref.read(gqlClientProvider).query$GetEpisodeLessonProgress(
        Options$Query$GetEpisodeLessonProgress(variables: Variables$Query$GetEpisodeLessonProgress(id: widget.episodeId.toString())));
    final lessonProgress = value.parsedData?.episode;
    if (lessonProgress != null) {
      setState(() {
        lessonProgressMap[widget.episodeId] = lessonProgress;
      });
    }
    return value.parsedData;
  }

  Future<void> loadLessonProgressForSeason(String id) async {
    final value = await ref
        .read(gqlClientProvider)
        .query$GetSeasonLessonProgress(Options$Query$GetSeasonLessonProgress(variables: Variables$Query$GetSeasonLessonProgress(id: id)));
    if (!mounted) return;
    final season = value.parsedData?.season;

    if (season != null) {
      setState(() {
        for (var element in season.episodes.items) {
          lessonProgressMap[element.id] = element;
        }
      });
    }
  }

  Future setupPlayer() async {
    var castingNow = ref.read(isCasting);
    var playerProvider = castingNow ? castPlayerProvider : primaryPlayerProvider;

    var player = ref.read(playerProvider);
    if (player!.currentMediaItem?.metadata?.extras?['id'] == widget.episodeId.toString()) {
      return;
    }

    var episode = await episodeFuture;
    if (!mounted || episode == null) return;

    var startPositionSeconds = 0;
    if (widget.queryParamStartPosition != null && widget.queryParamStartPosition! >= 0) {
      startPositionSeconds = widget.queryParamStartPosition!;
    } else {
      startPositionSeconds = (episode.progress ?? 0);
      if (startPositionSeconds > episode.duration * 0.9) {
        startPositionSeconds = 0;
      }
    }

    setState(() {
      playerSetupCompleter = wrapInCompleter(
        ref
            .read(playbackServiceProvider)
            .playEpisode(playerId: player.playerId, episode: episode, autoplay: true, playbackPositionMs: startPositionSeconds * 1000)
            .timeout(const Duration(milliseconds: 12000)),
      );
    });
  }

  void setStateIfMounted(void Function() fn) {
    if (!mounted) {
      return;
    }
    setState(fn);
  }

  bool episodeIsCurrentItem(MediaItem? mediaItem) {
    return mediaItem?.metadata?.extras?['id'] == widget.episodeId;
  }

  @override
  void dispose() {
    //animation?.removeStatusListener(onAnimationStatus); // trying without it, possibly disposed automatically
    chromecastSubscription?.cancel();
    super.dispose();
  }

  void onAnimationStatus(AnimationStatus status) {
    setStateIfMounted(() {
      animationStatus = status;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    animation = ModalRoute.of(context)?.animation;
    animation?.addStatusListener(onAnimationStatus);
  }

  void shareVideo(Query$FetchEpisode$episode episode) {
    final casting = ref.watch(isCasting);
    final playerProvider = casting ? castPlayerProvider : primaryPlayerProvider;
    final player = ref.watch(playerProvider);
    final currentPosSeconds = ((player?.playbackPositionMs ?? 0) / 1000).round();
    if (player != null) {
      ref.read(playbackApiProvider).pause(player.playerId);
    }
    showModalBottomSheet(
      useRootNavigator: true,
      context: context,
      builder: (ctx) => ShareEpisodeSheet(
        episode: episode,
        currentPosSeconds: currentPosSeconds,
        episodeId: widget.episodeId,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final casting = ref.watch(isCasting);
    var playerProvider = casting ? castPlayerProvider : primaryPlayerProvider;
    var player = ref.watch(playerProvider);

    return FutureBuilder<Query$FetchEpisode$episode?>(
        future: episodeFuture,
        builder: (context, snapshot) {
          var displayPlayer = animationStatus != AnimationStatus.forward && snapshot.hasData;

          return Scaffold(
            appBar: AppBar(
              leadingWidth: 92,
              leading: const CustomBackButton(),
              title: Text(snapshot.data?.season?.$show.title ?? snapshot.data?.title ?? ''),
              actions: const [
                Padding(
                  padding: EdgeInsets.only(left: 16, right: 16.0),
                  child: SizedBox(width: 24, child: CastButton()),
                ),
              ],
            ),
            body: ConditionalParentWidget(
                condition: kIsWeb,
                conditionalBuilder: (child) => Padding(padding: const EdgeInsets.symmetric(horizontal: 300), child: child),
                child: Builder(
                  builder: (context) {
                    if (snapshot.hasError && snapshot.connectionState == ConnectionState.done) {
                      var operationException = snapshot.error.asOrNull<OperationException>();
                      if (operationException?.graphqlErrors.any(
                              (err) => err.extensions?['code'] == ApiErrorCodes.noAccess || err.extensions?['code'] == ApiErrorCodes.notPublished) ==
                          true) {
                        return const ErrorNoAccess();
                      }
                      return ErrorGeneric(onRetry: () => loadEpisode());
                    }
                    if (player == null ||
                        animationStatus == AnimationStatus.forward ||
                        snapshot.data == null && snapshot.connectionState != ConnectionState.done) {
                      return _loading();
                    }
                    debugPrint('snapshot.connectionState : ${snapshot.connectionState}');
                    return _episode(
                        player, displayPlayer, casting, player.playerId, snapshot.data!, snapshot.connectionState != ConnectionState.done, context);
                  },
                )),
          );
        });
  }

  Widget _loading() {
    return Column(
      children: [
        AspectRatio(aspectRatio: 16 / 9, child: Container(color: BccmColors.background2)),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [const LoadingIndicator(), const SizedBox(height: 12), Text(S.of(context).loading, style: BccmTextStyles.body2)],
        ))
      ],
    );
  }

  Widget _episode(Player player, bool displayPlayer, bool casting, String primaryPlayerId, Query$FetchEpisode$episode episode, bool episodeLoading,
      BuildContext context) {
    const showEpisodeNumber = false;
    final episodeNumberFormatted = '${S.of(context).seasonLetter}${episode.season?.number}:${S.of(context).episodeLetter}${episode.number}';

    return FutureBuilder(
        future: playerSetupCompleter?.future,
        builder: (context, playerSetupSnapshot) {
          debugPrint(playerSetupSnapshot.connectionState.toString());
          return SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Column(
                      children: [
                        if (!episodeIsCurrentItem(player.currentMediaItem) &&
                            playerSetupSnapshot.hasError &&
                            playerSetupSnapshot.connectionState != ConnectionState.waiting)
                          _playerError(episode, playerSetupSnapshot)
                        else
                          !episodeIsCurrentItem(player.currentMediaItem)
                              ? _playPoster(episode, loading: playerSetupSnapshot.connectionState == ConnectionState.waiting)
                              : _player(displayPlayer, casting, primaryPlayerId),
                        Container(
                          color: BccmColors.background2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                      Expanded(child: Text(key: WidgetKeys.episodePageEpisodeTitle, episode.title, style: BccmTextStyles.title1)),
                                      GestureDetector(
                                        onTap: () => shareVideo(episode),
                                        child: Padding(
                                          padding: const EdgeInsets.only(top: 4, left: 16),
                                          child: SvgPicture.string(SvgIcons.share, color: BccmColors.label3),
                                        ),
                                      ),
                                    ]),
                                    const SizedBox(height: 4),
                                    Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 3, right: 4),
                                        child: FeatureBadge(label: getFormattedAgeRating(episode.ageRating), color: BccmColors.background2),
                                      ),
                                      if (episode.season?.$show.title != null)
                                        Center(
                                          child: Text(episode.season!.$show.title, style: BccmTextStyles.caption1.copyWith(color: BccmColors.tint1)),
                                        ),
                                      if (showEpisodeNumber)
                                        Padding(
                                            padding: const EdgeInsets.only(left: 4),
                                            child: Text(episodeNumberFormatted, style: BccmTextStyles.caption1.copyWith(color: BccmColors.label4)))
                                    ]),
                                    const SizedBox(height: 14.5),
                                    if (episode.description.isNotEmpty)
                                      Text(episode.description, style: BccmTextStyles.body2.copyWith(color: BccmColors.label3)),
                                    if (Env.enableStudy && episode.lessons.items.isNotEmpty)
                                      Padding(
                                        padding: const EdgeInsets.only(top: 16),
                                        child: simpleFutureBuilder<Query$GetEpisodeLessonProgress?>(
                                          future: lessonProgressFuture,
                                          loading: () => Stack(
                                            children: [
                                              StudyMoreButton(
                                                  progressOverview: Fragment$LessonProgressOverview(
                                                      $__typename: '',
                                                      locked: false,
                                                      id: episode.lessons.items[0].id,
                                                      progress: Fragment$LessonProgressOverview$progress($__typename: '', completed: 0, total: 0))),
                                              Positioned.fill(
                                                  child: Shimmer.fromColors(
                                                      enabled: true,
                                                      baseColor: BccmColors.background2,
                                                      highlightColor: Color.lerp(BccmColors.background2, Colors.white, 0.1)!,
                                                      child: Container(
                                                          decoration:
                                                              BoxDecoration(borderRadius: BorderRadius.circular(9), color: BccmColors.background2))))
                                            ],
                                          ),
                                          error: (e) => const SizedBox.shrink(),
                                          noData: () => const SizedBox.shrink(),
                                          ready: (data) => GestureDetector(
                                            behavior: HitTestBehavior.opaque,
                                            onTap: () async {
                                              if (data!.episode.lessons.items[0].locked) return;
                                              await context.router.root
                                                  .push(StudyScreenRoute(episodeId: episode.id, lessonId: data.episode.lessons.items[0].id));
                                              if (mounted) {
                                                setState(() {
                                                  lessonProgressFuture = loadLessonsForEpisode();
                                                });
                                              }
                                            },
                                            child: StudyMoreButton(progressOverview: data!.episode.lessons.items[0]),
                                          ),
                                        ),
                                      )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    if (episodeLoading)
                      Positioned.fill(
                          child: Container(
                              color: BccmColors.background2,
                              child: const Center(
                                child: LoadingIndicator(),
                              )))
                  ],
                ),
                if (widget.hideBottomSection != true && !unlistedButPartOfASeason(episode))
                  DefaultTabController(
                      length: 2,
                      child: Builder(
                        builder: (context) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(bottom: BorderSide(width: 1, color: BccmColors.separatorOnLight)),
                                ),
                                child: Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: EpisodeTabSelector(
                                        onSelectionChange: (val) {
                                          setState(() {
                                            DefaultTabController.of(context).animateTo(val);
                                          });
                                        },
                                        selectedId: '',
                                        selectedIndex: DefaultTabController.of(context).index,
                                        tabs: [
                                          Option(id: 'episodes', title: (S.of(context).episodes.toUpperCase())),
                                          Option(id: 'details', title: (S.of(context).details.toUpperCase())),
                                        ]))),
                            Builder(builder: (context) {
                              return GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onHorizontalDragUpdate: (details) {
                                  // Note: Sensitivity is integer used when you don't want to mess up vertical drag
                                  var controller = DefaultTabController.maybeOf(context);
                                  if (controller == null) return;
                                  int sensitivity = 16;
                                  if (details.delta.dx > sensitivity && controller.index > 0) {
                                    setState(() {
                                      controller.animateTo(controller.index - 1);
                                    });
                                  } else if (details.delta.dx < -sensitivity && controller.index + 1 < controller.length) {
                                    setState(() {
                                      controller.animateTo(controller.index + 1);
                                    });
                                  }
                                },
                                child: FadeIndexedStack(
                                  index: DefaultTabController.of(context).index,
                                  children: [
                                    if (episode.season != null) _seasonEpisodeList(episode) else _relatedItems(episode),
                                    EpisodeDetails(episode.id)
                                  ],
                                ),
                              );
                            }),
                          ],
                        ),
                      )),
              ],
            ),
          );
        });
  }

  Future onSeasonSelected(String id) async {
    setState(() {
      selectedSeasonId = id;
    });
    var season = await ref.read(apiProvider).getSeasonEpisodes(id);
    if (mounted && season != null) {
      if (season.episodes.items.any((element) => element.lessons.total > 0)) {
        loadLessonProgressForSeason(season.id);
      }
      setState(() {
        seasonsMap[id] = season.episodes.items
            .map((ep) => EpisodeListEpisodeData(
                episodeId: ep.id,
                locked: ep.locked,
                ageRating: ep.ageRating,
                publishDate: ep.publishDate,
                duration: ep.duration,
                title: ep.title,
                image: ep.image,
                lessonProgressOverview: lessonProgressMap[ep.id]?.lessons.items.firstOrNull,
                seasonNumber: season.number,
                episodeNumber: ep.number))
            .toList();
      });
    }
  }

  bool unlistedButPartOfASeason(Query$FetchEpisode$episode episode) {
    return episode.season?.$show.seasons.items.any((s) => s.id == episode.season?.id) == false;
  }

  Widget _seasonEpisodeList(Query$FetchEpisode$episode episode) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        episode.season == null && selectedSeasonId == null
            ? const SizedBox.shrink()
            : Padding(
                padding: const EdgeInsets.only(left: 28, top: 16, bottom: 20),
                child: _DropDownSelect(
                    title: 'Select season',
                    onSelectionChanged: onSeasonSelected,
                    items: episode.season!.$show.seasons.items.map((e) => Option(id: e.id, title: e.title)).toList(),
                    selectedId: selectedSeasonId!),
              ),
        Builder(builder: (context) {
          if (seasonsMap[selectedSeasonId] == null) {
            return const SizedBox(
                height: 1000,
                child: Align(alignment: Alignment.topCenter, child: Padding(padding: EdgeInsets.only(top: 16), child: LoadingIndicator())));
          } else {
            return SeasonEpisodeList(
                items: seasonsMap[selectedSeasonId]!
                    .map((e) => e.copyWith(lessonProgressOverview: lessonProgressMap[e.episodeId]?.lessons.items.firstOrNull))
                    .map(
                      (e) => e.episodeId == widget.episodeId ? e.copyWith(highlighted: true) : e,
                    )
                    .toList());
          }
        }),
      ],
    );
  }

  Widget _relatedItems(Query$FetchEpisode$episode episode) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Builder(builder: (context) {
          if (episode.relatedItems != null) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: NavigationOverride(
                pushInsteadOfReplace: true,
                child: ThumbnailGrid(gridSize: Enum$GridSectionSize.half, sectionItems: episode.relatedItems!.items),
              ),
            );
          }
          return const SizedBox.shrink();
        }),
      ],
    );
  }

  AspectRatio _playPoster(Query$FetchEpisode$episode episode, {required bool loading}) {
    return AspectRatio(
        key: WidgetKeys.playPoster,
        aspectRatio: 16 / 9,
        child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              setupPlayer();
            },
            child: Stack(
              children: [
                AspectRatio(
                    aspectRatio: 16 / 9,
                    child: episode.image == null
                        ? null
                        : LayoutBuilder(builder: (context, constraints) {
                            return Opacity(
                              opacity: scrollCompleter?.isCompleted == false ? 0 : 0.5,
                              child: FadeInImage.memoryNetwork(
                                  fit: BoxFit.cover,
                                  placeholder: kTransparentImage,
                                  image: episode.image!,
                                  fadeInDuration: const Duration(milliseconds: 150),
                                  imageCacheHeight: (constraints.maxHeight * MediaQuery.of(context).devicePixelRatio).round()),
                            );
                          })),
                Center(child: loading ? const LoadingIndicator() : SizedBox(width: 36, height: 36, child: SvgPicture.string(SvgIcons.play))),
              ],
            )));
  }

  _playerError(Query$FetchEpisode$episode episode, AsyncSnapshot<Object?> playerSetupSnapshot) {
    return AspectRatio(
        aspectRatio: 16 / 9,
        child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            //excludeFromSemantics: true,
            onTap: () {
              setupPlayer();
            },
            child: Stack(
              children: [
                AspectRatio(
                    aspectRatio: 16 / 9,
                    child: episode.image == null
                        ? null
                        : LayoutBuilder(builder: (context, constraints) {
                            return Opacity(
                              opacity: scrollCompleter?.isCompleted == false ? 0 : 0.2,
                              child: FadeInImage.memoryNetwork(
                                  fit: BoxFit.cover,
                                  placeholder: kTransparentImage,
                                  image: episode.image!,
                                  fadeInDuration: const Duration(milliseconds: 150),
                                  imageCacheHeight: (constraints.maxHeight * MediaQuery.of(context).devicePixelRatio).round()),
                            );
                          })),
                Center(
                    child: SizedBox(
                  width: 343,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          S.of(context).anErrorOccurred,
                          textAlign: TextAlign.center,
                          style: BccmTextStyles.title3,
                        ),
                        Text(
                          S.of(context).checkNetwork,
                          textAlign: TextAlign.center,
                          style: BccmTextStyles.body2,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: BtvButton.small(
                              onPressed: () {
                                setupPlayer();
                              },
                              labelText: S.of(context).tryAgainButton),
                        )
                      ],
                    ),
                  ),
                )),
              ],
            )));
  }
}

class _DropDownSelect extends StatelessWidget {
  final String selectedId;
  final String title;
  final List<Option> items;
  final void Function(String id) onSelectionChanged;

  const _DropDownSelect({Key? key, required this.items, required this.selectedId, required this.onSelectionChanged, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const SizedBox.shrink();
    }
    final selectedItem = items.firstWhereOrNull((element) => element.id == selectedId);
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        showModalBottomSheet(
            context: context,
            useRootNavigator: true,
            builder: (ctx) {
              return BottomSheetSelect(
                title: title,
                items: items,
                selectedId: selectedId,
                onSelectionChanged: onSelectionChanged,
              );
            });
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (selectedItem != null)
            Text(
              selectedItem.title.toUpperCase(),
              style: BccmTextStyles.button2.copyWith(color: BccmColors.label1),
            ),
          Padding(
            padding: const EdgeInsets.only(left: 6),
            child: Center(
              child: SvgPicture.string(SvgIcons.chevronDown),
            ),
          )
        ],
      ),
    );
  }
}

Widget _player(bool displayPlayer, bool casting, String primaryPlayerId) {
  if (displayPlayer) {
    /* if (casting) {
      return ElevatedButton(
          onPressed: () {
            PlaybackPlatformInterface.instance.openExpandedCastController();
          },
          child: const Text('open'));
    } */
    return BccmPlayer(key: const Key('test'), id: casting ? 'chromecast' : primaryPlayerId);
  } else {
    return const AspectRatio(aspectRatio: 16 / 9, child: Center(child: SizedBox(width: 40, height: 40, child: CircularProgressIndicator())));
  }
}
