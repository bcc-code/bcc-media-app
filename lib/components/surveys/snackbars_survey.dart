import 'package:brunstadtv_app/helpers/ui/svg_icons.dart';
import 'package:brunstadtv_app/theme/bccm_colors.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../graphql/queries/survey.graphql.dart';
import '../../helpers/ui/btv_buttons.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/surveys.dart';
import '../../theme/bccm_typography.dart';
import 'bottom_sheet/bottom_sheet_survey.dart';

class SnackbarsSurvey extends ConsumerWidget {
  const SnackbarsSurvey({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final surveys = ref.watch(surveysProvider);

    return surveys.when(
      error: (error, stackTrace) {
        FirebaseCrashlytics.instance.recordError(error, stackTrace);
        return const SizedBox.shrink();
      },
      loading: () => const SizedBox.shrink(),
      data: (surveyItems) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: surveyItems.map((survey) => _Snackbar(survey)).toList(),
        );
      },
    );
  }
}

class _Snackbar extends StatelessWidget {
  final Fragment$Survey survey;

  const _Snackbar(this.survey);

  openBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) {
        return BottomSheetSurvey(survey);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
      decoration: const BoxDecoration(
        color: BccmColors.background2,
        border: Border(top: BorderSide(color: BccmColors.separatorOnLight, width: 1)),
      ),
      child: SizedBox(
        height: 34,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 16),
              child: SvgPicture.string(
                SvgIcons.feedbackStar,
                colorFilter: const ColorFilter.mode(BccmColors.tint1, BlendMode.srcIn),
                width: 24,
                height: 24,
              ),
            ),
            Expanded(child: Text(survey.title, style: BccmTextStyles.title3)),
            Container(
              margin: const EdgeInsets.only(right: 8),
              child: BtvButton.small(
                labelText: S.of(context).open,
                onPressed: () => openBottomSheet(context),
              ),
            ),
            SvgPicture.string(SvgIcons.close),
          ],
        ),
      ),
    );
  }
}
