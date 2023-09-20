import 'package:bccm_player/bccm_player.dart';
import 'package:brunstadtv_app/components/menus/option_list.dart';
import 'package:brunstadtv_app/graphql/queries/episode.graphql.dart';
import 'package:brunstadtv_app/helpers/bytes.dart';
import 'package:brunstadtv_app/helpers/permanent_cache_manager.dart';
import 'package:brunstadtv_app/helpers/svg_icons.dart';
import 'package:brunstadtv_app/models/offline/download_additional_data.dart';
import 'package:brunstadtv_app/providers/auth_state/auth_state.dart';
import 'package:brunstadtv_app/providers/downloads.dart';
import 'package:brunstadtv_app/providers/playback_service.dart';
import 'package:brunstadtv_app/theme/design_system/design_system.dart';

import 'package:brunstadtv_app/l10n/app_localizations.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../helpers/insets.dart';
import '../../helpers/languages.dart';
import '../../providers/me_provider.dart';
import '../status/loading_indicator.dart';

class EpisodeDownloadSheet extends HookConsumerWidget {
  const EpisodeDownloadSheet({
    Key? key,
    required this.episode,
    required this.parentContext,
  }) : super(key: key);

  final Query$FetchEpisode$episode episode;
  final BuildContext parentContext;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaInfoFuture = useMemoized(
      () => BccmPlayerInterface.instance.fetchMediaInfo(url: episode.streams.getBestStreamUrl(), mimeType: 'application/x-mpegURL'),
      [episode],
    );
    final mediaInfoSnapshot = useFuture(mediaInfoFuture);

    final downloadFuture = useState<Future<Download>?>(null);
    final downloadSnapshot = useFuture(downloadFuture.value);

    final selectedAudioTrack = useState<Track?>(null);
    final selectedVideoTrack = useState<Track?>(null);

    useEffect(() {
      if (mediaInfoSnapshot.data?.audioTracks.safe.isNotEmpty == true) {
        selectedAudioTrack.value = mediaInfoSnapshot.data?.audioTracks.safe.first;
      }
      if (mediaInfoSnapshot.data?.videoTracks.safe.isNotEmpty == true) {
        selectedVideoTrack.value = mediaInfoSnapshot.data?.videoTracks.safe.first;
      }
    }, [mediaInfoSnapshot.data]);

    int? estimatedFileSize = true ? 1300000 : null;

    const kLanguageOption = 'language';
    const kQualityOption = 'quality';

    final design = DesignSystem.of(context);
    final showSubtitlesList = useState(false);

