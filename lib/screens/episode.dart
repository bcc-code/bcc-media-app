//import 'dart:html';

import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:bccm_player/playback_platform_pigeon.g.dart';
import 'package:brunstadtv_app/components/season_episode_list.dart';
import 'package:brunstadtv_app/components/feature_badge.dart';
import 'package:brunstadtv_app/graphql/schema/items.graphql.dart';
import 'package:brunstadtv_app/helpers/svg_icons.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:bccm_player/bccm_player.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:brunstadtv_app/graphql/queries/episode.graphql.dart';
import 'package:brunstadtv_app/providers/chromecast.dart';
import 'package:brunstadtv_app/providers/fun.dart';
import 'package:brunstadtv_app/providers/playback_api.dart';
import 'package:brunstadtv_app/providers/video_state.dart';
import 'package:bccm_player/cast_button.dart';
import 'package:flutter_svg/svg.dart';
import 'package:transparent_image/transparent_image.dart';

import '../api/brunstadtv.dart';
import '../components/bottom_sheet_select.dart';
import '../components/custom_back_button.dart';
import '../components/label_tag.dart';
import '../components/option_list.dart';
import '../helpers/btv_colors.dart';
import '../helpers/btv_typography.dart';
import '../helpers/utils.dart';
import '../l10n/app_localizations.dart';

class EpisodePageArguments {
  int episodeId;
  EpisodePageArguments(this.episodeId);
}

class EpisodeScreen extends ConsumerStatefulWidget {
  final String episodeId;
  final bool autoplay;
  const EpisodeScreen(
      {super.key,
      @PathParam() required this.episodeId,
      @QueryParam() this.autoplay = false});

  @override
  ConsumerState<EpisodeScreen> createState() => _EpisodeScreenState();
}

class _EpisodeScreenState extends ConsumerState<EpisodeScreen> {
  late Future<Query$FetchEpisode$episode?> episodeFuture;
  bool settingUp = false;
  String? error;
  Completer? setupCompleter;
  AnimationStatus? animationStatus;
  Animation? animation;
  StreamSubscription? chromecastSubscription;

  String? selectedSeasonId;
  Map<String, List<EpisodeListEpisodeData>?>? seasonsMap;

  @override
  void didUpdateWidget(old) {
    super.didUpdateWidget(old);
    if (old.episodeId == widget.episodeId) return;
    loadEpisode();
  }

  @override
  void initState() {
    super.initState();

    loadEpisode();

    chromecastSubscription = ref
        .read(chromecastListenerProvider)
        .on<CastSessionUnavailable>()
        .listen((event) async {
      var player = ref.read(primaryPlayerProvider);
      var episode = await episodeFuture;
      if (!mounted || episode == null) return;
      playEpisode(
          playerId: player!.playerId,
          autoplay: false,
          episode: episode,
          playbackPositionMs: event.playbackPositionMs);
    });
  }

  Future loadEpisode() async {
    setState(() {
      episodeFuture =
          ref.read(apiProvider).fetchEpisode(widget.episodeId.toString()).then(
        (result) {
          if (mounted && result?.season != null) {
            setState(() {
              seasonsMap = <String, List<EpisodeListEpisodeData>?>{};
              for (var season in result!.season!.$show.seasons.items) {
                seasonsMap![season.id] = null;
              }
              seasonsMap![result.season!.id] =
                  result.season!.episodes.items.map((ep) {
                return EpisodeListEpisodeData(
                    episodeId: ep.id,
                    ageRating: ep.ageRating,
                    duration: ep.duration,
                    title: ep.title,
                    image: ep.imageUrl,
                    seasonNumber: result.season!.number,
                    episodeNumber: ep.number);
              }).toList();
            });
          }
          if (mounted) setState(() => selectedSeasonId = result?.season?.id);
          return result;
        },
      );
    });
  }

  Future onSeasonSelected(String id) async {
    setState(() {
      selectedSeasonId = id;
    });
    var season = await ref.read(apiProvider).getSeasonEpisodes(id);
    if (mounted && season != null) {
      setState(() {
        seasonsMap?[id] = season.episodes.items
            .map((ep) => EpisodeListEpisodeData(
                episodeId: ep.id,
                ageRating: ep.ageRating,
                duration: ep.duration,
                title: ep.title,
                image: ep.imageUrl,
                seasonNumber: season.number,
                episodeNumber: ep.number))
            .toList();
      });
    }
  }

