import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:bccm_player/bccm_player.dart';
import 'package:bccm_player/cast_button.dart';
import 'package:bccm_player/playback_platform_interface.dart';
import 'package:bccm_player/plugins/riverpod.dart';
import 'package:brunstadtv_app/api/brunstadtv.dart';
import 'package:brunstadtv_app/components/live_mini_player.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart' show SvgPicture;
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:brunstadtv_app/helpers/transparent_image.dart';
import '../theme/bccm_colors.dart';
import '../theme/bccm_typography.dart';
import '../helpers/svg_icons.dart';
import '../l10n/app_localizations.dart';
import '../models/analytics/audio_only_clicked.dart';
import '../providers/analytics.dart';
import 'calendar/calendar.dart';

final liveMetadataProvider = Provider<MediaMetadata>((ref) {
  return MediaMetadata(
      artist: 'BrunstadTV', title: 'Live', extras: {'id': 'livestream'}, artworkUri: 'https://static.bcc.media/images/live-placeholder.jpg');
});

class LiveScreen extends ConsumerStatefulWidget {
  const LiveScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LiveScreen> createState() => _LiveScreenState();
}

class _LiveScreenState extends ConsumerState<LiveScreen> with AutoRouteAware {
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
      var player = castingNow ? ref.read(castPlayerProvider) : ref.read(primaryPlayerProvider);

      if (player == null) {
        throw ErrorDescription('player cant be null');
      }

      var liveUrl = await ref.read(apiProvider).fetchLiveUrl();

      if (!mounted) return;

      setState(() {
        this.liveUrl = liveUrl;
      });

      await PlaybackPlatformInterface.instance.replaceCurrentMediaItem(
          player.playerId,
          autoplay: true,
          MediaItem(url: liveUrl.streamUrl, mimeType: 'application/x-mpegURL', isLive: true, metadata: ref.read(liveMetadataProvider)));

      if (!mounted) return;

      ensurePlayingWithinReasonableTime(castingNow ? castPlayerProvider : primaryPlayerProvider);

      scheduleRefreshBasedOn(liveUrl.expiryTime);
    }();
  }

  void scheduleRefreshBasedOn(DateTime expiryTime) {
    final durationUntilExpiry = expiryTime.difference(DateTime.now());
    // Example: if expiry is in 180minutes, we refresh after 162 minutes
    final durationUntilRefresh = durationUntilExpiry - (durationUntilExpiry * 0.1);
    refreshTimer = Timer(durationUntilRefresh, () => setup());
  }

  void setStateIfMounted(void Function() fn) {
    if (!mounted) {
      return;
    }
    setState(fn);
  }

  Future ensurePlayingWithinReasonableTime(StateNotifierProvider<PlayerStateNotifier, PlayerState?> playerProvider) async {
    setStateIfMounted(() {
      setupCompleter = Completer();
    });

    () async {
      while (true) {
        await Future.delayed(const Duration(milliseconds: 100));
        if (!mounted) return;
        debugPrint('bccm: setupCompleter watch loop ${DateTime.now()}');
        if (isCorrectItem(ref.read(playerProvider)?.currentMediaItem)) {
          debugPrint('bccm: isCorrectItem ${DateTime.now()}');
          setupCompleter?.complete();
          setStateIfMounted(() {
            error = null;
            settingUp = false;
          });
          return;
        }
      }
    }();

    await setupCompleter?.future.timeout(const Duration(milliseconds: 10000), onTimeout: () {
      setStateIfMounted(() {
        error = 'Something might have gone wrong (timeout).';
      });
      FirebaseCrashlytics.instance.recordError(Exception('Player load timeout ${DateTime.now()}'), StackTrace.current);
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
          const Padding(
            padding: EdgeInsets.only(right: 2.0),
            child: SizedBox(width: 24, child: CastButton()),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Switch(
              inactiveTrackColor: BccmColors.tint2,
              inactiveThumbColor: BccmColors.label1,
              inactiveThumbImage: const Svg('assets/icons/headphones.svg', size: Size(12, 12)),
              activeColor: BccmColors.label1,
              activeTrackColor: BccmColors.tint1,
              activeThumbImage: const Svg('assets/icons/play_alt.svg', size: Size(9, 9)),
              value: !audioOnly,
              onChanged: (value) {
                setState(() {
                  audioOnly = !value;
                });
                ref.read(analyticsProvider).audioOnlyClicked(AudioOnlyClickedEvent(audioOnly: !value));
              },
            ),
          ),
        ],
      ),
      body: SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          primary: true,
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(children: [
            if (audioOnly)
              LiveMiniPlayer(onStartRequest: () {
                setup();
              })
            else if (player.currentMediaItem?.metadata?.extras?['id'] != 'livestream')
              _playPoster(player)
            else
              _player(player),
            _info()
            //
          ]),
        ),
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
            color: BccmColors.background2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Episode title', style: BccmTextStyles.title2),
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

  Widget _player(PlayerState player) {
    return BccmPlayer(id: player.playerId);
  }

  Widget _playPoster(PlayerState player) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      //excludeFromSemantics: true,
      onTap: () {
        setState(() {
          setup();
        });
      },
      child: Stack(
        children: [
          Column(
            children: [
              AspectRatio(
                  aspectRatio: 16 / 9,
                  child: LayoutBuilder(builder: (context, constraints) {
                    return Opacity(
                      opacity: 0.5,
                      child: FadeInImage.memoryNetwork(
                          fit: BoxFit.cover,
                          placeholder: kTransparentImage,
                          image: 'https://static.bcc.media/images/live-placeholder-without-play.jpg',
                          fadeInDuration: const Duration(milliseconds: 150),
                          imageCacheHeight: (constraints.maxHeight * MediaQuery.of(context).devicePixelRatio).round()),
                    );
                  }))
            ],
          ),
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (error != null && !isCorrectItem(player.currentMediaItem)) Text(error ?? ''),
                Center(
                    child: !settingUp ? SizedBox(width: 36, height: 36, child: SvgPicture.string(SvgIcons.play)) : const CircularProgressIndicator())
              ],
            ),
          ),
        ],
      ),
    );
  }
}
