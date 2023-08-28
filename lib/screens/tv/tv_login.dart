import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/api/auth0_api.dart';
import 'package:brunstadtv_app/components/status_indicators/error_generic.dart';
import 'package:brunstadtv_app/components/status_indicators/loading_indicator.dart';
import 'package:brunstadtv_app/flavors.dart';
import 'package:brunstadtv_app/helpers/ui/svg_icons.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';
import 'package:brunstadtv_app/providers/auth_state/auth_state.dart';
import 'package:brunstadtv_app/router/router.gr.dart';
import 'package:brunstadtv_app/theme/design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
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
    final design = DesignSystem.of(context);
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: DesignSystem.of(context).appThemeData.genericBackgroundGradient,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(0, (-MediaQuery.of(context).size.height * 0.55)),
            child: FractionallySizedBox(
              heightFactor: 1.6,
              child: ShaderMask(
                shaderCallback: (rect) {
                  return const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color.fromRGBO(0, 0, 0, 0.1), Color.fromRGBO(0, 0, 0, 0.01)],
                    stops: [0.5, 1.0],
                  ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
                },
                blendMode: BlendMode.dstIn,
                child: SvgPicture.string(
                  SvgIcons.bccMediaCircles,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 64),
                  child: Image(
                    image: FlavorConfig.current.images.logo,
                    height: FlavorConfig.current.images.logoHeight,
                    gaplessPlayback: true,
                  ),
                ),
                if (loginSnapshot.hasError || deviceCode.hasError)
                  ErrorGeneric(
                    title: S.of(context).loginFailedCheckNetwork,
                    description: '${loginSnapshot.error}',
                    retryButtonText: 'Retry',
                    onRetry: () {},
                  )
                else if (deviceCode.data != null)
                  SizedBox(
                    width: 550,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: QrImageView(
                            data: deviceCode.data!.verificationUriComplete,
                            version: QrVersions.auto,
                            padding: const EdgeInsets.all(16),
                            eyeStyle: const QrEyeStyle(
                              color: Colors.black,
                              eyeShape: QrEyeShape.square,
                            ),
                            errorCorrectionLevel: QrErrorCorrectLevel.L,
                            dataModuleStyle: const QrDataModuleStyle(
                              dataModuleShape: QrDataModuleShape.square,
                              color: Colors.black,
                            ),
                            size: 180.0,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 32, right: 32, bottom: 8),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  S.of(context).tvScanQr,
                                  style: DesignSystem.of(context).textStyles.title1,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 12),
                                  child: Text(
                                    S.of(context).tvEnterCode(deviceCode.data!.verificationUri, deviceCode.data!.userCode),
                                    style: DesignSystem.of(context).textStyles.caption1.copyWith(color: design.colors.label3),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                else
                  const SizedBox(
                    width: 550,
                    child: Center(child: LoadingIndicator()),
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
