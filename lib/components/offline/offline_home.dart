import 'package:brunstadtv_app/components/offline/downloaded_videos.dart';
import 'package:brunstadtv_app/flavors.dart';
import 'package:brunstadtv_app/helpers/app_theme.dart';
import 'package:brunstadtv_app/providers/downloads.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../l10n/app_localizations.dart';
import 'package:bccm_core/design_system.dart';
import '../badges/offline_badge.dart';

class OfflineHome extends ConsumerWidget {
  const OfflineHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final design = DesignSystem.of(context);
    final downloadedVideosCount = ref.watch(downloadsProvider.select((value) => value.valueOrNull?.length ?? 0));
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 44,
        backgroundColor: AppTheme.of(context).appBarTransparent ? Colors.transparent : design.colors.background1,
        elevation: 0,
        centerTitle: true,
        title: Image(
          image: FlavorConfig.current.bccmImages!.logo,
          height: FlavorConfig.current.bccmImages!.logoHeight,
          gaplessPlayback: true,
        ),
      ),
      extendBodyBehindAppBar: false,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverFillRemaining(
              hasScrollBody: true,
              child: downloadedVideosCount > 0 ? const _OfflineWithVideos() : const _OfflineNoVideos(),
            ),
          ],
        ),
      ),
    );
  }
}

class _OfflineNoVideos extends StatelessWidget {
  const _OfflineNoVideos();

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const OfflineBadge(),
        const SizedBox(height: 12),
        Text(
          S.of(context).noInternetConnection,
          style: design.textStyles.title1,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            S.of(context).noInternetConnectionDescription,
            style: design.textStyles.body1.copyWith(color: design.colors.label2),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

class _OfflineWithVideos extends StatelessWidget {
  const _OfflineWithVideos();

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const OfflineBadge(),
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Text(
                    S.of(context).noInternetButDontWorry,
                    style: design.textStyles.title1,
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    S.of(context).hereAreAllTheVideosYouDownloaded,
                    style: design.textStyles.body1.copyWith(color: design.colors.label2),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    S.of(context).connectToExplore,
                    style: design.textStyles.caption1.copyWith(color: design.colors.label4),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          const DownloadedVideosSection(),
        ],
      ),
    );
  }
}
