import 'package:brunstadtv_app/components/loading_indicator.dart';
import 'package:brunstadtv_app/theme/bccm_colors.dart';
import 'package:flutter/material.dart';
import 'package:brunstadtv_app/helpers/transparent_image.dart';

import '../theme/bccm_typography.dart';
import '../helpers/widget_keys.dart';
import '../l10n/app_localizations.dart';

const double kMiniPlayerHeight = 62;

class MiniPlayer extends StatelessWidget {
  final String? secondaryTitle;
  final String title;
  final String? artworkUri;
  final bool isPlaying;
  final bool? loading;
  final VoidCallback? onPauseTap;
  final VoidCallback? onPlayTap;
  final VoidCallback? onCloseTap;
  final bool? hideCloseButton;

  const MiniPlayer({
    Key? key,
    required this.secondaryTitle,
    required this.title,
    required this.artworkUri,
    required this.isPlaying,
    this.onPauseTap,
    this.onPlayTap,
    this.onCloseTap,
    this.loading,
    this.hideCloseButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kMiniPlayerHeight,
      width: MediaQuery.of(context).size.width,
      color: BccmColors.background2,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            width: 64,
            height: 36,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: BccmColors.onTint.withOpacity(0.01),
                width: 1,
              ),
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: FadeInImage.memoryNetwork(
                  fadeInDuration: const Duration(milliseconds: 200),
                  placeholder: kTransparentImage,
                  fit: BoxFit.fill,
                  image: artworkUri ?? 'https://static.bcc.media/images/placeholder.jpg',
                  imageCacheHeight: 64,
                  width: 64,
                  height: 36,
                )),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (secondaryTitle != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Text(
                      secondaryTitle!,
                      semanticsLabel: secondaryTitle!,
                      overflow: TextOverflow.ellipsis,
                      style: BccmTextStyles.caption2.copyWith(color: BccmColors.tint1),
                    ),
                  ),
                Text(
                  title,
                  semanticsLabel: title,
                  key: WidgetKeys.miniPlayerTitle,
                  overflow: TextOverflow.ellipsis,
                  style: BccmTextStyles.caption1.copyWith(color: BccmColors.label1),
                ),
              ],
            ),
          ),
          if (loading == true)
            Container(margin: const EdgeInsets.only(left: 16), height: 36, child: const LoadingIndicator(height: 24))
          else
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => isPlaying ? onPauseTap?.call() : onPlayTap?.call(),
              child: Container(
                margin: const EdgeInsets.only(left: 16),
                height: 36,
                child: isPlaying
                    ? Image.asset(semanticLabel: S.of(context).pause, height: 24, 'assets/icons/Pause.png', gaplessPlayback: true)
                    : Image.asset(semanticLabel: S.of(context).play, height: 24, 'assets/icons/Play.png', gaplessPlayback: true),
              ),
            ),
          if (hideCloseButton != true)
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => onCloseTap?.call(),
              child: Container(
                margin: const EdgeInsets.only(left: 7),
                height: 36,
                child: Image.asset(width: 32, height: 16, 'assets/icons/Close.png', gaplessPlayback: true),
              ),
            ),
        ],
      ),
    );
  }
}
