import 'package:bccm_core/bccm_core.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';

import 'package:flutter/material.dart';

import 'package:bccm_core/design_system.dart';

class PlayerErrorView extends StatelessWidget {
  const PlayerErrorView({
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
                          child: FadeInImage(
                            fit: BoxFit.cover,
                            placeholder: MemoryImage(kTransparentImage),
                            image: networkImageWithRetryAndResize(
                              imageUrl: imageUrl!,
                              cacheHeight: (constraints.maxHeight * MediaQuery.devicePixelRatioOf(context)).round(),
                            ),
                            imageErrorBuilder: imageErrorBuilder,
                            fadeInDuration: const Duration(milliseconds: 150),
                          ),
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
                      style: DesignSystem.of(context).textStyles.title3,
                    ),
                    Text(
                      S.of(context).checkNetwork,
                      textAlign: TextAlign.center,
                      style: DesignSystem.of(context).textStyles.body2,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: DesignSystem.of(context).buttons.small(
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
