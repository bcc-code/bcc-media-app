import 'package:auto_route/auto_route.dart';
import 'package:bccm_player/bccm_player.dart';
import 'package:brunstadtv_app/api/brunstadtv.dart';
import 'package:brunstadtv_app/components/badges/offline_badge.dart';
import 'package:brunstadtv_app/components/status/loading_indicator.dart';
import 'package:brunstadtv_app/flavors.dart';
import 'package:brunstadtv_app/helpers/images.dart';
import 'package:brunstadtv_app/helpers/transparent_image.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';
import 'package:brunstadtv_app/providers/analytics.dart';
import 'package:bccm_core/bccm_core.dart';
import 'package:brunstadtv_app/providers/auth.dart';
import 'package:brunstadtv_app/providers/connectivity.dart';
import 'package:brunstadtv_app/screens/tabs/live.dart';
import 'package:bccm_core/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage<void>()
class TvLiveScreen extends HookConsumerWidget {
  const TvLiveScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final design = DesignSystem.of(context);
    final api = ref.watch(apiProvider);
    final liveUrlFuture = useState<Future<LivestreamUrl>?>(null);
    final liveUrlSnapshot = useFuture(liveUrlFuture.value);
    final auth = ref.watch(authStateProvider);

    debugPrint(auth.toString());
    final viewController = useMemoized(
        () => BccmPlayerViewController(
              playerController: BccmPlayerController.primary,
              config: BccmPlayerViewConfig(
                controlsConfig: BccmPlayerControlsConfig(
                  customBuilder: TvControls.builder,
                ),
              ),
            ),
        []);
    useEffect(() => () => viewController.dispose(), []);

    void openLive() async {
      liveUrlFuture.value = api.fetchLiveUrl();
      final value = await liveUrlFuture.value!;
      if (!context.mounted) return;
      await BccmPlayerController.primary.replaceCurrentMediaItem(
        MediaItem(
          url: value.streamUrl,
          isLive: true,
          metadata: ref.read(liveMetadataProvider),
        ),
      );
      if (!context.mounted) return;
      tryCatchRecordError(() {
        ref.read(analyticsProvider).screen('tv-live-fullscreen');
      });
      await viewController.enterFullscreen(context: context);
      BccmPlayerController.primary.stop(reset: true);
    }

    final focusHighlight = useState(true);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 48),
              child: Image(
                image: FlavorConfig.current.bccmImages!.logo,
                height: FlavorConfig.current.bccmImages!.logoHeight,
                gaplessPlayback: true,
              ),
            ),
            FractionallySizedBox(
              widthFactor: 2 / 4,
              child: GestureDetector(
                onTap: openLive,
                child: FocusableActionDetector(
                  autofocus: true,
                  actions: {
                    ActivateIntent: CallbackAction<Intent>(
                      onInvoke: (Intent intent) => openLive(),
                    ),
                  },
                  onFocusChange: (value) => focusHighlight.value = value,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeOutExpo,
                    opacity: liveUrlSnapshot.connectionState == ConnectionState.waiting
                        ? 0.5
                        : focusHighlight.value
                            ? 1
                            : 0.7,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (ref.watch(isOfflineProvider))
                          const OfflineBadge()
                        else
                          Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.5),
                                      blurRadius: 12,
                                      offset: focusHighlight.value ? const Offset(0, 6) : const Offset(0, 4),
                                    )
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Stack(
                                    children: [
                                      Positioned.fill(
                                        child: Container(
                                          color: design.colors.background2,
                                        ),
                                      ),
                                      Container(
                                        foregroundDecoration: !focusHighlight.value
                                            ? null
                                            : BoxDecoration(
                                                border: Border.all(
                                                  width: 2,
                                                  color: design.colors.onTint.withOpacity(1),
                                                ),
                                                borderRadius: BorderRadius.circular(12),
                                              ),
                                        child: FadeInImage(
                                          placeholder: MemoryImage(kTransparentImage),
                                          fadeInDuration: const Duration(milliseconds: 500),
                                          fadeInCurve: Curves.easeOut,
                                          image: networkImageWithRetryAndResize(
                                            imageUrl: 'https://static.bcc.media/images/live-placeholder-with-text.jpg',
                                          ),
                                          imageErrorBuilder: (context, error, stackTrace) => imageErrorBuilder(
                                            context,
                                            error,
                                            stackTrace,
                                            child: AspectRatio(
                                              aspectRatio: 16 / 9,
                                              child: Container(
                                                color: design.colors.background2,
                                                child: Center(
                                                  child: Text(
                                                    S.of(context).live,
                                                    style: design.textStyles.title1.copyWith(color: design.colors.label2),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              if (liveUrlSnapshot.connectionState == ConnectionState.waiting)
                                const Positioned.fill(
                                  child: Center(child: LoadingIndicator()),
                                ),
                            ],
                          ),
                        /* Padding(
                          padding: EdgeInsets.only(top: 8),
                          child: Text(
                            'Se BCC Media Direkte',
                            style: design.textStyles.button2.copyWith(color: design.colors.label2),
                          ),
                        ), */
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 32),
              child: design.buttons.small(
                variant: ButtonVariant.secondary,
                onPressed: () {
                  ref.read(authStateProvider.notifier).logout();
                },
                labelText: S.of(context).logOutButton,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
