import 'package:brunstadtv_app/components/bottom_sheet_select.dart';
import 'package:brunstadtv_app/components/status_indicators/loading_generic.dart';
import 'package:brunstadtv_app/components/option_list.dart';
import 'package:brunstadtv_app/graphql/queries/episode.graphql.dart';
import 'package:brunstadtv_app/graphql/schema/episodes.graphql.dart';
import 'package:brunstadtv_app/helpers/extensions.dart';
import 'package:brunstadtv_app/theme/design_system/design_system.dart';

import 'package:brunstadtv_app/helpers/ui/svg_icons.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';
import 'package:brunstadtv_app/models/analytics/content_shared.dart';
import 'package:brunstadtv_app/providers/analytics.dart';
import 'package:brunstadtv_app/helpers/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:share_plus/share_plus.dart';
import '../../helpers/share_extension/share_extension.dart';

import '../../helpers/date_time.dart';

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
        icon: SvgPicture.string(SvgIcons.share, color: DesignSystem.of(context).colors.onTint),
      ),
      Option(
        id: 'fromTime',
        title: S.of(context).shareTime(getFormattedDuration(widget.currentPosSeconds, padFirstSegment: true)),
        icon: SvgPicture.string(SvgIcons.location, color: DesignSystem.of(context).colors.onTint),
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
                          S.of(context).videoOnlyAccessibleToLoggedIn,
                          style: DesignSystem.of(context).textStyles.caption1.copyWith(color: DesignSystem.of(context).colors.label2),
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
          final collectionId = widget.episode.context.asOrNull<Fragment$EpisodeContext$$ContextCollection>()?.id;
          var episodeUrl = 'https://app.bcc.media/episode/${widget.episode.id}';
          if (collectionId != null) {
            episodeUrl = 'https://app.bcc.media/episode/$collectionId/${widget.episode.id}';
          }

          if (id == 'fromTime') {
            episodeUrl = '$episodeUrl?t=${widget.currentPosSeconds}';
          }

          final navigator = Navigator.of(context);
          try {
            await Share().shareUrl(
              episodeUrl,
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
                      decoration: DesignSystem.of(context).inputDecorations.textFormField,
                      controller: TextEditingController(text: episodeUrl),
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
