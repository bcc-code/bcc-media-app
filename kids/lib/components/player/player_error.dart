import 'package:bccm_player/bccm_player.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import 'package:bccm_core/design_system.dart';

class KidsPlayerError extends StatelessWidget {
  const KidsPlayerError({
    Key? key,
    required this.onRetry,
    this.code,
    this.message,
  }) : super(key: key);
  final void Function() onRetry;
  final String? code;
  final String? message;

  factory KidsPlayerError.fromPlayerError(PlayerError error, {required void Function() onRetry}) {
    return KidsPlayerError(
      code: error.code,
      message: error.message,
      onRetry: onRetry,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: DesignSystem.of(context).colors.background1.withOpacity(0.95),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    S.of(context).somethingWentWrong,
                    style: DesignSystem.of(context).textStyles.title1,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: Text(
                    "${message ?? ''} ${code ?? ''} ",
                    textAlign: TextAlign.center,
                    style: DesignSystem.of(context).textStyles.body1.copyWith(color: DesignSystem.of(context).colors.label3),
                  ),
                ),
                DesignSystem.of(context).buttons.medium(
                      labelText: S.of(context).tryAgainButton,
                      onPressed: () => onRetry(),
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
