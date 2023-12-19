import 'package:auto_route/auto_route.dart';
import 'package:bccm_player/bccm_player.dart';
import 'package:brunstadtv_app/components/episode/episode_download_sheet.dart';
import 'package:brunstadtv_app/components/misc/generic_dialog.dart';
import 'package:brunstadtv_app/components/misc/parental_gate.dart';
import 'package:brunstadtv_app/components/status/loading_indicator.dart';
import 'package:bccm_core/platform.dart';
import 'package:brunstadtv_app/helpers/svg_icons.dart';
import 'package:brunstadtv_app/helpers/translations.dart';
import 'package:brunstadtv_app/models/offline/download_additional_data.dart';
import 'package:brunstadtv_app/providers/downloads.dart';
import 'package:brunstadtv_app/providers/playback_service.dart';
import 'package:brunstadtv_app/router/router.gr.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:focusable_control_builder/focusable_control_builder.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../l10n/app_localizations.dart';
import 'package:bccm_core/design_system.dart';

class EpisodeDownloadButton extends HookConsumerWidget {
  const EpisodeDownloadButton({
    super.key,
    required this.episode,
  });

  final Query$FetchEpisode$episode episode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final downloadSnapshot = ref.watch(
      downloadsProvider.select(
        (value) => value.when<AsyncValue<Download?>>(
          data: (data) => AsyncValue.data(
            data.firstWhereOrNull(
              (element) => element.status != DownloadStatus.failed && element.config.typedAdditionalData.episodeId == episode.id,
            ),
          ),
          error: (err, st) => AsyncValue.error(err, st),
          loading: () => const AsyncValue.loading(),
        ),
      ),
    );

    final download = downloadSnapshot.valueOrNull;

    final design = DesignSystem.of(context);
    if (downloadSnapshot.isLoading) {
      return const LoadingIndicator(width: 20, height: 20);
    } else if (download != null && download.status != DownloadStatus.finished && download.fractionDownloaded < 1.0) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 3, right: 8),
            child: Text(
              download.status.translate(context),
              style: design.textStyles.caption1.copyWith(color: design.colors.tint1),
            ),
          ),
          SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              value: clampDouble(download.fractionDownloaded, 0, 1),
              strokeWidth: 2,
              color: design.colors.tint1,
            ),
          ),
        ],
      );
    } else if (download?.status == DownloadStatus.finished) {
      return FocusableControlBuilder(onPressed: () {
        context.navigateTo(const ProfileWrapperScreenRoute());
      }, builder: (context, control) {
        return Container(
          decoration: ShapeDecoration(
            color: design.colors.separatorOnLight,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32),
            ),
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8, bottom: 3),
                  child: Text(
                    S.of(context).availableOffline,
                    style: design.textStyles.caption1.copyWith(color: design.colors.tint1),
                  ),
                ),
                Container(
                  height: 20,
                  width: 20,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(right: 4),
                  child: SvgPicture.string(
                    SvgIcons.chevronRight,
                    height: 9,
                    fit: BoxFit.scaleDown,
                    colorFilter: ColorFilter.mode(design.colors.tint1, BlendMode.srcIn),
                  ),
                ),
              ],
            ),
          ),
        );
      });
    } else {
      return GestureDetector(
        onTap: () async {
          if (!await checkParentalGate(context)) {
            return;
          }
          if (!context.mounted) return;
          final downloadUrl = episode.streams.getDownloadableStream()?.url;
          if (downloadUrl == null) {
            showDialog(
              context: context,
              builder: (context) => GenericDialog(
                title: S.of(context).anErrorOccurred,
                description: "This video can't be downloaded.",
                dismissButtonText: S.of(context).ok,
                titleStyle: design.textStyles.title2.copyWith(color: design.colors.onTint),
                descriptionStyle: design.textStyles.body2.copyWith(color: design.colors.label3),
              ),
            );
            return;
          }
          showModalBottomSheet(
            useRootNavigator: true,
            context: context,
            isScrollControlled: true,
            builder: (ctx) => EpisodeDownloadSheet(
              episode: episode,
              parentContext: context,
              downloadUrl: downloadUrl,
            ),
          );
        },
        behavior: HitTestBehavior.opaque,
        child: FocusableActionDetector(
          mouseCursor: MaterialStateMouseCursor.clickable,
          child: Padding(
            padding: const EdgeInsets.only(top: 4, left: 6, right: 6),
            child: SvgPicture.string(
              SvgIcons.download,
              height: 24,
            ),
          ),
        ),
      );
    }
  }
}
