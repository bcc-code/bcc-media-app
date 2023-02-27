import 'package:brunstadtv_app/helpers/btv_buttons.dart';
import 'package:brunstadtv_app/helpers/transparent_image.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';
import 'package:brunstadtv_app/theme/bccm_typography.dart';
import 'package:flutter/material.dart';

class PlayerError extends StatelessWidget {
  const PlayerError({
    super.key,
    required this.onRetry,
    required this.imageUrl,
  });
  final void Function() onRetry;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onRetry,
        child: Stack(
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: imageUrl == null
                  ? null
                  : LayoutBuilder(
                      builder: (context, constraints) {
                        return Opacity(
                          opacity: 0.2,
                          child: FadeInImage.memoryNetwork(
                              fit: BoxFit.cover,
                              placeholder: kTransparentImage,
                              image: imageUrl!,
                              fadeInDuration: const Duration(milliseconds: 150),
                              imageCacheHeight: (constraints.maxHeight * MediaQuery.of(context).devicePixelRatio).round()),
                        );
                      },
                    ),
            ),
            Center(
                child: SizedBox(
              width: 343,
              child: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      S.of(context).anErrorOccurred,
                      textAlign: TextAlign.center,
                      style: BccmTextStyles.title3,
                    ),
                    Text(
                      S.of(context).checkNetwork,
                      textAlign: TextAlign.center,
                      style: BccmTextStyles.body2,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: BtvButton.small(
                        onPressed: onRetry,
                        labelText: S.of(context).tryAgainButton,
                      ),
                    )
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