  Future setupPlayer() async {
    var castingNow = ref.read(isCasting);
    var playerProvider =
        castingNow ? castPlayerProvider : primaryPlayerProvider;
    setState(() {
      settingUp = true;
    });
    await () async {
      var player = ref.read(playerProvider);
      if (player!.currentMediaItem?.metadata?.extras?['id'] ==
          widget.episodeId.toString()) {
        return;
      }

      var episode = await episodeFuture;
      if (!mounted || episode == null) return;

      var startPositionSeconds = (episode.progress ?? 0);
      if (startPositionSeconds > episode.duration * 0.9) {
        startPositionSeconds = 0;
      }
      await playEpisode(
          playerId: player.playerId,
          episode: episode,
          autoplay: true,
          playbackPositionMs: startPositionSeconds * 1000);
      await ensurePlayingWithinReasonableTime(playerProvider);
    }();
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

  Future ensurePlayingWithinReasonableTime(
      StateNotifierProvider<PlayerNotifier, Player?> playerProvider) async {
    setStateIfMounted(() {
      setupCompleter = Completer();
    });

    () async {
      while (true) {
        await Future.delayed(const Duration(milliseconds: 100));
        if (!mounted) return;
        if (episodeIsCurrentItem(ref.read(playerProvider)?.currentMediaItem)) {
          setupCompleter?.complete();
          setStateIfMounted(() {
            error = null;
            settingUp = false;
          });
          return;
        }
      }
    }();

    await setupCompleter?.future.timeout(const Duration(milliseconds: 10000),
        onTimeout: () {
      debugPrint("bccm: TIMEOUT ${DateTime.now()}");
      setStateIfMounted(() {
        error = 'Something might have gone wrong (timeout).';
      });
    }).catchError((err) {
      error = 'Something went wrong. Technical details: $err.';
    });
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

  @override
  Widget build(BuildContext context) {
    final casting = ref.watch(isCasting);
    var playerProvider = casting ? castPlayerProvider : primaryPlayerProvider;
    var player = ref.watch(playerProvider);
    final primaryPlayerId = player!.playerId;

    return FutureBuilder<Query$FetchEpisode$episode?>(
        future: episodeFuture,
        builder: (context, snapshot) {
          var displayPlayer =
              animationStatus == AnimationStatus.completed && snapshot.hasData;

          var episode = snapshot.data;

          var tempTitle = ref.watch(tempTitleProvider) ?? '';

          return Scaffold(
              appBar: AppBar(
                leadingWidth: 92,
                leading: const CustomBackButton(),
                title: Text(episode?.season?.$show.title ?? ''),
                actions: const [
                  Padding(
                    padding: EdgeInsets.only(left: 16, right: 16.0),
                    child: SizedBox(width: 24, child: CastButton()),
                  ),
                ],
              ),
              body: Builder(
                builder: (context) {
                  if (error != null) return Text(error ?? '');
                  if (snapshot.hasError) return Text(snapshot.error.toString());
                  if (snapshot.connectionState != ConnectionState.done)
                    return _loading();
                  if (snapshot.data == null) {
                    return Text(S.of(context).errorTryAgain);
                  }

                  return _episode(player, displayPlayer, casting,
                      primaryPlayerId, episode!, tempTitle, context);
                },
              ));
        });
  }

  Widget _loading() {
    return Column(
      children: [
        AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(color: BtvColors.background2)),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
                width: 32,
                height: 32,
                child: CircularProgressIndicator(strokeWidth: 2)),
            const SizedBox(height: 12),
            Text(S.of(context).loading, style: BtvTextStyles.body2)
          ],
        ))
      ],
    );
  }

  Widget _episode(
      Player player,
      bool displayPlayer,
      bool casting,
      String primaryPlayerId,
      Query$FetchEpisode$episode episode,
      String tempTitle,
      BuildContext context) {
    final showEpisodeNumber =
        episode.season?.$show.type == Enum$ShowType.series;
    final episodeNumberFormatted =
        'S${episode.season?.number}:E${episode.number}';

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          !episodeIsCurrentItem(player.currentMediaItem)
              ? _playPoster(episode)
              : _player(displayPlayer, casting, primaryPlayerId),
          Container(
            color: BtvColors.background2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(episode.title, style: BtvTextStyles.title2),
                      const SizedBox(height: 4),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 3, right: 4),
                              child: FeatureBadge(
                                  label:
                                      getFormattedAgeRating(episode.ageRating),
                                  color: BtvColors.background2),
                            ),
                            Center(
                              child: Text(
                                  episode.season?.$show.title ??
                                      S.of(context).shortFilms,
                                  style: BtvTextStyles.caption1
                                      .copyWith(color: BtvColors.tint1)),
                            ),
                            if (showEpisodeNumber)
                              Padding(
                                  padding: const EdgeInsets.only(left: 4),
                                  child: Text(episodeNumberFormatted,
                                      style: BtvTextStyles.caption1
                                          .copyWith(color: BtvColors.label4)))
                          ]),
                      const SizedBox(height: 14.5),
                      Text(episode.description,
                          style: BtvTextStyles.body2
                              .copyWith(color: BtvColors.label3))
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
              decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        width: 1, color: BtvColors.seperatorOnLight)),
              ),
              child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    children: [
                      TabButton(S.of(context).episodes.toUpperCase(),
                          selected: true),
                      const SizedBox(width: 8),
                      TabButton('Extras'.toUpperCase(), selected: false),
                      const SizedBox(width: 8),
                      TabButton('Settings'.toUpperCase(), selected: false)
                    ],
                  ))),
          episode.season == null && selectedSeasonId != null
              ? const SizedBox.shrink()
              : Padding(
                  padding: const EdgeInsets.only(left: 28, top: 16, bottom: 20),
                  child: _DropDownSelect(
                      title: 'Select season',
                      onSelectionChanged: onSeasonSelected,
                      items: episode.season!.$show.seasons.items
                          .map((e) => Option(id: e.id, title: e.title))
                          .toList(),
                      selectedId: selectedSeasonId!),
                ),
          Builder(builder: (context) {
            if (seasonsMap?[selectedSeasonId] == null) {
              return const SizedBox(
                  height: 1000,
                  child: Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                          padding: EdgeInsets.only(top: 16),
                          child: CircularProgressIndicator())));
            } else {
              return SeasonEpisodeList(
                  items: seasonsMap![selectedSeasonId]!
                      .map((e) => e.episodeId == widget.episodeId
                          ? e.copyWith(highlighted: true)
                          : e)
                      .toList());
            }
          })
        ],
      ),
    );
  }
