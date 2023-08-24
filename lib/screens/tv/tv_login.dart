import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/api/auth0_api.dart';
import 'package:brunstadtv_app/components/status_indicators/error_generic.dart';
import 'package:brunstadtv_app/components/status_indicators/loading_indicator.dart';
import 'package:brunstadtv_app/flavors.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';
import 'package:brunstadtv_app/providers/auth_state/auth_state.dart';
import 'package:brunstadtv_app/router/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';

class TvLoginScreen extends HookConsumerWidget {
  const TvLoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth0Api = ref.watch(auth0ApiProvider);
    final authStateNotifier = ref.watch(authStateProvider.notifier);
    final deviceCodeFuture = useMemoized(() => auth0Api.fetchDeviceCode(scope: 'openid profile offline_access church country'), [auth0Api]);
    final deviceCode = useFuture(deviceCodeFuture);

    final loginFuture = useMemoized(() {
      if (deviceCode.data != null) {
        final f = authStateNotifier.loginViaDeviceCode(deviceCode.data!);
        f.then((_) {
          if (context.mounted) {
            context.router.replace(const TvLiveScreenRoute());
          }
        });
        return f;
      } else {
        return null;
      }
    }, [deviceCode.data, authStateNotifier]);

    final loginSnapshot = useFuture(loginFuture);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (loginSnapshot.hasError || deviceCode.hasError)
              ErrorGeneric(
                title: S.of(context).loginFailedCheckNetwork,
                description: '${loginSnapshot.error}',
                retryButtonText: 'Retry',
                onRetry: () {},
              )
            else ...[
              Image(
                image: FlavorConfig.current.images.logo,
                height: FlavorConfig.current.images.logoHeight,
                gaplessPlayback: true,
              ),
              if (deviceCode.data != null)
                QrImageView(
                  data: deviceCode.data!.verificationUriComplete,
                  version: QrVersions.auto,
                  eyeStyle: const QrEyeStyle(
                    color: Colors.white,
                    eyeShape: QrEyeShape.square,
                  ),
                  errorCorrectionLevel: QrErrorCorrectLevel.L,
                  dataModuleStyle: const QrDataModuleStyle(
                    dataModuleShape: QrDataModuleShape.square,
                    color: Colors.white,
                  ),
                  size: 200.0,
                )
              else if (deviceCode.hasError)
                Text('${deviceCode.error}')
              else
                const LoadingIndicator(),
            ]
          ],
        ),
      ),
    );
  }
}
