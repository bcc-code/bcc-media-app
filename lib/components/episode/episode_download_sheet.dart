import 'package:bccm_player/bccm_player.dart';
import 'package:brunstadtv_app/components/guides/favorite_guides.dart';
import 'package:brunstadtv_app/components/menus/option_list.dart';
import 'package:brunstadtv_app/graphql/queries/episode.graphql.dart';
import 'package:brunstadtv_app/helpers/bytes.dart';
import 'package:brunstadtv_app/helpers/constants.dart';
import 'package:brunstadtv_app/helpers/permanent_cache_manager.dart';
import 'package:brunstadtv_app/helpers/svg_icons.dart';
import 'package:brunstadtv_app/helpers/translations.dart';
import 'package:brunstadtv_app/models/analytics/downloads.dart';
import 'package:brunstadtv_app/models/analytics/misc.dart';
import 'package:brunstadtv_app/models/offline/download_additional_data.dart';
import 'package:brunstadtv_app/providers/analytics.dart';
import 'package:brunstadtv_app/providers/downloads.dart';
import 'package:brunstadtv_app/providers/playback_service.dart';
import 'package:brunstadtv_app/providers/settings.dart';
import 'package:brunstadtv_app/providers/shared_preferences.dart';
import 'package:bccm_core/design_system.dart';

import 'package:brunstadtv_app/l10n/app_localizations.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../helpers/insets.dart';
import '../../helpers/languages.dart';
import '../../helpers/misc.dart';
import '../../models/offline/download_quality.dart';
import '../../providers/me_provider.dart';
import '../misc/generic_dialog.dart';
import '../status/loading_indicator.dart';

class EpisodeDownloadSheet extends HookConsumerWidget {
  const EpisodeDownloadSheet({
    Key? key,
    required this.episode,
    required this.downloadUrl,
    required this.parentContext,
  }) : super(key: key);

  final Query$FetchEpisode$episode episode;
  final String downloadUrl;
  final BuildContext parentContext;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaInfoFuture = useMemoized(
      () => BccmPlayerInterface.instance.fetchMediaInfo(url: downloadUrl, mimeType: 'application/x-mpegURL'),
      [downloadUrl],
    );
    final mediaInfoSnapshot = useFuture(mediaInfoFuture);
    final mediaInfo = mediaInfoSnapshot.data;

    final downloadFuture = useState<Future<Download>?>(null);
    final downloadSnapshot = useFuture(downloadFuture.value);

    final selectedAudioTrack = useState<Track?>(null);
    final selectedVideoQuality = useState<({DownloadQuality quality, Track track})?>(null);
    final savedAudioSetting = ref.watch(settingsProvider.select(
      (settings) => settings.downloadAudioLanguage ?? settings.audioLanguages.firstOrNull ?? settings.appLanguage.languageCode,
    ));
    final savedQualitySetting = ref.watch(settingsProvider.select((value) => value.downloadQuality));

    final warnAboutAudioLanguage = useState<String?>(null);

    useEffect(() {
      if (mediaInfo == null) {
        selectedAudioTrack.value = null;
        selectedVideoQuality.value = null;
        return;
      }
      selectedAudioTrack.value = mediaInfo.audioTracks.safe.firstOrNull;
      final languageTrack = mediaInfo.audioTracks.safe.firstWhereOrNull((element) => element.language == savedAudioSetting);
      if (languageTrack != null) {
        selectedAudioTrack.value = languageTrack;
      } else {
        warnAboutAudioLanguage.value = getLanguageName(savedAudioSetting);
      }
      final qualityTracks = downloadQualitiesForTracks(mediaInfo.videoTracks.safe.toList());
      if (savedQualitySetting != null) {
        final track = qualityTracks[savedQualitySetting];
        if (track != null) {
          selectedVideoQuality.value = (quality: savedQualitySetting, track: track);
        }
      }
      if (selectedVideoQuality.value == null) {
        final quality = qualityTracks.keys.first;
        final track = qualityTracks[quality]!;
        selectedVideoQuality.value = (quality: quality, track: track);
      }
    }, [mediaInfo]);

