import 'package:brunstadtv_app/components/bottom_sheet_select.dart';
import 'package:brunstadtv_app/components/loading_generic.dart';
import 'package:brunstadtv_app/components/option_list.dart';
import 'package:brunstadtv_app/graphql/queries/episode.graphql.dart';
import 'package:brunstadtv_app/graphql/schema/items.graphql.dart';
import 'package:brunstadtv_app/theme/bccm_colors.dart';
import 'package:brunstadtv_app/theme/bccm_input_decorations.dart';
import 'package:brunstadtv_app/theme/bccm_typography.dart';
import 'package:brunstadtv_app/helpers/ui/svg_icons.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';
import 'package:brunstadtv_app/models/analytics/content_shared.dart';
import 'package:brunstadtv_app/providers/analytics.dart';
import 'package:brunstadtv_app/helpers/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:share_plus/share_plus.dart';
import '../helpers/share_extension/share_extension.dart';

import '../helpers/date_time.dart';

class ShareEpisodeSheet extends ConsumerStatefulWidget {
  const ShareEpisodeSheet({
    Key? key,
    required this.episode,
    required this.currentPosSeconds,
  }) : super(key: key);

  final Query$FetchEpisode$episode episode;
  final int currentPosSeconds;

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
          final episodeUrl = 'https://app.bcc.media/episode/${widget.episode.id}';
          final navigator = Navigator.of(context);

          var urlToShare = episodeUrl;

          if (id == 'fromTime') {
            urlToShare = '$episodeUrl?t=${widget.currentPosSeconds}';
          }

          try {
            await Share().shareUrl(
              urlToShare,
              sharePositionOrigin: iPadSharePositionOrigin(context),
            );
          } catch (e) {
            showDialog(
              context: context,
              builder: (context) => SimpleDialog(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
                      autofocus: true,
                      decoration: BccmInputDecorations.textFormField,
                      controller: TextEditingController(text: urlToShare),
                    ),
                  ),
                ],
              ),
            );
          }

          navigator.maybePop();

          ref.read(analyticsProvider).contentShared(
                ContentSharedEvent(
                  pageCode: 'episode',
                  elementType: 'episode',
                  elementId: widget.episode.id,
                  position: id == 'fromStart' ? null : widget.currentPosSeconds,
                ),
              );

          setState(() {
            loading = false;
          });
        },
      );
    }
  }
}
