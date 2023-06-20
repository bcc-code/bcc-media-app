import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'loading_indicator.dart';
import '../../helpers/ui/transparent_image.dart';
import '../../helpers/ui/svg_icons.dart';

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
  final BorderSide? border;

  final Key? titleKey;
  final Color? backgroundColor;
  final Border? thumbnailBorder;
  final TextStyle? titleStyle;
  final TextStyle? secondaryTitleStyle;
  final Widget? loadingIndicator;
  final String? playSemanticLabel;
  final String? pauseSemanticLabel;

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
    this.titleKey,
    this.backgroundColor,
    this.titleStyle,
    this.secondaryTitleStyle,
    this.thumbnailBorder,
    this.loadingIndicator,
    this.playSemanticLabel,
    this.pauseSemanticLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kMiniPlayerHeight,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border(top: border ?? BorderSide.none),
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
              border: thumbnailBorder ??
                  Border.all(
                    color: Colors.white.withOpacity(0.01),
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
                      style: secondaryTitleStyle,
                    ),
                  ),
                Text(
                  title,
                  semanticsLabel: title,
                  key: titleKey,
                  overflow: TextOverflow.ellipsis,
                  style: titleStyle,
                ),
              ],
            ),
          ),
          if (loading == true)
            Container(margin: const EdgeInsets.only(left: 16), height: 36, child: loadingIndicator ?? const LoadingIndicator(height: 24))
          else
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => isPlaying ? onPauseTap?.call() : onPlayTap?.call(),
              child: Container(
                margin: const EdgeInsets.only(left: 16),
                height: 36,
                child: isPlaying
                    ? SvgPicture.string(
                        SvgIcons.pause,
                        semanticsLabel: pauseSemanticLabel,
                      )
                    : SvgPicture.string(
                        SvgIcons.play,
                        semanticsLabel: playSemanticLabel,
                      ),
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
