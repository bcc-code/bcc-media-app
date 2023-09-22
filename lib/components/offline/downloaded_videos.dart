import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:bccm_player/bccm_player.dart';
import 'package:brunstadtv_app/components/badges/download_status_badge.dart';
import 'package:brunstadtv_app/components/menus/bottom_sheet_select.dart';
import 'package:brunstadtv_app/components/menus/option_list.dart';
import 'package:brunstadtv_app/components/misc/generic_dialog.dart';
import 'package:brunstadtv_app/components/pages/sections/section_with_header.dart';
import 'package:brunstadtv_app/components/profile/empty_info.dart';
import 'package:brunstadtv_app/models/offline/download_additional_data.dart';
import 'package:brunstadtv_app/providers/availability.dart';
import 'package:brunstadtv_app/providers/downloads.dart';
import 'package:brunstadtv_app/providers/playback_service.dart';
import 'package:brunstadtv_app/router/router.gr.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';
import 'package:focusable_control_builder/focusable_control_builder.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../components/misc/custom_grid_view.dart';
import '../../components/status/error_generic.dart';
import '../../components/status/loading_generic.dart';
import '../../components/thumbnails/grid/thumbnail_grid_episode.dart';
import '../../helpers/misc.dart';
import '../../helpers/svg_icons.dart';
import '../../helpers/time.dart';
import '../../models/analytics/downloads.dart';
import '../../models/analytics/sections.dart';
import '../../models/episode_thumbnail_data.dart';
import '../../providers/analytics.dart';
import '../../providers/inherited_data.dart';
import '../../theme/design_system/design_system.dart';
import '../thumbnails/misc/bordered_image_container.dart';

class DownloadedVideosSection extends ConsumerWidget {
  const DownloadedVideosSection({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final design = DesignSystem.of(context);
    return SectionWithHeader(
      title: S.of(context).downloaded,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 250),
        child: ref.watch(downloadsProvider).when(
              skipLoadingOnReload: true,
              loading: () => const Center(child: LoadingGeneric()),
              error: (err, st) => ErrorGeneric(
                description: err.toString(),
                details: st.toString(),
                onRetry: () {
                  ref.invalidate(downloadsProvider);
                },
              ),
              data: (data) {
                if (data.isEmpty) {
                  return Container(
                    padding: const EdgeInsets.all(16),
                    width: double.infinity,
                    child: EmptyInfo(
                      icon: SvgPicture.string(
                        SvgIcons.download,
                        height: 36,
                        colorFilter: ColorFilter.mode(design.colors.onTint, BlendMode.srcIn),
                      ),
                      title: S.of(context).saveVideosForOfflineViewing,
                      details: S.of(context).tapOnTheDownloadIcon,
                    ),
                  );
                } else {
                  return _DownloadedContent(data);
                }
              },
            ),
      ),
    );
  }
}

class _DownloadedContent extends HookConsumerWidget {
  const _DownloadedContent(this.items);

  final List<Download> items;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InheritedData<SectionAnalytics>(
      inheritedData: const SectionAnalytics(
        id: 'downloaded',
        position: 0,
        type: 'downloaded',
        name: 'Downloaded',
        pageCode: 'profile',
      ),
      child: (context) {
        return CustomGridView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: items.mapIndexed((index, item) {
            if (item.status != DownloadStatus.finished) {
              return _DownloadingGridItem(item: item);
            } else {
              final episodeId = item.config.typedAdditionalData.episodeId;
              final availableTo = episodeId == null ? null : ref.watch(episodeAvailabilityProvider(episodeId)).valueOrNull?.availableTo;
              final expiresAt = getEarliestNullableDateTime([
                item.config.typedAdditionalData.expiresAt,
                availableTo,
              ]);
              return _DownloadSectionItemClickWrapper(
                download: item,
                analytics: SectionItemAnalytics(
                  id: item.config.typedAdditionalData.episodeId ?? index.toString(),
                  name: item.config.title,
                  type: 'download',
                  position: index,
                ),
                child: ThumbnailGridEpisode(
                  useCache: true,
                  episode: EpisodeThumbnailData(
                    title: item.config.title,
                    duration: ((item.config.typedAdditionalData.durationMs ?? 0) / Duration.millisecondsPerSecond).round(),
                    image: item.config.typedAdditionalData.artworkUri,
                    locked: false,
                    progress: null,
                    publishDate: null,
                  ),
                  showSecondaryTitle: false,
                  aspectRatio: 16 / 9,
                  expiresAt: expiresAt,
                ),
              );
            }
          }).toList(),
        );
      },
    );
  }
}

