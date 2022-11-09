import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:bccm_player/bccm_player.dart';
import 'package:bccm_player/cast_button.dart';
import 'package:bccm_player/playback_platform_pigeon.g.dart';
import 'package:brunstadtv_app/components/live_mini_player.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:brunstadtv_app/api/livestream.dart';
import 'package:brunstadtv_app/providers/playback_api.dart';
import 'package:brunstadtv_app/providers/video_state.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:transparent_image/transparent_image.dart';
import '../components/custom_back_button.dart';
import '../helpers/btv_colors.dart';
import '../helpers/btv_typography.dart';
import '../l10n/app_localizations.dart';
import '../providers/chromecast.dart';
import '../services/auth_service.dart';
import 'calendar/calendar.dart';

final liveMetadataProvider = Provider<MediaMetadata>((ref) {
  return MediaMetadata(
      artist: 'BrunstadTV',
      title: 'Live',
      extras: {'id': 'livestream'},
      artworkUri: 'https://static.bcc.media/images/live-placeholder.png');
});

class LiveScreen extends ConsumerStatefulWidget {
  const LiveScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LiveScreen> createState() => _LiveScreenState();
}

class _LiveScreenState extends ConsumerState<LiveScreen> with AutoRouteAware {
  String name = AuthService.instance.user!.name!;
  final TextEditingController _idTokenDisplayController =
      TextEditingController(text: AuthService.instance.idToken);
  Future? playerFuture;
  LivestreamUrl? liveUrl;
  bool audioOnly = false;
  bool settingUp = false;
  String? error;
  Timer? refreshTimer;
  Completer? setupCompleter;

  @override
  void initState() {
    super.initState();
    print('initState');
    final tabsRouter = context.tabsRouter;
    tabsRouter.addListener(() {
      if (tabsRouter.activeIndex == 2) {}
    });
  }

  @override
  void dispose() {
    refreshTimer?.cancel();
    super.dispose();
  }

  Future setup() async {
    // TODO: move to some playbackservice
    setState(() {
      error = null;
      settingUp = true;
    });
    await () async {
      var castingNow = ref.read(isCasting);
      var player = castingNow
          ? ref.read(castPlayerProvider)
          : ref.read(primaryPlayerProvider);

      if (player == null) {
        throw ErrorDescription('player cant be null');
      }

      var playbackApi = ref.read(playbackApiProvider);
      var liveUrl = await fetchLiveUrl();

      if (!mounted) return;

      setState(() {
        this.liveUrl = liveUrl;
      });

      await playbackApi.replaceCurrentMediaItem(
          player.playerId,
          autoplay: true,
          MediaItem(
              url: liveUrl.streamUrl,
              mimeType: 'application/x-mpegURL',
              isLive: true,
              metadata: ref.read(liveMetadataProvider)));

      if (!mounted) return;

      ensurePlayingWithinReasonableTime(
          castingNow ? castPlayerProvider : primaryPlayerProvider);

      scheduleRefreshBasedOn(liveUrl.expiryTime);
    }();
  }

  void scheduleRefreshBasedOn(DateTime expiryTime) {
    final durationUntilExpiry = expiryTime.difference(DateTime.now());
    // Example: if expiry is in 180minutes, we refresh after 162 minutes
    final durationUntilRefresh =
        durationUntilExpiry - (durationUntilExpiry * 0.1);
    refreshTimer = Timer(durationUntilRefresh, () => setup());
  }

  void setStateIfMounted(void Function() fn) {
    if (!mounted) {
      return;
    }
    setState(fn);
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
        debugPrint('bccm: setupCompleter watch loop ${DateTime.now()}');
        if (isCorrectItem(ref.read(playerProvider)?.currentMediaItem)) {
          debugPrint('bccm: isCorrectItem ${DateTime.now()} !!!!!!!!!!!!!!!!!');
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

  bool isCorrectItem(MediaItem? mediaItem) {
    return mediaItem?.metadata?.extras?['id'] == 'livestream';
  }

  @override
  Widget build(BuildContext context) {
    final casting = ref.watch(isCasting);
    var playerProvider = casting ? castPlayerProvider : primaryPlayerProvider;
    var player = ref.watch(playerProvider);

    if (player == null) return const SizedBox.shrink();
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 92,
        title: Text(S.of(context).liveHeader),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 2),
            child: Switch(
              inactiveTrackColor: BtvColors.tint2,
              inactiveThumbColor: BtvColors.label1,
              inactiveThumbImage:
                  const Svg('assets/icons/headphones.svg', size: Size(12, 12)),
              activeColor: BtvColors.label1,
              activeTrackColor: BtvColors.tint1,
              activeThumbImage:
                  const Svg('assets/icons/play_alt.svg', size: Size(9, 9)),
              value: !audioOnly,
              onChanged: (value) {
                setState(() {
                  audioOnly = !value;
                });
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: SizedBox(width: 24, child: CastButton()),
          ),
        ],
      ),
      body: SingleChildScrollView(
        primary: true,
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        child: Column(children: [
          if (audioOnly)
            LiveMiniPlayer(onStartRequest: () {
              setup();
            })
          else if (player.currentMediaItem?.metadata?.extras?['id'] !=
              'livestream')
            _playPoster(player)
          else
            _player(player),
          _info()
          //
        ]),
      ),
    );
  }

  Widget _info() {
    const episodeInfo = null;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (episodeInfo != null)
          Container(
            color: BtvColors.background2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Episode title', style: BtvTextStyles.title2),
                    ],
                  ),
                )
              ],
            ),
          ),
        const CalendarWidget(collapsed: true)
      ],
    );
  }

  Widget _player(Player player) {
    return BccmPlayer(id: player.playerId);
  }

  Widget _playPoster(Player player) {
    return Stack(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          //excludeFromSemantics: true,
          onTap: () {
            setState(() {
              setup();
            });
          },
          child: Column(
            children: [
              AspectRatio(
                  aspectRatio: 16 / 9,
                  child: LayoutBuilder(builder: (context, constraints) {
                    return Opacity(
                      opacity: 0.5,
                      child: FadeInImage.memoryNetwork(
                          fit: BoxFit.cover,
                          placeholder: kTransparentImage,
                          image: ref.watch(liveMetadataProvider).artworkUri ??
                              'https://static.bcc.media/images/placeholder.jpg',
                          fadeInDuration: const Duration(milliseconds: 150),
                          imageCacheHeight: (constraints.maxHeight *
                                  MediaQuery.of(context).devicePixelRatio)
                              .round()),
                    );
                  }))
            ],
          ),
        ),
        AspectRatio(
          aspectRatio: 16 / 9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (error != null && !isCorrectItem(player.currentMediaItem))
                Text(error ?? ''),
              Center(
                  child: !settingUp
                      ? Image.asset(
                          'assets/icons/Play.png',
                          gaplessPlayback: true,
                        )
                      : const CircularProgressIndicator())
            ],
          ),
        ),
      ],
    );
  }
}