/* 
  Widget seasonList(List<Fragment$SeasonListEpisode> episodes) {
    /* return ListView.builder(itemCount: episodes.length, itemBuilder: (context, index) {
    }); */
    return EpisodeList(title: null, items: episodes);
  } */

  AspectRatio _playPoster(Query$FetchEpisode$episode episode) {
    return AspectRatio(
        aspectRatio: 16 / 9,
        child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            //excludeFromSemantics: true,
            onTap: () {
              setState(() {
                settingUp = true;
              });
              Future.delayed(const Duration(milliseconds: 200), () {
                setupPlayer();
              });
            },
            child: Stack(
              children: [
                AspectRatio(
                    aspectRatio: 16 / 9,
                    child: episode.imageUrl == null
                        ? null
                        : LayoutBuilder(builder: (context, constraints) {
                            return Opacity(
                              opacity: 0.5,
                              child: FadeInImage.memoryNetwork(
                                  fit: BoxFit.cover,
                                  placeholder: kTransparentImage,
                                  image: episode.imageUrl!,
                                  fadeInDuration:
                                      const Duration(milliseconds: 150),
                                  imageCacheHeight: (constraints.maxHeight *
                                          MediaQuery.of(context)
                                              .devicePixelRatio)
                                      .round()),
                            );
                          })),
                Center(
                    child: !settingUp
                        ? Image.asset('assets/icons/Play.png')
                        : const CircularProgressIndicator()),
              ],
            )));
  }
}

class _DropDownSelect extends StatelessWidget {
  final String selectedId;
  final String title;
  final List<Option> items;
  final void Function(String id) onSelectionChanged;

  const _DropDownSelect(
      {Key? key,
      required this.items,
      required this.selectedId,
      required this.onSelectionChanged,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
          Text(
            items
                .firstWhere((element) => element.id == selectedId)
                .title
                .toUpperCase(),
            style: BtvTextStyles.button2.copyWith(color: BtvColors.label1),
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
    return BccmPlayer(
        key: const Key('test'), id: casting ? 'chromecast' : primaryPlayerId);
  } else {
    return const AspectRatio(
        aspectRatio: 16 / 9,
        child: Center(
            child: SizedBox(
                width: 40, height: 40, child: CircularProgressIndicator())));
  }
}
