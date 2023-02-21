//import 'dart:html';

import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:bccm_player/playback_platform_pigeon.g.dart';
import 'package:brunstadtv_app/components/episode/episode_info.dart';
import 'package:brunstadtv_app/components/episode/episode_related.dart';
import 'package:brunstadtv_app/components/episode/episode_season.dart';
import 'package:brunstadtv_app/components/episode/player_poster.dart';
import 'package:brunstadtv_app/components/error_generic.dart';
import 'package:brunstadtv_app/components/loading_indicator.dart';
import 'package:brunstadtv_app/components/season_episode_list.dart';
import 'package:brunstadtv_app/components/feature_badge.dart';
import 'package:brunstadtv_app/components/share_episode_sheet.dart';
import 'package:brunstadtv_app/graphql/client.dart';
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
import 'package:graphql/client.dart';
import 'package:shimmer/shimmer.dart';
import 'package:collection/collection.dart';

import '../api/brunstadtv.dart';
import '../components/custom_back_button.dart';
import '../components/episode/episode_tabs.dart';
import '../components/episode/player_error.dart';
import '../components/episode_details.dart';
import '../components/episode_tab_selector.dart';
import '../components/error_no_access.dart';
import '../components/fade_indexed_stack.dart';
import '../components/option_list.dart';
import '../components/study_button.dart';
import '../env/env.dart';
import '../graphql/queries/studies.graphql.dart';
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
    final casting = ref.read(isCasting);
    final playerProvider = casting ? castPlayerProvider : primaryPlayerProvider;
    final player = ref.read(playerProvider);
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
                  if (operationException?.graphqlErrors
                          .any((err) => err.extensions?['code'] == ApiErrorCodes.noAccess || err.extensions?['code'] == ApiErrorCodes.notPublished) ==
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
            ),
          ),
        );
      },
    );
  }

  Widget _loading() {
    return Column(
      children: [
        AspectRatio(aspectRatio: 16 / 9, child: Container(color: BccmColors.background2)),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [const LoadingIndicator(), const SizedBox(height: 12), Text(S.of(context).loading, style: BccmTextStyles.body2)],
          ),
        ),
      ],
    );
  }

  Widget _episode(Player player, bool displayPlayer, bool casting, String primaryPlayerId, Query$FetchEpisode$episode episode, bool episodeLoading,
      BuildContext context) {
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
                        PlayerError(
                          imageUrl: episode.image,
                          onRetry: setupPlayer,
                        )
                      else
                        !episodeIsCurrentItem(player.currentMediaItem)
                            ? PlayerPoster(
                                imageUrl: episode.image,
                                setupPlayer: setupPlayer,
                                loading: playerSetupSnapshot.connectionState == ConnectionState.waiting,
                                imageOpacity: scrollCompleter?.isCompleted == false ? 0 : 0.5,
                              )
                            : Builder(builder: (context) {
                                if (displayPlayer) {
                                  return BccmPlayer(id: player.playerId);
                                } else {
                                  return const AspectRatio(
                                    aspectRatio: 16 / 9,
                                    child: Center(
                                      child: SizedBox(
                                        width: 40,
                                        height: 40,
                                        child: CircularProgressIndicator(),
                                      ),
                                    ),
                                  );
                                }
                              }),
                      EpisodeInfo(
                        episode,
                        onShareVideoTapped: () => shareVideo(episode),
                        extraChildren: [
                          if (Env.enableStudy && episode.lessons.items.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.only(top: 16),
                              child: StudyMoreButton(
                                progressOverviewFuture: lessonProgressFuture,
                                onNavigateBack: () {
                                  setState(() {
                                    lessonProgressFuture = loadLessonsForEpisode();
                                  });
                                },
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                  if (episodeLoading)
                    Positioned.fill(
                      child: Container(
                        color: BccmColors.background1,
                        child: const Center(
                          child: LoadingIndicator(),
                        ),
                      ),
                    ),
                ],
              ),
              if (widget.hideBottomSection != true && !unlistedButPartOfASeason(episode))
                EpisodeTabs(
                  tabs: [
                    Option(id: 'episodes', title: (S.of(context).episodes.toUpperCase())),
                    Option(id: 'details', title: (S.of(context).details.toUpperCase())),
                  ],
                  children: [
                    if (episode.season == null)
                      EpisodeRelated(episode: episode)
                    else
                      EpisodeSeason(
                        episode: episode,
                        selectedSeasonId: selectedSeasonId,
                        onSeasonSelected: onSeasonSelected,
                        seasons: seasonsMap,
                        lessonProgress: lessonProgressMap,
                      ),
                    EpisodeDetails(episode.id)
                  ],
                ),
            ],
          ),
        );
      },
    );
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
}
