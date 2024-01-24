import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:bccm_core/bccm_core.dart';
import 'package:bccm_core/platform.dart';
import 'package:bccm_player/bccm_player.dart';
import 'package:bccm_player/plugins/riverpod.dart';
import 'package:brunstadtv_app/api/brunstadtv.dart';
import 'package:brunstadtv_app/components/player/live_mini_player.dart';
import 'package:brunstadtv_app/components/thumbnails/misc/bordered_image_container.dart';
import 'package:brunstadtv_app/providers/feature_flags.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart' show SvgPicture;
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:universal_io/io.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../components/player/custom_cast_player.dart';
import '../../helpers/insets.dart';
import '../../providers/todays_calendar_entries.dart';
import 'package:bccm_core/design_system.dart';

import '../../helpers/svg_icons.dart';
import '../../l10n/app_localizations.dart';
import 'calendar.dart';

final liveMetadataProvider = Provider<MediaMetadata>((ref) {
  final currentEpisode = ref.watch(currentLiveEpisodeProvider)?.episode;
  return MediaMetadata(
    artist: 'BrunstadTV',
    title: 'Live',
    extras: {
      'id': 'livestream',
      if (currentEpisode != null) ...{
        'npaw.content.id': currentEpisode.id,
        'npaw.content.tvShow': currentEpisode.season?.$show.id,
        'npaw.content.season': currentEpisode.season?.title,
        'npaw.content.episodeTitle': currentEpisode.title
      },
    },
    artworkUri: 'https://static.bcc.media/images/live-placeholder.jpg',
  );
});

@RoutePage<void>()
class LiveScreen extends ConsumerStatefulWidget {
  const LiveScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LiveScreen> createState() => _LiveScreenState();
}

class _LiveScreenState extends ConsumerState<LiveScreen> with AutoRouteAwareStateMixin {
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
      var player = ref.read(primaryPlayerProvider);

      if (player == null) {
        throw ErrorDescription('player cant be null');
      }

      var liveUrl = await ref.read(apiProvider).fetchLiveUrl();

      if (!mounted) return;

      setState(() {
        this.liveUrl = liveUrl;
      });

      await BccmPlayerInterface.instance.replaceCurrentMediaItem(
          player.playerId,
          autoplay: true,
          MediaItem(url: liveUrl.streamUrl, mimeType: 'application/x-mpegURL', isLive: true, metadata: ref.read(liveMetadataProvider)));

      if (!mounted) return;

      ensurePlayingWithinReasonableTime();

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

  Future ensurePlayingWithinReasonableTime() async {
    setStateIfMounted(() {
      setupCompleter = Completer();
    });

    () async {
      while (true) {
        await Future.delayed(const Duration(milliseconds: 100));
        if (!mounted) return;
        debugPrint('bccm: setupCompleter watch loop ${DateTime.now()}');
        if (isCorrectItem(ref.read(primaryPlayerProvider)?.currentMediaItem)) {
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
    var player = ref.watch(primaryPlayerProvider);
    final forceBccLive = ref.watch(featureFlagsProvider.select((value) => value.forceBccLive));

    if (forceBccLive) {
      return const _ForceBccLive();
    }

    if (player == null) return const SizedBox.shrink();
    return Scaffold(
      appBar: ScreenInsetAppBar(
        appBar: AppBar(
          leadingWidth: 92,
          title: Text(S.of(context).liveHeader),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 2.0),
              child: SizedBox(
                width: 24,
                child: CastButton(color: DesignSystem.of(context).colors.tint1),
              ),
            ),
            if (!kIsWeb)
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Theme(
                  data: Theme.of(context).copyWith(
                    useMaterial3: false,
                  ),
                  child: Switch(
                    inactiveTrackColor: DesignSystem.of(context).colors.tint2,
                    inactiveThumbColor: DesignSystem.of(context).colors.label1,
                    inactiveThumbImage: const Svg('assets/icons/headphones.svg', size: Size(12, 12)),
                    activeColor: DesignSystem.of(context).colors.label1,
                    activeTrackColor: DesignSystem.of(context).colors.tint1,
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
              ),
          ],
        ),
      ),
      body: SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          primary: true,
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: screenInsets(context),
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
      ),
    );
  }

