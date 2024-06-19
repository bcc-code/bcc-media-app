import 'package:bccm_core/bccm_core.dart';
import 'package:brunstadtv_app/components/status/loading_indicator.dart';
import 'package:brunstadtv_app/helpers/svg_icons.dart';
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
        onTap: setupPlayer,
        child: FocusableActionDetector(
          autofocus: true,
          mouseCursor: SystemMouseCursors.click,
          actions: {
            ActivateIntent: CallbackAction<ActivateIntent>(onInvoke: (_) => setupPlayer()),
          },
          child: Stack(
            children: [
              if (imageUrl != null)
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return Opacity(
                        opacity: 0.5,
                        child: FadeInImage(
                          key: Key('player_poster_$imageUrl'),
                          fit: BoxFit.cover,
                          placeholder: MemoryImage(kTransparentImage),
                          image: networkImageWithRetryAndResize(
                            imageUrl: imageUrl!,
                            cacheHeight: (constraints.maxHeight * MediaQuery.of(context).devicePixelRatio).round(),
                          ),
                          imageErrorBuilder: imageErrorBuilder,
                          fadeInDuration: const Duration(milliseconds: 150),
                        ),
                      );
                    },
                  ),
                ),
              if (loading)
                const Center(child: LoadingIndicator())
              else
                Center(
                  child: SizedBox(
                    width: 36,
                    height: 36,
                    child: SvgPicture.string(SvgIcons.play),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
