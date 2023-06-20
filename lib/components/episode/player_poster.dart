import 'package:brunstadtv_app/components/status_indicators/loading_indicator.dart';
import 'package:brunstadtv_app/helpers/ui/svg_icons.dart';
import 'package:brunstadtv_app/helpers/ui/transparent_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PlayerPoster extends StatelessWidget {
  const PlayerPoster({
    super.key,
    required this.imageUrl,
    required this.loading,
    required this.setupPlayer,
  });

  final String? imageUrl;
  final bool loading;
  final void Function() setupPlayer;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          setupPlayer();
        },
        child: Stack(
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: imageUrl == null
                  ? null
                  : LayoutBuilder(
                      builder: (context, constraints) {
                        return Opacity(
                          opacity: 0.5,
                          child: FadeInImage.memoryNetwork(
                            key: Key('player_poster_$imageUrl'),
                            fit: BoxFit.cover,
                            placeholder: kTransparentImage,
                            image: imageUrl!,
                            fadeInDuration: const Duration(milliseconds: 150),
                            imageCacheHeight: (constraints.maxHeight * MediaQuery.of(context).devicePixelRatio).round(),
                          ),
                        );
                      },
                    ),
            ),
            Center(
              child: loading
                  ? const LoadingIndicator()
                  : SizedBox(
                      width: 36,
                      height: 36,
                      child: SvgPicture.string(SvgIcons.play),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
