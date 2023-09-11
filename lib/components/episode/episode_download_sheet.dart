import 'package:bccm_player/bccm_player.dart';
import 'package:brunstadtv_app/components/menus/bottom_sheet_select.dart';
import 'package:brunstadtv_app/components/menus/option_list.dart';
import 'package:brunstadtv_app/graphql/queries/episode.graphql.dart';
import 'package:brunstadtv_app/providers/playback_service.dart';
import 'package:brunstadtv_app/theme/design_system/design_system.dart';

import 'package:brunstadtv_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../helpers/insets.dart';
import '../../helpers/languages.dart';

class EpisodeDownloadSheet extends HookWidget {
  const EpisodeDownloadSheet({
    Key? key,
    required this.episode,
  }) : super(key: key);

  final Query$FetchEpisode$episode episode;

  @override
  Widget build(BuildContext context) {
    final mediaInfoFuture = useMemoized(
      () => BccmPlayerInterface.instance.fetchMediaInfo(url: episode.streams.getBestStreamUrl()),
      [episode],
    );
    final mediaInfoSnapshot = useFuture(mediaInfoFuture);

    int? estimatedFileSize = true ? 1300000 : null;

    const kLanguageOption = 'language';
    const kQualityOption = 'quality';

    var options = [
      Option(
        id: kLanguageOption,
        title: 'Language',
        subTitle: 'Subtitles included',
      ),
      Option(
        id: kQualityOption,
        title: S.of(context).videoQuality,
        subTitle: 'Estimated file size: ${estimatedFileSize != null ? '${(estimatedFileSize / 1000).round()} MB' : 'Unknown'}',
      ),
    ];
    final design = DesignSystem.of(context);

    void showLanguageSelector() {
      final audioTracks = mediaInfoSnapshot.data?.audioTracks.safe;
      if (audioTracks == null) return;
      showModalBottomSheet(
          context: context,
          useRootNavigator: true,
          builder: (ctx) {
            return BottomSheetSelect(
              title: 'title',
              items: [...audioTracks]
                  .map((e) => Option(
                        id: e.id,
                        title: getLanguageName(e.language) ?? e.labelWithFallback,
                      ))
                  .toList(),
              selectedId: '',
              onSelectionChanged: (v) {},
            );
          });
    }

    void showQualitySelector() {
      showModalBottomSheet(
          context: context,
          useRootNavigator: true,
          builder: (ctx) {
            return BottomSheetSelect(
              title: 'title',
              items: options,
              selectedId: '',
              onSelectionChanged: (v) {},
            );
          });
    }

    return Container(
      color: design.colors.background1,
      child: SafeArea(
        child: Padding(
          padding: screenInsets(context) + const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                child: Container(
                  height: 5,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: design.colors.label4,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                child: Text(
                  'Download video',
                  textAlign: TextAlign.center,
                  style: design.textStyles.title3,
                ),
              ),
              OptionList(
                optionData: options,
                currentSelection: null,
                showSelection: false,
                onSelectionChange: (val) async {
                  switch (val) {
                    case kLanguageOption:
                      showLanguageSelector();
                      break;
                    case kQualityOption:
                      showQualitySelector();
                      break;
                  }

                  Navigator.of(context).maybePop();

                  /* ref.read(analyticsProvider).downloadStart(
                      ContentSharedEvent(
                        pageCode: 'episode',
                        elementType: 'episode',
                        elementId: widget.episode.id,
                        position: id == 'fromStart' ? null : widget.currentPosSeconds,
                      ),
                    ); */
                },
              ),
              Container(
                margin: const EdgeInsets.only(top: 16),
                width: double.infinity,
                height: 52.1,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: design.colors.separatorOnLight,
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(100))),
                    side: BorderSide(width: 1, color: design.colors.separatorOnLight),
                  ),
                  onPressed: () {
                    Navigator.pop(context, BottomSheetSelectResult(cancelled: true));
                  },
                  child: Text(
                    S.of(context).cancel,
                    style: design.textStyles.button1.copyWith(color: design.colors.label1),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
