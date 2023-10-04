import 'dart:async';
import 'package:bccm_player/bccm_player.dart';
import 'package:brunstadtv_app/components/misc/parental_gate.dart';
import 'package:brunstadtv_app/graphql/client.dart';
import 'package:brunstadtv_app/graphql/queries/me.graphql.dart';
import 'package:brunstadtv_app/providers/auth_state/auth_state.dart';
import 'package:brunstadtv_app/providers/feature_flags.dart';
import 'package:flutter/foundation.dart';
import 'package:universal_io/io.dart';
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/helpers/svg_icons.dart';
import 'package:brunstadtv_app/helpers/misc.dart';
import 'package:brunstadtv_app/helpers/version.dart';
import 'package:brunstadtv_app/models/scroll_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../api/brunstadtv.dart';
import '../../components/offline/offline_home.dart';
import '../../flavors.dart';
import '../../graphql/queries/application.graphql.dart';
import '../../providers/connectivity.dart';
import '../../theme/design_system/design_system.dart';
import '../../components/pages/page_renderer.dart';
import '../../graphql/queries/page.graphql.dart';

import '../../components/pages/page_mixin.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/app_config.dart';

@RoutePage<void>()
class HomeScreen extends ConsumerStatefulWidget {
  HomeScreen({Key? key}) : super(key: key ?? GlobalKey<HomeScreenState>());

  @override
  ConsumerState<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends ConsumerState<HomeScreen> with PageMixin implements ScrollScreen {
  late ProviderSubscription<Future<Query$Application?>> _appConfigListener;
  bool tooltipDismissed = false;
  String loginError = '';
  final pageScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    pageResult = wrapInCompleter(getHomePage());
    showDialogIfOldAppVersion();
    _appConfigListener = ref.listenManual<Future<Query$Application?>>(appConfigFutureProvider, (prev, next) async {
      showDialogIfOldAppVersion();
    });
  }

  @override
  void scrollToTop() {
    pageScrollController.animateTo(0, duration: const Duration(milliseconds: 500), curve: Curves.easeOutExpo);
  }

  @override
  void dispose() {
    _appConfigListener.close();
    super.dispose();
  }

  void showDialogIfOldAppVersion() async {
    final appConfig = await ref.read(appConfigFutureProvider);
    if (appConfig == null) return;
    final packageInfo = await PackageInfo.fromPlatform();
    final minVersionNumber = appConfig.application.clientVersion;
    final currentVersionNumber = packageInfo.version;
    if (getExtendedVersionNumber(minVersionNumber) > getExtendedVersionNumber(currentVersionNumber) && context.mounted) {
      showDialog(
          context: context,
          builder: (context) {
            return SimpleDialog(
              title: Text(
                S.of(context).appUpdateTitle,
                style: DesignSystem.of(context).textStyles.title3,
              ),
              contentPadding: const EdgeInsets.all(24).copyWith(top: 8),
              children: [
                Padding(padding: const EdgeInsets.only(bottom: 16), child: Text(S.of(context).appUpdateRequest)),
                DesignSystem.of(context).buttons.medium(
                    onPressed: () {
                      if (Platform.isIOS) {
                        launchUrlString('itms-apps://itunes.apple.com', mode: LaunchMode.externalApplication);
                      } else if (Platform.isAndroid) {
                        launchUrlString('market://details?id=tv.brunstad.app', mode: LaunchMode.externalApplication);
                      }
                    },
                    labelText: S.of(context).appUpdateAccepted)
              ],
            );
          });
    }

    if (ref.read(authStateProvider).auth0AccessToken != null) {
      final me = await ref.read(gqlClientProvider).query$me();
      if (!ref.read(featureFlagsProvider).publicSignup &&
          (me.parsedData?.me.completedRegistration != true || me.parsedData?.me.emailVerified != true)) {
        // ignore: use_build_context_synchronously
        await showDialog(
          context: context,
          builder: (context) {
            return SimpleDialog(
              title: Text(
                S.of(context).appUpdateTitle,
                style: DesignSystem.of(context).textStyles.title3,
              ),
              contentPadding: const EdgeInsets.all(24).copyWith(top: 8),
              children: [
                const Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: Text("Unfortunately, we don't support signing up yet. Are you sure you signed in with the correct email?")),
                DesignSystem.of(context).buttons.medium(
                      onPressed: () => Navigator.pop(context),
                      labelText: S.of(context).ok,
                    )
              ],
            );
          },
        );
        ref.read(authStateProvider.notifier).logout();
      }
    }
  }

  Future<Query$Page$page> getHomePage() async {
    final api = ref.read(apiProvider);
    return ref.read(appConfigFutureProvider).then((value) {
      final code = value?.application.page?.code;
      if (code == null) {
        throw ErrorHint('Application config error');
      }
      return api.getPage(code);
    });
  }

  Future<Query$Page$page> getHomeAndAppConfig() async {
    reloadAppConfig(ref);
    return getHomePage();
  }

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);

    final isOffline = ref.watch(isOfflineProvider);
    return isOffline
        ? const OfflineHome()
        : Scaffold(
            extendBodyBehindAppBar: true,
            appBar: kIsWeb
                ? null
                : AppBar(
                    toolbarHeight: 44,
                    shadowColor: Colors.black,
                    backgroundColor: design.appThemeData.appBarTransparent ? Colors.transparent : design.colors.background1,
                    elevation: 0,
                    centerTitle: true,
                    title: Image(
                      image: FlavorConfig.current.bccmImages!.logo,
                      height: FlavorConfig.current.bccmImages!.logoHeight,
                      gaplessPlayback: true,
                    ),
                    leadingWidth: kIsWeb ? 300 : 100,
                    actions: [
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: ConstrainedBox(
                          constraints: BoxConstraints.loose(const Size(24, 24)),
                          child: CastButton(color: DesignSystem.of(context).colors.tint1),
                        ),
                      ),
                    ],
                    flexibleSpace: !design.appThemeData.appBarTransparent
                        ? null
                        : ClipRect(
                            clipBehavior: Clip.hardEdge,
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 12, sigmaY: 6),
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [DesignSystem.of(context).colors.background1, Colors.transparent],
                                  ),
                                ),
                                height: 1000,
                              ),
                            ),
                          ),
                  ),
            body: SafeArea(
              top: false,
              child: PageRenderer(
                pageFuture: pageResult.future,
                onRefresh: ({bool? retry}) async {
                  setState(() {
                    pageResult = wrapInCompleter(retry == true ? getHomeAndAppConfig() : getHomePage());
                  });
                },
                scrollController: pageScrollController,
              ),
            ),
          );
  }
}