    var options = [
      Option(
        id: kLanguageOption,
        rightSlot: selectedAudioTrack.value != null
            ? _currentlySelectedWidget(
                title: getLanguageName(selectedAudioTrack.value!.language) ?? selectedAudioTrack.value!.labelWithFallback,
              )
            : const Center(child: LoadingIndicator(width: 15, height: 15)),
        title: 'Language',
        subTitleSlot: ClipRect(
          child: _SubtitlesInfo(
            showList: showSubtitlesList.value,
            subtitleTracks: mediaInfoSnapshot.data?.textTracks.safe.toList(),
          ),
        ),
        overlay: Positioned.fill(
          child: FractionallySizedBox(
            widthFactor: 0.5,
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                showSubtitlesList.value = !showSubtitlesList.value;
              },
            ),
          ),
        ),
      ),
      Option(
        id: kQualityOption,
        title: S.of(context).videoQuality,
        subTitleSlot: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            'Estimated file size: ${estimatedFileSize != null ? '${(estimatedFileSize / 1000).round()} MB' : 'Unknown'}',
            style: design.textStyles.caption1.copyWith(color: design.colors.label4),
          ),
        ),
        rightSlot: selectedVideoTrack.value != null
            ? _currentlySelectedWidget(
                title: selectedVideoTrack.value!.labelWithFallback,
              )
            : null,
      ),
    ];

    void showLanguageSelector() async {
      final audioTracks = mediaInfoSnapshot.data?.audioTracks.safe;
      if (audioTracks == null) return;
      if (!parentContext.mounted) return;
      final option = await _showSelfClosingPopupOptionList(
        context: parentContext,
        appBarTitle: S.of(context).audioLanguage,
        startingSelection: selectedAudioTrack.value?.id,
        options: audioTracks.map((e) {
          final lang = languages[e.language];
          return Option(
            id: e.id,
            title: lang?.nativeName ?? e.labelWithFallback,
            subTitle: lang?.englishName,
          );
        }).toList(),
      );
      if (!context.mounted || option == null) return;
      selectedAudioTrack.value = audioTracks.firstWhere((element) => element.id == option.id);
    }

    void showQualitySelector() async {
      final videoTracks = mediaInfoSnapshot.data?.videoTracks.safe;
      if (videoTracks == null) return;
      if (!parentContext.mounted) return;
      final option = await _showSelfClosingPopupOptionList(
        context: parentContext,
        appBarTitle: S.of(context).videoQuality,
        startingSelection: selectedVideoTrack.value?.id,
        options: videoTracks
            .where((element) => element.bitrate != null && element.bitrate! > 0)
            .map((e) => Option(
                  id: e.id,
                  title: e.labelWithFallback,
                  subTitle: e.bitrate == null
                      ? null
                      : kiloBytesToString(
                          kiloBytesForBitrateAndDuration(
                            e.bitrate!,
                            Duration(seconds: episode.duration),
                          ),
                        ),
                ))
            .toList(),
      );
      if (!context.mounted || option == null) return;
      selectedVideoTrack.value = videoTracks.firstWhere((element) => element.id == option.id);
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
                enableDivider: true,
                onSelectionChange: (val) async {
                  switch (val) {
                    case kLanguageOption:
                      showLanguageSelector();
                      break;
                    case kQualityOption:
                      showQualitySelector();
                      break;
                  }

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
              if (downloadSnapshot.connectionState == ConnectionState.waiting)
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: const LoadingIndicator(),
                )
              else
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  width: double.infinity,
                  height: 52.1,
                  child: design.buttons.large(
                    disabled: selectedAudioTrack.value?.id == null || selectedVideoTrack.value?.id == null,
                    onPressed: () async {
                      final mediaItem = ref.read(playbackServiceProvider).mapEpisode(episode);

                      downloadFuture.value = () async {
                        final download = await ref.read(downloadsProvider.notifier).startDownload(DownloadConfig(
                              url: episode.streams.getBestStreamUrl(),
                              mimeType: 'application/x-mpegURL',
                              title: episode.title,
                              audioTrackIds: [selectedAudioTrack.value?.id],
                              videoTrackIds: [selectedVideoTrack.value?.id],
                              additionalData: {
                                ...?mediaItem.metadata?.extras,
                                ...TypedAdditionalData(
                                  episodeId: episode.id,
                                  artworkUri: mediaItem.metadata?.artworkUri,
                                  durationMs: mediaItem.metadata?.durationMs,
                                  downloadedAt: DateTime.now(),
                                  expiresAt: DateTime.now().add(const Duration(days: 30)),
                                  downloadedBy: ref.read(meProvider).valueOrNull?.me.id,
                                ).toStringMap()
                              },
                            ));

                        final image = mediaItem.metadata?.artworkUri;
                        if (image != null) {
                          await PermanentCacheManager().downloadFile(image);
                        }
                        return download;
                      }();

                      await downloadFuture.value;

                      if (context.mounted) {
                        Navigator.of(context).maybePop(true);
                      }
                    },
                    labelText: S.of(context).downloadButton,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _currentlySelectedWidget extends StatelessWidget {
  const _currentlySelectedWidget({
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    return Container(
      alignment: Alignment.topRight,
      padding: const EdgeInsets.only(right: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: design.textStyles.body2.copyWith(color: design.colors.label3),
          ),
          const SizedBox(width: 14),
          SvgPicture.string(
            SvgIcons.chevronRight,
            height: 12,
            fit: BoxFit.scaleDown,
            colorFilter: ColorFilter.mode(design.colors.label3, BlendMode.srcIn),
          ),
        ],
      ),
    );
  }
}

class _SubtitlesInfo extends HookWidget {
  const _SubtitlesInfo({required this.showList, required this.subtitleTracks});

  final bool showList;
  final List<Track>? subtitleTracks;

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (subtitleTracks?.isNotEmpty != true) ...[
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'No subtitles',
                  style: design.textStyles.caption1.copyWith(color: design.colors.label4),
                ),
              ],
            ),
          ),
        ] else ...[
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Subtitles included',
                  style: design.textStyles.caption1.copyWith(color: design.colors.label4),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  padding: const EdgeInsets.only(
                    left: 6,
                    bottom: 1,
                  ),
                  child: SvgPicture.string(
                    showList ? SvgIcons.chevronDown : SvgIcons.chevronRight,
                    height: 10,
                    fit: BoxFit.scaleDown,
                    colorFilter: ColorFilter.mode(design.colors.label4, BlendMode.srcIn),
                  ),
                ),
              ],
            ),
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeOutCirc,
            alignment: Alignment.topCenter,
            child: ClipRect(
              child: Align(
                alignment: Alignment.topLeft,
                heightFactor: showList && subtitleTracks?.isNotEmpty == true ? 1 : 0,
                child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const SizedBox(height: 12),
                  Text(
                    'All subtitles will be available offline',
                    style: design.textStyles.body2.copyWith(color: design.colors.label1),
                  ),
                  const SizedBox(height: 4),
                  ...subtitleTracks!.map((e) => Text(
                        e.labelWithFallback,
                        style: design.textStyles.caption1.copyWith(color: design.colors.label3),
                      )),
                ]),
              ),
            ),
          )
        ]
      ],
    );
  }
}

Future<Option?> _showSelfClosingPopupOptionList({
  required BuildContext context,
  required String appBarTitle,
  String? startingSelection,
  required List<Option> options,
}) {
  return showModalBottomSheet<Option>(
    useRootNavigator: true,
    context: context,
    enableDrag: false,
    elevation: 0,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (context) {
      return _CupertinoPopup(
        appBarTitle: appBarTitle,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: HookBuilder(builder: (context) {
            final selectedOption = useState<Option?>(options.firstWhereOrNull((element) => element.id == startingSelection));
            return OptionList(
              currentSelection: selectedOption.value?.id,
              backgroundColor: Colors.transparent,
              onSelectionChange: (v) {
                selectedOption.value = options.firstWhereOrNull((element) => element.id == v);
                Navigator.of(context).maybePop(selectedOption.value);
              },
              optionData: options,
            );
          }),
        ),
      );
    },
  );
}

class _CupertinoPopup extends StatelessWidget {
  const _CupertinoPopup({
    required this.appBarTitle,
    required this.body,
  });

  final String appBarTitle;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 51,
        leadingWidth: 92,
        scrolledUnderElevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).maybePop();
          },
          child: Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 14),
            child: SvgPicture.string(
              SvgIcons.close,
              width: 24,
              height: 24,
              fit: BoxFit.scaleDown,
              colorFilter: ColorFilter.mode(design.colors.tint1, BlendMode.srcIn),
            ),
          ),
        ),
        title: Text(appBarTitle),
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: SafeArea(
          child: body,
        ),
      ),
    );
  }
}
