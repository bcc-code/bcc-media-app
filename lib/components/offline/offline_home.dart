import 'package:brunstadtv_app/flavors.dart';
import 'package:flutter/material.dart';

import '../../theme/design_system/design_system.dart';
import '../badges/offline_badge.dart';

class OfflineHome extends StatelessWidget {
  const OfflineHome({super.key});

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 44,
        backgroundColor: design.appThemeData.appBarTransparent ? Colors.transparent : design.colors.background1,
        elevation: 0,
        centerTitle: true,
        title: Image(
          image: FlavorConfig.current.images.logo,
          height: FlavorConfig.current.images.logoHeight,
          gaplessPlayback: true,
        ),
      ),
      extendBodyBehindAppBar: false,
      body: const SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverFillRemaining(
              hasScrollBody: true,
              child: _OfflineNoVideos(),
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
          'No internet connection',
          style: design.textStyles.title1,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Connect to the internet to access all videos.',
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const OfflineBadge(),
        const SizedBox(height: 12),
        Text(
          'No internet connection',
          style: design.textStyles.title1,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Connect to the internet to access all videos.',
            style: design.textStyles.body1.copyWith(color: design.colors.label2),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
