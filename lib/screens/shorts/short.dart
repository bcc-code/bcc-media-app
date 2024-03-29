import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/components/nav/custom_back_button.dart';
import 'package:brunstadtv_app/components/shorts/short_view.dart';
import 'package:bccm_core/platform.dart';
import 'package:brunstadtv_app/helpers/constants.dart';
import 'package:bccm_core/bccm_core.dart';
import 'package:brunstadtv_app/helpers/shorts/short_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

@RoutePage<void>()
class ShortScreen extends HookConsumerWidget {
  const ShortScreen({
    super.key,
    @PathParam() required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gqlClient = ref.watch(bccmGraphQLProvider);
    final muted = useState(false);
    final isMounted = useIsMounted();
    query() => gqlClient.query$getShort(Options$Query$getShort(variables: Variables$Query$getShort(id: id)));
    final shortFuture = useState(useMemoized(query, []));
    final shortSnapshot = useFuture(shortFuture.value);
    final shortController = useMemoized(() => ShortController(ref)..isCurrent = true);
    final router = context.watchRouter;
    final pageIsActive = useState(true);

    useOnAppLifecycleStateChange((previous, current) {
      if (current == AppLifecycleState.inactive) {
        debugPrint('SHRT: app inactive: pausing controllers');
        shortController.player.pause();
        WakelockPlus.disable();
      } else {
        WakelockPlus.enable();
      }
    });

    useEffect(() {
      void listener() {
        final previousValue = pageIsActive.value;
        final newValue = router.currentSegments.any((r) => r.name == context.routeData.name);
        if (previousValue && !newValue) {
          debugPrint('SHRT: page no longer active, pausing controllers');
          shortController.player.pause();
          WakelockPlus.disable();
        } else if (!previousValue && newValue) {
          debugPrint('SHRT: page became active');
          WakelockPlus.enable();
        }
        pageIsActive.value = newValue;
      }

      router.addListener(listener);
      return () => router.removeListener(listener);
    });

    final isTabActive = useIsTabActive(
      onChange: (active) {
        if (!shortController.player.value.isInitialized) return;
        if (active) {
          shortController.player.play();
          return;
        }
        debugPrint('SHRT: tab no longer active: pausing controller');
        shortController.player.pause();
      },
    );

    setupShort(Fragment$Short short) async {
      gqlClient
          .mutate$setShortProgress(
            Options$Mutation$setShortProgress(
              variables: Variables$Mutation$setShortProgress(
                id: short.id,
                progress: 0,
              ),
            ),
          )
          .then((_) => debugPrint('SHRT: short set progress to 0'));

      await shortController.setupShort(short, forceReload: true);
      if (!isMounted()) return;

      if ((shortController.player.value.playbackPositionMs ?? 0) > 0) {
        await shortController.player.seekTo(Duration.zero);
      }
      if (!isMounted() || !isTabActive() || !pageIsActive.value) return;
      await shortController.player.play();
      debugPrint('SHRT: short started playing in ${shortController.player.value.playerId}');
    }

    init() async {
      final short = (await shortFuture.value).parsedData?.short;
      if (!isMounted()) return;
      if (short != null) {
        await setupShort(short);
      }
    }

    dispose() {
      shortController.dispose();
    }

    useEffect(() {
      init();
      return dispose;
    }, []);

    useValueChanged(id, (_, void __) {
      shortFuture.value = query();
    });

    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          HookBuilder(builder: (context) {
            final currentlyPlayingShort = useListenableSelector(
              shortController.player,
              () => shortController.player.value.currentMediaItem?.metadata?.extras?[MetadataExtraConstants.shortId],
            );
            var short = shortSnapshot.data?.parsedData?.short;
            final wrongShortInController = currentlyPlayingShort == null || currentlyPlayingShort != short?.id;

            return ShortView(
              future: short == null ? shortFuture.value : null,
              short: wrongShortInController ? null : short,
              videoController: shortController.player,
              muted: muted.value,
              onReloadRequested: () async {
                shortFuture.value = query();
                final short = (await shortFuture.value).parsedData?.short;
                if (short != null) {
                  await setupShort(short);
                }
              },
              onMuteRequested: (value) {
                muted.value = value;
                shortController.player.setVolume(muted.value ? 0 : 1);
              },
            );
          }),
          const Align(
            alignment: Alignment.topLeft,
            child: SafeArea(
              child: SizedBox(
                height: 40,
                child: CustomBackButton(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
