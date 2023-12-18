import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/components/status/error_generic.dart';
import 'package:brunstadtv_app/components/status/loading_indicator.dart';
import 'package:brunstadtv_app/env/env.dart';
import 'package:brunstadtv_app/flavors.dart';
import 'package:brunstadtv_app/helpers/svg_icons.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';
import 'package:brunstadtv_app/providers/auth.dart';
import 'package:brunstadtv_app/router/router.gr.dart';
import 'package:bccm_core/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:bccm_core/bccm_core.dart';

@RoutePage<void>()
class TvLoginScreen extends HookConsumerWidget {
  const TvLoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authStateNotifier = ref.watch(authStateProvider.notifier);

    final deviceCodeFuture = useState<Future<DeviceTokenRequestResponse>?>(null);
    final deviceCode = useFuture(deviceCodeFuture.value);
    final loginFuture = useState<Future<void>?>(null);
    final loginSnapshot = useFuture(loginFuture.value, preserveState: false);

    final fetchDeviceCode = useCallback(
        () => Auth0Api(audience: Env.auth0Audience, clientId: Env.auth0ClientId, domain: Env.auth0Domain)
            .fetchDeviceCode(scope: 'openid profile offline_access church country'),
        []);

    useEffect(() {
      debugPrint('Get device code for QR');
      deviceCodeFuture.value = fetchDeviceCode();
      return null;
    }, [fetchDeviceCode]);

    final loginFn = useCallback((DeviceTokenRequestResponse code) async {
      try {
        await authStateNotifier.loginViaDeviceCode(code);
        if (context.mounted) {
          context.router.replace(const TvLiveScreenRoute());
        }
      } catch (e) {
        if (e is FailedTokenRetrieval && e.error == 'expired_token') {
          deviceCodeFuture.value = fetchDeviceCode();
        } else {
          rethrow;
        }
      }
    }, [authStateNotifier, fetchDeviceCode]);

    useMemoized(() {
      deviceCodeFuture.value?.then((code) async {
        debugPrint('Starting login polling');
        loginFuture.value = loginFn(code);
      });
    }, [deviceCodeFuture.value, loginFn]);

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
                if (loginSnapshot.hasError || deviceCode.hasError) ...[
                  Expanded(
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      padding: const EdgeInsets.symmetric(vertical: 32),
                      child: Image(
                        image: FlavorConfig.current.bccmImages!.logo,
                        height: FlavorConfig.current.bccmImages!.logoHeight,
                        gaplessPlayback: true,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: ErrorGeneric(
                      title: S.of(context).anErrorOccurred,
                      details: loginSnapshot.error.toString(),
                      onRetry: () {
                        deviceCodeFuture.value = fetchDeviceCode();
                      },
                    ),
                  )
                ] else if (deviceCode.data != null) ...[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 64),
                    child: Image(
                      image: FlavorConfig.current.bccmImages!.logo,
                      height: FlavorConfig.current.bccmImages!.logoHeight,
                      gaplessPlayback: true,
                    ),
                  ),
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
                  ),
                ] else
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
