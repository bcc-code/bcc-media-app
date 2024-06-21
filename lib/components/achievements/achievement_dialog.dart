import 'package:bccm_core/bccm_core.dart';
import 'package:bccm_core/design_system.dart';
import 'package:brunstadtv_app/flavors.dart';
import 'package:brunstadtv_app/helpers/app_theme.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';

import 'package:bccm_core/platform.dart';
import 'package:brunstadtv_app/theme/design_system/bccmedia/design_system.dart';
import '../../helpers/svg_icons.dart';
import '../../l10n/app_localizations.dart';
import '../../helpers/share_image.dart';
import '../../helpers/widget_to_image.dart';
import '../misc/dialog_with_image.dart';
import '../status/loading_indicator.dart';

class AchievementDialog extends ConsumerStatefulWidget {
  const AchievementDialog({super.key, required this.achievement, this.dismissButtonText});

  final Fragment$Achievement achievement;
  final String? dismissButtonText;

  @override
  ConsumerState<AchievementDialog> createState() => _AchievementDialogState();
}

class _AchievementDialogState extends ConsumerState<AchievementDialog> {
  bool processingShare = false;

  @override
  Widget build(BuildContext context) {
    final image = widget.achievement.image;
    final view = View.of(context);
    return DialogWithImage(
      image: image == null
          ? const SizedBox.shrink()
          : SizedBox(height: 180, child: simpleFadeInImage(url: image, duration: const Duration(milliseconds: 100))),
      title: widget.achievement.title,
      description: widget.achievement.description,
      dismissButtonText: widget.dismissButtonText,
      slotBeforeDismissButton: !widget.achievement.achieved
          ? Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Text(S.of(context).notAchieved),
            )
          : Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: DesignSystem.of(context).buttons.small(
                    variant: ButtonVariant.secondary,
                    onPressed: () async {
                      try {
                        ref.read(analyticsProvider).achievementShared(AchievementSharedEvent(elementTitle: widget.achievement.title));
                      } catch (e) {
                        FirebaseCrashlytics.instance.recordError(e, StackTrace.current);
                      }
                      final sharePositionOrigin = iPadSharePositionOrigin(context);
                      setState(() {
                        processingShare = true;
                      });
                      final achievementImageData = await downloadImage(widget.achievement.image!);

                      var image = await createImageFromWidget(
                        view: view,
                        widget: AchievementShareRender(achievement: widget.achievement, imageBytes: achievementImageData.bodyBytes),
                        wait: const Duration(milliseconds: 500),
                        imageSize: const Size(800, 700),
                        logicalSize: const Size(400, 350),
                      );

                      if (image != null) {
                        final file = XFile.fromData(image, mimeType: 'image/png');
                        Share.shareXFiles(
                          [file],
                          text: '''I've unlocked this achievement badge in the BCC Media app.\nhttps://app.bcc.media/studies''',
                          sharePositionOrigin: sharePositionOrigin,
                        );
                      }
                      setState(() {
                        processingShare = false;
                      });
                    },
                    labelText: S.of(context).share,
                    image: processingShare ? const LoadingIndicator() : SvgPicture.string(SvgIcons.share),
                  ),
            ),
    );
  }
}

class AchievementShareRender extends StatelessWidget {
  final Fragment$Achievement achievement;
  final Uint8List imageBytes;
  const AchievementShareRender({super.key, required this.achievement, required this.imageBytes});

  String? get formattedAchievedAt {
    if (achievement.achievedAt == null) return null;
    var dateTime = DateTime.tryParse(achievement.achievedAt!);
    if (dateTime == null) return null;
    return DateFormat.yMMMMd().format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    final design = BccMediaDesignSystem();
    return DesignSystem(
      designSystem: design,
      builder: (context) => AppTheme(
        theme: FlavorConfig.current.appTheme(context),
        builder: (context) => MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            body: Container(
              width: 400,
              height: 350,
              color: design.colors.background2,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(gradient: AppTheme.of(context).achievementBackgroundGradient),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (achievement.image != null)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 24),
                            child: SizedBox(height: 160, child: Image.memory(imageBytes)),
                          ),
                        if (formattedAchievedAt != null)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 4),
                            child: Text(
                              formattedAchievedAt!,
                              style: DesignSystem.of(context).textStyles.body2.copyWith(color: DesignSystem.of(context).colors.label3),
                            ),
                          ),
                        Text(
                          achievement.title,
                          style: DesignSystem.of(context).textStyles.headline2,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
