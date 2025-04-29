import 'package:auto_route/auto_route.dart';
import 'package:bccm_core/bccm_core.dart';
import 'package:bccm_core/design_system.dart';
import 'package:bccm_player/bccm_player.dart';
import 'package:brunstadtv_app/api/bmm.dart';
import 'package:brunstadtv_app/app_bar_with_scroll_to_top.dart';
import 'package:brunstadtv_app/components/status/loading_indicator.dart';
import 'package:brunstadtv_app/flavors.dart';
import 'package:brunstadtv_app/helpers/app_theme.dart';
import 'package:brunstadtv_app/providers/tabs.dart';
import 'package:brunstadtv_app/screens/audio/audio.dart';
import 'package:brunstadtv_app/screens/tabs/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class AudioPlaylistScreen extends HookConsumerWidget {
  const AudioPlaylistScreen({
    super.key,
    @PathParam() required this.playlistId,
  });

  final int playlistId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final design = DesignSystem.of(context);
    final scrollController = ref.watch(tabInfosProvider.select((tabInfos) => tabInfos.audio.scrollController));

    final bmmApi = ref.read(bmmApiProvider);
    final playlist = useFuture(bmmApi.getPlaylistApi().playlistIdGet(id: playlistId));

    if (!playlist.hasData) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final playlistData = playlist.data!;
    final playlistCover = bmmApi.protectedUrl(playlistData.data?.cover);
    final tracksResult = useMemoized(() => bmmApi.getPlaylistApi().playlistIdTrackGet(id: playlistId), [playlistId]);
    final tracks = useFuture(tracksResult);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBarWithScrollToTop(
        scrollController: scrollController,
        child: AppBar(
          toolbarHeight: 44,
          shadowColor: Colors.black,
          backgroundColor: AppTheme.of(context).appBarTransparent ? Colors.transparent : design.colors.background1,
          elevation: 0,
          centerTitle: true,
          title: Image(
            image: FlavorConfig.current.bccmImages!.logo,
            height: FlavorConfig.current.bccmImages!.logoHeight,
            gaplessPlayback: true,
          ),
          leadingWidth: 100,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: ConstrainedBox(
                constraints: BoxConstraints.loose(const Size(24, 24)),
                child: CastButton(color: DesignSystem.of(context).colors.tint1),
              ),
            ),
          ],
          flexibleSpace: AppTheme.of(context).appBarTransparent ? const BlurredAppBarBackground() : null,
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.only(top: 16, bottom: 32),
                decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: design.colors.separatorOnLight))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 16,
                  children: [
                    SizedBox(
                      width: 150,
                      height: 150,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: playlistCover != null
                            ? simpleFadeInImage(url: playlistCover)
                            : Container(
                                color: design.colors.background2,
                                constraints: BoxConstraints.expand(),
                              ),
                      ),
                    ),
                    Text(
                      playlistData.data?.title ?? '',
                      style: design.textStyles.headline2,
                      textAlign: TextAlign.center,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 12,
                      children: [
                        design.buttons.responsive(
                          labelText: 'Download',
                          variant: ButtonVariant.secondary,
                          onPressed: () async {
                            final tracksData = tracks.data?.data;
                            if (tracksData != null) {
                              setTracksAsNextUp(BccmPlayerController.primary, bmmApi, tracksData, extras: {
                                'playlist.id': playlistId.toString(),
                              });
                              BccmPlayerController.primary.queue.skipToNext();
                            }
                          },
                        ),
                        design.buttons.responsive(
                          labelText: 'Shuffle',
                          variant: ButtonVariant.primary,
                          onPressed: () async {
                            final tracksData = tracks.data?.data;
                            if (tracksData != null) {
                              setTracksAsNextUp(BccmPlayerController.primary, bmmApi, tracksData, extras: {
                                'playlist.id': playlistId.toString(),
                              });
                              BccmPlayerController.primary.queue.skipToNext();
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            if (tracks.connectionState == ConnectionState.waiting && tracks.data?.data == null)
              SliverToBoxAdapter(
                child: Center(child: const LoadingIndicator()),
              ),
            if (tracks.hasData && tracks.data!.data != null)
              SliverToBoxAdapter(
                  child: Padding(
                padding: const EdgeInsets.all(16).subtract(const EdgeInsets.only(bottom: 8)),
                child: Text('${tracks.data!.data!.length}  tracks', style: design.textStyles.caption1),
              )),
            if (tracks.hasData && tracks.data!.data != null)
              SliverList(
                delegate: SliverChildListDelegate.fixed([
                  ...tracks.data!.data!.map((t) => TrackRenderer(t, showCover: false)),
                ]),
              ),
          ],
        ),
      ),
    );
  }
}
