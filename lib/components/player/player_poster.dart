import 'package:bccm_core/bccm_core.dart';
import 'package:bccm_core/design_system.dart';
import 'package:bccm_core/platform.dart';
import 'package:brunstadtv_app/components/status/loading_indicator.dart';
import 'package:brunstadtv_app/helpers/svg_icons.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class PlayerPoster extends StatelessWidget {
  const PlayerPoster({
    super.key,
    required this.loading,
    required this.setupPlayer,
    required this.episode,
  });

  final bool loading;
  final void Function() setupPlayer;
  final Query$FetchEpisode$episode episode;

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    final episodePublishDate = DateTime.tryParse(episode.publishDate);

    onPressed() {
      if (episode.locked) return;
      setupPlayer();
    }

    return AspectRatio(
      aspectRatio: 16 / 9,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onPressed,
        child: FocusableActionDetector(
          autofocus: true,
          mouseCursor: SystemMouseCursors.click,
          actions: {
            ActivateIntent: CallbackAction<ActivateIntent>(onInvoke: (_) => onPressed()),
          },
          child: Stack(
            children: [
              if (episode.image != null)
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return Opacity(
                        opacity: 0.5,
                        child: FadeInImage(
                          key: Key('player_poster_${episode.image}'),
                          fit: BoxFit.cover,
                          placeholder: MemoryImage(kTransparentImage),
                          image: networkImageWithRetryAndResize(
                            imageUrl: episode.image!,
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
              else if (episode.locked)
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 36,
                        height: 36,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.contain,
                            image: AssetImage('assets/icons/Wait.png'),
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      if (episodePublishDate != null)
                        Text(
                          S.of(context).availableFrom(DateFormat(DateFormat.YEAR_MONTH_DAY).format(episodePublishDate)),
                          style: design.textStyles.body2.copyWith(color: design.colors.label2),
                        )
                    ],
                  ),
                )
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
