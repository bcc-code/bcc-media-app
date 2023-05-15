import 'package:brunstadtv_app/components/status_indicators/loading_indicator.dart';
import 'package:brunstadtv_app/theme/design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:brunstadtv_app/helpers/ui/transparent_image.dart';
import 'package:flutter_svg/svg.dart';

import '../helpers/ui/svg_icons.dart';

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
  final Border? border;

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
    this.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    return Container(
      height: kMiniPlayerHeight,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: design.colors.background2,
        border: border ?? Border(top: BorderSide(color: design.colors.separatorOnLight, width: 1)),
      ),
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
                color: design.colors.onTint.withOpacity(0.01),
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
                      style: design.textStyles.caption2.copyWith(color: design.colors.tint1),
                    ),
                  ),
                Text(
                  title,
                  semanticsLabel: title,
                  key: WidgetKeys.miniPlayerTitle,
                  overflow: TextOverflow.ellipsis,
                  style: design.textStyles.caption1.copyWith(color: design.colors.label1),
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
                child: SvgPicture.string(SvgIcons.close),
              ),
            ),
        ],
      ),
    );
  }
}