    double? estimatedFileSizeKb = selectedVideoQuality.value?.track.bitrate != null
        ? kiloBytesForBitrateAndDuration(
            selectedVideoQuality.value!.track.bitrate!,
            Duration(seconds: episode.duration),
          )
        : null;

    const kLanguageOption = 'language';
    const kQualityOption = 'quality';

    final design = DesignSystem.of(context);
    final showSubtitlesList = useState(false);

    var options = [
      Option(
        id: kLanguageOption,
        rightSlot: selectedAudioTrack.value != null
            ? _CurrentlySelectedWidget(
                title: getLanguageName(selectedAudioTrack.value!.language) ?? selectedAudioTrack.value!.labelWithFallback,
              )
            : const Center(child: LoadingIndicator(width: 15, height: 15)),
        title: S.of(context).language,
        subTitleSlot: ClipRect(
          child: _SubtitlesInfo(
            showList: showSubtitlesList.value,
            subtitleTracks: mediaInfo?.textTracks.safe.toList(),
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
        subTitleSlot: estimatedFileSizeKb == null
            ? null
            : Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  S.of(context).estimatedFileSize(kiloBytesToString(estimatedFileSizeKb)),
                  style: design.textStyles.caption1.copyWith(color: design.colors.label4),
                ),
              ),
        rightSlot: selectedVideoQuality.value != null
            ? _CurrentlySelectedWidget(
                title: selectedVideoQuality.value!.track.height != null
                    ? '${selectedVideoQuality.value!.track.height}p'
                    : selectedVideoQuality.value!.track.labelWithFallback,
              )
            : null,
      ),
    ];

    void showLanguageSelector() async {
      final audioTracks = mediaInfo?.audioTracks.safe;
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
      warnAboutAudioLanguage.value = null;
      final audioTrack = audioTracks.firstWhere((element) => element.id == option.id);
      selectedAudioTrack.value = audioTrack;
      ref.read(settingsProvider.notifier).setDownloadAudioLanguage(audioTrack.language);
    }

    void showQualitySelector() async {
      final videoTracks = mediaInfo?.videoTracks.safe;
      if (videoTracks == null) return;
      if (!parentContext.mounted) return;
      final qualities = downloadQualitiesForTracks(videoTracks.toList());
      if (qualities.isEmpty) return;
      final option = await _showSelfClosingPopupOptionList(
        context: parentContext,
        appBarTitle: S.of(context).videoQuality,
        startingSelection: selectedVideoQuality.value?.quality,
        options: qualities.keys.map((key) {
          final heightString = qualities[key]?.height == null ? '' : '${qualities[key]!.height}p';
          final sizeString = qualities[key]?.bitrate == null
              ? 'null'
              : kiloBytesToString(
                  kiloBytesForBitrateAndDuration(
                    qualities[key]!.bitrate!,
                    Duration(seconds: episode.duration),
                  ),
                );
          return Option(
            id: key,
            title: key.translate(context),
            subTitle: [heightString, sizeString].join(' - '),
          );
        }).toList(),
      );
      if (!context.mounted || option == null || option.id == null) return;
      selectedVideoQuality.value = (quality: option.id!, track: qualities[option.id]!);
      ref.read(settingsProvider.notifier).setDownloadQuality(option.id!);
    }

