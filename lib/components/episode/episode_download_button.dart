import 'package:bccm_player/bccm_player.dart';
import 'package:brunstadtv_app/components/episode/episode_download_sheet.dart';
import 'package:brunstadtv_app/components/misc/parental_gate.dart';
import 'package:brunstadtv_app/components/status/loading_indicator.dart';
import 'package:brunstadtv_app/graphql/queries/episode.graphql.dart';
import 'package:brunstadtv_app/helpers/svg_icons.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';

import '../../theme/design_system/design_system.dart';

class EpisodeDownloadButton extends HookWidget {
  const EpisodeDownloadButton({
    super.key,
    required this.episode,
  });

  final Query$FetchEpisode$episode episode;

  @override
  Widget build(BuildContext context) {
    final bottomSheetFuture = useState<Future?>(null);
    final bottomSheetSnapshot = useFuture(bottomSheetFuture.value, preserveState: false);

    final downloadFuture = useMemoized(() {
      if (bottomSheetFuture.value == null || bottomSheetSnapshot.connectionState == ConnectionState.done && bottomSheetSnapshot.data == true) {
        return DownloaderInterface.instance.getDownloads().then(
              (value) => value.firstWhereOrNull((element) => element.config.additionalData['id'] == episode.id),
            );
      }
    }, [bottomSheetFuture.value, bottomSheetSnapshot, episode.id]);

    final downloadSnapshot = useFuture(downloadFuture, preserveState: false);

    final downloadProgressFuture = useMemoized(() {
      if (downloadSnapshot.data == null) {
        return null;
      }
      return DownloaderInterface.instance.getDownloadStatus(downloadSnapshot.data!.key);
    }, [downloadSnapshot.data]);

    final downloadProgressSnapshot = useFuture(downloadProgressFuture, preserveState: false);

    final design = DesignSystem.of(context);

    if (downloadSnapshot.connectionState == ConnectionState.waiting || downloadProgressSnapshot.connectionState == ConnectionState.waiting) {
      return const LoadingIndicator(width: 20, height: 20);
    } else if (downloadProgressSnapshot.data != null && downloadProgressSnapshot.data! < 1.0) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 3, right: 8),
            child: Text(
              'Downloading',
              style: design.textStyles.caption1.copyWith(color: design.colors.tint1),
            ),
          ),
          SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              value: clampDouble(downloadProgressSnapshot.data!, 0, 1),
              strokeWidth: 2,
              color: DesignSystem.of(context).colors.tint1,
            ),
          ),
        ],
      );
    } else if (downloadProgressSnapshot.data != null && downloadProgressSnapshot.data! == 1.0) {
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
                  'Available offline',
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
    } else {
      return GestureDetector(
        onTap: () async {
          if (!await checkParentalGate(context)) {
            return;
          }
          if (!context.mounted) return;
          bottomSheetFuture.value = showModalBottomSheet(
            useRootNavigator: true,
            context: context,
            isScrollControlled: true,
            builder: (ctx) => EpisodeDownloadSheet(
              episode: episode,
              parentContext: context,
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