  Widget _info() {
    const episodeInfo = null;
    final design = DesignSystem.of(context);
    final linkToBccLive = ref.watch(featureFlagsProvider.select((value) => value.linkToBccLive));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (episodeInfo != null)
          Container(
            color: DesignSystem.of(context).colors.background2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Episode title', style: DesignSystem.of(context).textStyles.title2),
                    ],
                  ),
                )
              ],
            ),
          ),
        if (linkToBccLive) ...[
          Container(
            decoration: BoxDecoration(
              color: design.colors.background2,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Live',
                    style: design.textStyles.title1.copyWith(color: design.colors.label1),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    S.of(context).bccLiveLinkDescription2,
                    style: design.textStyles.body2.copyWith(color: design.colors.label1),
                    textAlign: TextAlign.left,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: design.buttons.small(
                        variant: ButtonVariant.primary,
                        onPressed: () {
                          openAppOrStore(packageName: kLivePackageName, iosStoreId: kLiveIosId);
                        },
                        labelText: S.of(context).open,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ] else
          const CalendarWidget(collapsed: true)
      ],
    );
  }

  Widget _player(PlayerState player) {
    return BccmPlayerView(
      BccmPlayerController.primary,
      config: BccmPlayerViewConfig(
        castPlayerBuilder: (context) => const CustomCastPlayerView(),
        deviceOrientationsFullscreen: (_) => [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight],
        deviceOrientationsNormal: (_) => [DeviceOrientation.portraitUp],
        resetSystemOverlays: () {
          SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
        },
      ),
    );
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
                      child: FadeInImage(
                        fit: BoxFit.cover,
                        placeholder: MemoryImage(kTransparentImage),
                        image: networkImageWithRetryAndResize(
                          imageUrl: 'https://static.bcc.media/images/live-placeholder-without-play.jpg',
                          cacheHeight: (constraints.maxHeight * MediaQuery.of(context).devicePixelRatio).round(),
                        ),
                        imageErrorBuilder: imageErrorBuilder,
                        fadeInDuration: const Duration(milliseconds: 150),
                      ),
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

class _ForceBccLive extends HookConsumerWidget {
  const _ForceBccLive();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final design = DesignSystem.of(context);

    void onPressed() {
      openAppOrStore(packageName: kLivePackageName, iosStoreId: kLiveIosId);
    }

    final animControllers = useState<List<AnimationController>>([]);

    final isActive = useIsTabActive(onChange: (isActive) {
      if (isActive) {
        for (final element in animControllers.value) {
          element.forward(from: 0);
        }
      }
    });

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: DesignSystem.of(context).colors.background1,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: onPressed,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 48),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: AspectRatio(
                        aspectRatio: 16 / 8,
                        child: simpleFadeInImage(url: 'https://static.bcc.media/images/bcc-connect-live-banner.jpg'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Text(
                      S.of(context).bccLiveForcedDescription2,
                      textAlign: TextAlign.center,
                      style: design.textStyles.body1.copyWith(color: design.colors.label2),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(top: 8.0),
                      child: DesignSystem.of(context).buttons.large(
                            variant: ButtonVariant.primary,
                            onPressed: () {
                              onPressed();
                            },
                            labelText: S.of(context).open,
                          ),
                    ),
                  ),
                ]
                    .animate(autoPlay: false, onInit: (c) => animControllers.value.add(c), interval: 200.ms)
                    .slideY(duration: 5000.ms, curve: Curves.easeOutExpo, begin: -0.2)
                    .fade(duration: 3000.ms, curve: Curves.easeOutExpo),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
