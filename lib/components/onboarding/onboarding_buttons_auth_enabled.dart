import 'package:brunstadtv_app/components/status/loading_indicator.dart';
import 'package:brunstadtv_app/providers/feature_flags.dart';

import 'package:flutter/material.dart';
import 'package:bccm_core/design_system.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../helpers/widget_keys.dart';
import '../../l10n/app_localizations.dart';

class OnboardingButtons extends HookConsumerWidget {
  const OnboardingButtons({
    super.key,
    required this.loginAction,
    required this.exploreAction,
    required this.signupAction,
  });

  final Future Function() loginAction;
  final void Function() exploreAction;
  final void Function() signupAction;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authEnabled = ref.watch(featureFlagsProvider.select((value) => value.auth));
    final signupEnabled = ref.watch(featureFlagsProvider.select((value) => value.publicSignup));
    final loginFuture = useState<Future?>(null);
    final loginSnapshot = useFuture(loginFuture.value);
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
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Stack(
            fit: StackFit.passthrough,
            children: [
              DesignSystem.of(context).buttons.large(
                    key: WidgetKeys.signInButton,
                    labelText: S.of(context).signInButton,
                    onPressed: () {
                      loginFuture.value = loginAction();
                    },
                  ),
              if (loginSnapshot.connectionState == ConnectionState.waiting)
                Positioned.fill(
                  child: Container(
                    color: Colors.black.withOpacity(0.5),
                    child: const Center(
                      child: LoadingIndicator(),
                    ),
                  ),
                ),
            ],
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
