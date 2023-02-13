import 'package:brunstadtv_app/helpers/btv_gradients.dart';
import 'package:brunstadtv_app/models/analytics/achievement_shared.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';

import '../graphql/queries/achievements.graphql.dart';
import '../helpers/btv_buttons.dart';
import '../helpers/btv_colors.dart';
import '../helpers/btv_typography.dart';
import '../helpers/image_utils.dart';
import '../helpers/svg_icons.dart';
import '../l10n/app_localizations.dart';
import '../providers/analytics.dart';
import '../services/share_image.dart';
import '../services/utils.dart';
import '../services/widget_to_image.dart';
import 'dialog_with_image.dart';
import 'loading_indicator.dart';

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
              child: BtvButton.smallSecondary(
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
                    AchievementShareRender(achievement: widget.achievement, imageBytes: achievementImageData.bodyBytes),
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          width: 400,
          height: 350,
          color: BtvColors.background2,
          child: Stack(
            children: [
              Positioned.fill(
                child: Container(
                  decoration: const BoxDecoration(gradient: BtvGradients.purpleTransparent),
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
                          style: BtvTextStyles.body2.copyWith(color: BtvColors.label3),
                        ),
                      ),
                    Text(
                      achievement.title,
                      style: BtvTextStyles.headline2,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