    Future<void> onDownloadPressed() async {
      final mediaItem = ref.read(playbackServiceProvider).mapEpisode(episode);

      // Prevent multiple downloads if tapping fast
      if (downloadSnapshot.connectionState == ConnectionState.waiting) {
        return;
      }

      try {
        final diskSpace = await DownloaderInterface.instance.getFreeDiskSpace();
        if (!context.mounted) return;
        if (diskSpace > 0 && estimatedFileSizeKb != null && diskSpace < estimatedFileSizeKb * 1024) {
          showDialog(
            context: context,
            builder: (context) => GenericDialog(
              title: S.of(context).notEnoughAvailableSpace,
              description: '${S.of(context).considerDeletingOtherVideos} ${S.of(context).theVideoFileSizeIs(kiloBytesToString(estimatedFileSizeKb))}',
              dismissButtonText: S.of(context).gotIt,
              titleStyle: design.textStyles.title2.copyWith(color: design.colors.onTint),
              descriptionStyle: design.textStyles.body2.copyWith(color: design.colors.label3),
            ),
          );
          return;
        }
      } catch (e) {
        print(e);
      }

      downloadFuture.value = () async {
        final download = await ref.read(downloadsProvider.notifier).startDownload(DownloadConfig(
              url: downloadUrl,
              mimeType: 'application/x-mpegURL',
              title: episode.title,
              audioTrackIds: [selectedAudioTrack.value?.id],
              videoTrackIds: [selectedVideoQuality.value?.track.id],
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

        tryCatchRecordError(() {
          ref.read(analyticsProvider).videoDownloadStarted(
                VideoDownloadStartedEvent(
                  downloadId: download.key,
                  episodeId: episode.id,
                  audioLanguage: selectedAudioTrack.value?.language,
                  quality: selectedVideoQuality.value?.quality.name,
                ),
              );
        });

        final image = mediaItem.metadata?.artworkUri;
        if (image != null) {
          await PermanentCacheManager().downloadFile(image);
        }
        return download;
      }();

      await downloadFuture.value;

      if (!context.mounted) return;
      Navigator.of(context).maybePop(true);
      final hasShownGuide = ref.read(sharedPreferencesProvider).getBool(PrefKeys.downloadedVideosGuide) ?? false;
      if (hasShownGuide) return;
      ref.read(sharedPreferencesProvider).setBool(PrefKeys.downloadedVideosGuide, true);
      ref.read(analyticsProvider).guideShown(const GuideShownEvent(guide: 'downloaded-videos'));
      createDownloadedIsInProfileGuide(context).show(context: context, rootOverlay: true);
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
              Text(
                S.of(context).downloadVideo,
                textAlign: TextAlign.center,
                style: design.textStyles.title3,
              ),
              if (warnAboutAudioLanguage.value != null)
                Container(
                  margin: const EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(padding: const EdgeInsets.all(4), child: SvgPicture.string(SvgIcons.infoCircle)),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: Text(
                            S.of(context).audioNotAvailableInLanguage(warnAboutAudioLanguage.value!),
                            style: DesignSystem.of(context).textStyles.caption1.copyWith(color: DesignSystem.of(context).colors.label2),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: OptionList<String>(
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
                  },
                ),
              ),
              Stack(
                children: [
                  Opacity(
                    opacity: downloadSnapshot.connectionState == ConnectionState.waiting ? 0 : 1,
                    child: Container(
                      margin: const EdgeInsets.only(top: 16),
                      width: double.infinity,
                      child: design.buttons.large(
                        disabled: selectedAudioTrack.value?.id == null || selectedVideoQuality.value == null,
                        onPressed: onDownloadPressed,
                        labelText: S.of(context).downloadButton,
                      ),
                    ),
                  ),
                  if (downloadSnapshot.connectionState == ConnectionState.waiting)
                    Positioned.fill(
                      child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(top: 12),
                        child: const LoadingIndicator(),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CurrentlySelectedWidget extends StatelessWidget {
  const _CurrentlySelectedWidget({
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
                  S.of(context).noSubtitles,
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
                  S.of(context).subtitlesIncluded,
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
                    S.of(context).allSubtitlesWillBeAvailableOffline,
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

Future<Option<T>?> _showSelfClosingPopupOptionList<T>({
  required BuildContext context,
  required String appBarTitle,
  T? startingSelection,
  required List<Option<T>> options,
}) {
  return showModalBottomSheet<Option<T>>(
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
            return OptionList<T>(
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
