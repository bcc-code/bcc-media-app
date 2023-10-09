import 'package:brunstadtv_app/providers/feature_flags.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../theme/design_system/design_system.dart';
import '../../helpers/widget_keys.dart';
import '../../l10n/app_localizations.dart';

class OnboardingButtons extends ConsumerWidget {
  const OnboardingButtons({
    super.key,
    required this.loginAction,
    required this.exploreAction,
    required this.signupAction,
  });

  final void Function() loginAction;
  final void Function() exploreAction;
  final void Function() signupAction;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authEnabled = ref.watch(featureFlagsProvider.select((value) => value.auth));
    final signupEnabled = ref.watch(featureFlagsProvider.select((value) => value.publicSignup));
    if (!authEnabled) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: DesignSystem.of(context).buttons.large(
              key: WidgetKeys.exploreButton,
              labelText: S.of(context).exploreContent,
              onPressed: exploreAction,
            ),
      );
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 12),
          child: DesignSystem.of(context).buttons.large(
                key: WidgetKeys.signInButton,
                labelText: S.of(context).signInButton,
                onPressed: loginAction,
              ),
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: !signupEnabled
              ? null
              : Builder(builder: (context) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    width: double.infinity,
                    child: DesignSystem.of(context).buttons.large(
                          variant: ButtonVariant.secondary,
                          key: WidgetKeys.signUpButton,
                          onPressed: signupAction,
                          labelText: S.of(context).signUpButton,
                        ),
                  );
                }),
        ),
        DesignSystem.of(context).buttons.medium(
              key: WidgetKeys.exploreButton,
              labelText: S.of(context).explorePublicContent,
              onPressed: exploreAction,
              backgroundColor: Colors.transparent,
              border: Border.all(color: Colors.transparent),
            )
      ],
    );
  }
}
