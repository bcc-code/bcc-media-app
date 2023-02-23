import 'package:brunstadtv_app/components/bottom_sheet_select.dart';
import 'package:brunstadtv_app/components/loading_generic.dart';
import 'package:brunstadtv_app/components/option_list.dart';
import 'package:brunstadtv_app/graphql/queries/episode.graphql.dart';
import 'package:brunstadtv_app/graphql/schema/items.graphql.dart';
import 'package:brunstadtv_app/theme/bccm_colors.dart';
import 'package:brunstadtv_app/theme/bccm_typography.dart';
import 'package:brunstadtv_app/helpers/svg_icons.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';
import 'package:brunstadtv_app/models/analytics/content_shared.dart';
import 'package:brunstadtv_app/providers/analytics.dart';
import 'package:brunstadtv_app/services/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:share_plus/share_plus.dart';

class ShareEpisodeSheet extends ConsumerStatefulWidget {
  const ShareEpisodeSheet({
    Key? key,
    required this.episode,
    required this.currentPosSeconds,
    required this.episodeId,
  }) : super(key: key);

  final Query$FetchEpisode$episode episode;
  final int currentPosSeconds;
  final String episodeId;

  @override
  ConsumerState<ShareEpisodeSheet> createState() => _ShareEpisodeSheetState();
}

class _ShareEpisodeSheetState extends ConsumerState<ShareEpisodeSheet> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    var options = [
      Option(
        id: 'fromStart',
        title: S.of(context).shareStart,
        icon: SvgPicture.string(SvgIcons.share, color: BccmColors.onTint),
      ),
      Option(
        id: 'fromTime',
        title: S.of(context).shareTime(getFormattedDuration(widget.currentPosSeconds, padFirstSegment: true)),
        icon: SvgPicture.string(SvgIcons.location, color: BccmColors.onTint),
      ),
    ];
    if (loading) {
      return const Center(child: LoadingGeneric());
    } else {
      return BottomSheetSelect(
        title: S.of(context).share,
        description: widget.episode.shareRestriction == Enum$ShareRestriction.public
            ? null
            : Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Row(
                  children: [
                    Padding(padding: const EdgeInsets.all(4), child: SvgPicture.string(SvgIcons.infoCircle)),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8, right: 16),
                        child: Text(
                          'This video is only accessible to users that are logged in to the app.',
                          style: BccmTextStyles.caption1.copyWith(color: BccmColors.label2),
                        ),
                      ),
                    )
                  ],
                ),
              ),
        selectedId: 'fromStart',
        items: options,
        showSelection: false,
        popOnChange: false,
        onSelectionChanged: (id) async {
          setState(() {
            loading = true;
          });
          var episodeUrl = 'https://app.bcc.media/episode/${widget.episodeId}';
          final navigator = Navigator.of(context);

          if (id == 'fromStart') {
            await Share.share(
              episodeUrl,
              sharePositionOrigin: iPadSharePositionOrigin(context),
            );
          } else {
            await Share.share(
              '$episodeUrl?t=${widget.currentPosSeconds}',
              sharePositionOrigin: iPadSharePositionOrigin(context),
            );
          }

          navigator.maybePop();

          ref.read(analyticsProvider).contentShared(
                ContentSharedEvent(
                  pageCode: 'episode',
                  elementType: 'episode',
                  elementId: widget.episodeId,
                  position: id == 'fromStart' ? null : widget.currentPosSeconds,
                ),
              );
        },
      );
    }
  }
}
