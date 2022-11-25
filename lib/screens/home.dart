import 'dart:io';
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/components/sign_in_tooltip.dart';
import 'package:brunstadtv_app/helpers/svg_icons.dart';
import 'package:brunstadtv_app/helpers/utils.dart';
import 'package:brunstadtv_app/helpers/version_number_utils.dart';
import 'package:brunstadtv_app/providers/auth_state.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:brunstadtv_app/router/router.gr.dart';

import 'package:bccm_player/cast_button.dart';
import 'package:flutter_svg/svg.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../api/brunstadtv.dart';
import '../graphql/queries/application.graphql.dart';
import '../helpers/btv_buttons.dart';
import '../helpers/btv_colors.dart';
import '../components/page.dart';
import '../graphql/client.dart';
import '../graphql/queries/page.graphql.dart';
import '../helpers/btv_typography.dart';
import '../l10n/app_localizations.dart';
import '../providers/app_config.dart';

final logo = Image.asset('assets/images/logo.png');

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late ProviderSubscription<Future<Query$Application?>> appConfigListener;
  late Future<Query$Page$page> resultFuture;
  bool tooltipDismissed = false;
  String loginError = '';

  @override
  void initState() {
    super.initState();
    resultFuture = getHomePage();
    showDialogIfOldAppVersion();
    appConfigListener = ref.listenManual<Future<Query$Application?>>(appConfigProvider, (prev, next) async {
      showDialogIfOldAppVersion();
    });
  }

  @override
  void dispose() {
    appConfigListener.close();
    super.dispose();
  }

  void showDialogIfOldAppVersion() async {
    final appConfig = await ref.read(appConfigProvider);
    if (appConfig == null) return;
    final packageInfo = await PackageInfo.fromPlatform();
    final minVersionNumber = appConfig.application.clientVersion;
    final currentVersionNumber = packageInfo.version;
    debugPrint(minVersionNumber);
    debugPrint('minVersionNumber ${getExtendedVersionNumber(minVersionNumber)}');
    debugPrint('currentVersionNumber ${getExtendedVersionNumber(currentVersionNumber)}');
    if (minVersionNumber != null && getExtendedVersionNumber(minVersionNumber) > getExtendedVersionNumber(currentVersionNumber)) {
      showDialog(
          context: context,
          builder: (context) {
            return SimpleDialog(
              title: Text(
                S.of(context).appUpdateTitle,
                style: BtvTextStyles.title3,
              ),
              contentPadding: const EdgeInsets.all(24).copyWith(top: 8),
              children: [
                Padding(padding: const EdgeInsets.only(bottom: 16), child: Text(S.of(context).appUpdateRequest)),
                BtvButton.medium(
                    onPressed: () {
                      if (Platform.isIOS) {
                        launchUrlString('itms-apps://itunes.apple.com');
                      } else if (Platform.isAndroid) {
                        launchUrlString('market://search?q=brunstadtv');
                      }
                    },
                    labelText: S.of(context).appUpdateAccepted)
              ],
            );
          });
    }
  }

  Future<void> loginAction(BuildContext context) async {
    final success = await ref.read(authStateProvider.notifier).login();
    if (success) {
      context.router.root.popUntil((route) => false);
      context.router.root.push(const TabsRootScreenRoute());
    } else {
      loginError = 'Login failed';
    }
  }

  Future<Query$Page$page> getHomePage() async {
    final api = ref.read(apiProvider);
    return ref.read(appConfigProvider).then((value) {
      final code = value?.application.page?.code;
      if (code == null) {
        throw ErrorHint('Application config error');
      }
      return api.getPage(code);
    });
  }

  Future<Query$Page$page> retry() async {
    ref.read(appConfigProvider.notifier).state = ref.read(apiProvider).queryAppConfig();
    return getHomePage();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            toolbarHeight: 44,
            shadowColor: Colors.black,
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: logo,
            leadingWidth: 100,
            leading: Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    if (ref.watch(authStateProvider).guestMode) {
                      loginAction(context);
                    } else {
                      context.router.pushNamed('/profile');
                    }
                  },
                  child: Padding(
                      padding: const EdgeInsets.only(left: 18, top: 12, bottom: 12, right: 32),
                      child: SvgPicture.string(
                        SvgIcons.profile,
                      ))),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: ConstrainedBox(constraints: BoxConstraints.loose(const Size(24, 24)), child: const CastButton()),
              ),
            ],
            flexibleSpace: ClipRect(
              clipBehavior: Clip.hardEdge,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 12, sigmaY: 6),
                child: Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [BtvColors.background1, Colors.transparent])),
                  height: 1000,
                ),
              ),
            ),
          ),
          body: SafeArea(
            top: false,
            child: BccmPage(
                pageFuture: resultFuture,
                onRefresh: (r) async {
                  setState(() {
                    resultFuture = r ? retry() : getHomePage();
                  });
                }),
          ),
        ),
        Positioned(
          left: 7 + MediaQuery.of(context).padding.left,
          top: 35 + MediaQuery.of(context).padding.top,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: !ref.read(authStateProvider).guestMode || tooltipDismissed
                ? null
                : Material(
                    color: Colors.transparent,
                    child: GestureDetector(
                      onTap: () {
                        setState(() => tooltipDismissed = true);
                      },
                      child: SignInTooltip(onClose: () {
                        setState(() => tooltipDismissed = true);
                      }),
                    ),
                  ),
          ),
        )
      ],
    );
  }
}
