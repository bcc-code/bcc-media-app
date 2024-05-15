import 'dart:async';
import 'package:bccm_player/bccm_player.dart';
import 'package:brunstadtv_app/components/misc/app_update_dialog.dart';
import 'package:bccm_core/platform.dart';
import 'package:bccm_core/bccm_core.dart';
import 'package:brunstadtv_app/helpers/app_theme.dart';
import 'package:brunstadtv_app/providers/feature_flags.dart';
import 'package:flutter/foundation.dart';
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/models/scroll_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../api/brunstadtv.dart';
import '../../components/offline/offline_home.dart';
import '../../flavors.dart';
import 'package:bccm_core/design_system.dart';
import '../../components/pages/page_renderer.dart';

import '../../components/pages/page_mixin.dart';
import '../../l10n/app_localizations.dart';

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
    _appConfigListener = ref.listenManual(appConfigFutureProvider, (prev, next) async {
      pageResult = wrapInCompleter(getHomePage());
      final value = await next;
      if (value == null) return;
      if (!mounted) return;
      if (isOldAppVersion(context, value)) {
        showDialog(
          context: context,
          builder: (context) => const AppUpdateDialog(),
        );
      }
      signupFeatureFlagCheck();
    }, fireImmediately: true);
  }

  @override
  void scrollToTop() {
    if (!pageScrollController.hasClients) return;
    pageScrollController.animateTo(0, duration: const Duration(milliseconds: 500), curve: Curves.easeOutExpo);
  }

  @override
  void dispose() {
    _appConfigListener.close();
    pageScrollController.dispose();
    super.dispose();
  }

  void signupFeatureFlagCheck() async {
    if (ref.read(authStateProvider).auth0AccessToken != null) {
      final me = await ref.read(bccmGraphQLProvider).query$me();
      if (!mounted) return;
      if (!ref.read(featureFlagsProvider).publicSignup &&
          (me.parsedData?.me.completedRegistration != true || me.parsedData?.me.emailVerified != true)) {
        if (!mounted) return;
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
      final code = value.application.page?.code;
      if (code == null) {
        throw ErrorHint('Application config error');
      }
      return api.getPage(code);
    });
  }

  Future<Query$Page$page> getHomeAndAppConfig() async {
    ref.invalidate(appConfigFutureProvider);
    return getHomePage();
  }

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);

    final isOffline = ref.watch(isOfflineProvider);
    if (isOffline) {
      return const OfflineHome();
    } else {
      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: kIsWeb
            ? null
            : AppBar(
                toolbarHeight: 44,
                shadowColor: Colors.black,
                backgroundColor: AppTheme.of(context).appBarTransparent ? Colors.transparent : design.colors.background1,
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
                flexibleSpace: !AppTheme.of(context).appBarTransparent
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
}