class _DownloadingGridItem extends ConsumerWidget {
  const _DownloadingGridItem({
    required this.item,
  });

  final Download item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FocusableControlBuilder(
      onPressed: () {
        if (item.status == DownloadStatus.failed) {
          showDialog(
            context: context,
            builder: (context) => GenericDialog(
              title: S.of(context).anErrorOccurred,
              description: S.of(context).checkNetwork,
              dismissButtonText: S.of(context).ok,
            ),
          );
          return;
        }
        final episodeId = item.config.typedAdditionalData.episodeId;
        if (episodeId == null) return;
        context.navigateTo(EpisodeScreenRoute(episodeId: episodeId));
      },
      onLongPressed: () {
        _showDownloadItemBottomSheet(
          context,
          download: item,
          notifier: ref.read(downloadsProvider.notifier),
        );
      },
      builder: (context, control) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Opacity(
                opacity: control.isFocused || control.isHovered ? 0.45 : 0.3,
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: BorderedImageContainer(
                    imageUrl: item.config.typedAdditionalData.artworkUri,
                    useCache: true,
                  ),
                ),
              ),
              Positioned.fill(
                child: Center(
                  child: DownloadStatusBadge(item),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 6, bottom: 2),
            child: Text(
              item.config.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: DesignSystem.of(context).textStyles.caption1.copyWith(color: DesignSystem.of(context).colors.label1),
            ),
          ),
        ],
      ),
    );
  }
}

class _DownloadSectionItemClickWrapper extends ConsumerWidget {
  const _DownloadSectionItemClickWrapper({required this.download, required this.child, required this.analytics});

  final Download download;
  final SectionItemAnalytics analytics;
  final Widget child;

  onTap(BuildContext context, WidgetRef ref) {
    ref.read(playbackServiceProvider).openFullscreen(context).then((_) {
      if (BccmPlayerController.primary.value.currentMediaItem?.isOffline == true) {
        BccmPlayerController.primary.stop(reset: false);
      }
    });
    ref.read(playbackServiceProvider).playDownload(download);
    tryCatchRecordError(() {
      ref.read(analyticsProvider).videoDownloadPlayed(
            VideoDownloadPlayedEvent(
              downloadId: download.key,
              episodeId: download.config.typedAdditionalData.episodeId,
            ),
          );
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InheritedData<SectionItemAnalytics>(
      inheritedData: analytics,
      child: (context) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => onTap(context, ref),
        onLongPress: () async {
          _showDownloadItemBottomSheet(
            context,
            download: download,
            notifier: ref.read(downloadsProvider.notifier),
          );
        },
        child: child,
      ),
    );
  }
}

void _showDownloadItemBottomSheet(
  BuildContext context, {
  required Download download,
  required DownloadsNotifier notifier,
}) async {
  HapticFeedback.heavyImpact();
  await showModalBottomSheet(
    useRootNavigator: true,
    context: context,
    builder: (ctx) => BottomSheetSelect(
      title: 'Options',
      selectedId: '',
      items: [
        Option(
          id: 'remove_download',
          title: S.of(context).remove,
          icon: Image.asset(width: 24, height: 24, 'assets/icons/Close.png', gaplessPlayback: true),
        )
      ],
      showSelection: false,
      onSelectionChanged: (id) async {
        if (id == 'remove_download') {
          await notifier.removeDownload(download.key);
          if (context.mounted) {
            tryCatchRecordError(() {
              ProviderScope.containerOf(context).read(analyticsProvider).videoDownloadRemoved(
                    VideoDownloadRemovedEvent(
                      downloadId: download.key,
                      episodeId: download.config.typedAdditionalData.episodeId,
                    ),
                  );
            });
            Navigator.maybePop(context);
          }
        }
      },
    ),
  );
}
