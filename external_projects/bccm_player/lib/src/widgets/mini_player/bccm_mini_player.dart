import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';

import '../../../theme/player_theme.dart';
import '../../utils/svg_icons.dart';
import '../../utils/transparent_image.dart';
import 'loading_indicator.dart';

const double kMiniPlayerHeight = 62;

class MiniPlayer extends HookWidget {
  final String? secondaryTitle;
  final String title;
  final String? artworkUri;
  final bool isPlaying;
  final bool? loading;
  final VoidCallback? onPauseTap;
  final VoidCallback? onPlayTap;
  final VoidCallback? onCloseTap;
  final bool? hideCloseButton;
  final bool showBorder;

  final Key? titleKey;
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
    this.showBorder = true,
    this.titleKey,
    this.loadingIndicator,
    this.playSemanticLabel,
    this.pauseSemanticLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = PlayerTheme.safeOf(context).miniPlayer!;

    return Container(
      height: kMiniPlayerHeight,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: theme.backgroundColor,
        border: showBorder ? Border(top: BorderSide(color: theme.topBorderColor ?? Colors.transparent, width: 1)) : null,
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
              border: Border.all(color: theme.thumbnailBorderColor ?? Colors.transparent, width: 1),
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
                      style: theme.secondaryTitleStyle,
                    ),
                  ),
                Text(
                  title,
                  semanticsLabel: title,
                  key: titleKey,
                  overflow: TextOverflow.ellipsis,
                  style: theme.titleStyle,
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
                        colorFilter: ColorFilter.mode(theme.iconColor ?? Colors.transparent, BlendMode.srcIn),
                      )
                    : SvgPicture.string(
                        SvgIcons.play,
                        semanticsLabel: playSemanticLabel,
                        colorFilter: ColorFilter.mode(theme.iconColor ?? Colors.transparent, BlendMode.srcIn),
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
                child: SvgPicture.string(
                  SvgIcons.close,
                  colorFilter: ColorFilter.mode(theme.iconColor ?? Colors.transparent, BlendMode.srcIn),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
