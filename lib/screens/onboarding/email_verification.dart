import 'dart:async';

import 'package:brunstadtv_app/components/loading_generic.dart';
import 'package:brunstadtv_app/components/onboarding/email_verification/email_verification_success_page.dart';
import 'package:brunstadtv_app/components/onboarding/email_verification/email_verification_prompt_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../graphql/queries/me.graphql.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/analytics.dart';
import '../../providers/me_provider.dart';

class EmailVerificationScreen extends HookConsumerWidget {
  const EmailVerificationScreen({super.key});

  void useInterval(VoidCallback callback, Duration delay) {
    final savedCallback = useRef(callback);
    savedCallback.value = callback;

    useEffect(() {
      final timer = Timer.periodic(delay, (_) => savedCallback.value());
      return timer.cancel;
    }, [delay]);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final meExplicitFuture = useState<Future<Query$me?>?>(null);
    final meExplicitAsyncValue = useFuture<Query$me?>(meExplicitFuture.value);
    useOnAppLifecycleStateChange((previous, current) {
      if (current == AppLifecycleState.resumed) {
        ref.refresh(meProvider);
        meExplicitFuture.value = Future.delayed(
          const Duration(milliseconds: 1500),
          () => ref.read(meProvider.future),
        );
      }
    });

    useInterval(() {
      if (meExplicitAsyncValue.connectionState == ConnectionState.waiting) {
        return;
      }
      ref.refresh(meProvider);
    }, const Duration(seconds: 5));

    final mePollState = ref.watch(meProvider);

    // ignore: exhaustive_keys
    useMemoized(() => ref.read(analyticsProvider).screen('verify-email'));

    Widget getPage() {
      if (mePollState.valueOrNull?.me.emailVerified == true) {
        return const EmailVerificationSuccessPage();
      }
      if (meExplicitFuture.value != null && meExplicitAsyncValue.connectionState == ConnectionState.waiting) {
        return const LoadingGeneric(text: 'Confirming your account');
      }
      return const EmailVerificationPromptPage();
    }

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 44,
          leadingWidth: 92,
          title: AnimatedSwitcher(
            duration: const Duration(milliseconds: 150),
            reverseDuration: Duration.zero,
            child: Text(S.of(context).signUpTitle),
          ),
          leading: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => Navigator.maybePop(context),
            child: Padding(
              padding: const EdgeInsets.only(left: 16, top: 12),
              child: Text(
                S.of(context).cancel,
              ),
            ),
          ),
        ),
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: getPage(),
        ),
      ),
    );
  }
}
